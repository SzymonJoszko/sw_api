module BaseService

    DATA_SYNC_DELAY = 1.month

    def up_to_date?
        updated_at >= Time.now - DATA_SYNC_DELAY
    end
  
    module BaseServiceClassMethods
        # Films & People only
        def all_objects\
            query_arel = self.arel_table[:updated_at].gteq(Time.now - DATA_SYNC_DELAY)
            return self.all.where(query_arel) if(TableUpdateInfo.up_to_date?(self.table_name)) || %w[people film].exclude?(self.base_name)
  
            swapi_dev_get_all_method = "#{self.base_name}_all"
            swapi_dev_result = SwapiDev.class_eval(swapi_dev_get_all_method)
            (swapi_dev_result.is_a?(Hash) ? swapi_dev_result[:results] : swapi_dev_result).each do |object_hash|
                next if (obj_id = self.id_from_url(object_hash)).zero?

                self.update_or_create(object_hash) if (obj = self.find_by(id: obj_id)).nil? || !obj.up_to_date?
            end
            TableUpdateInfo.update_or_create(self.table_name)
            self.all.where(query_arel)
        end

        def find_object(obj_id)
            obj = self.find_by(id: obj_id)
            return obj if obj&.up_to_date?
            swapi_dev_get_by_id_method = "#{self.base_name}_id(#{obj_id})"
            update_or_create(SwapiDev.class_eval(swapi_dev_get_by_id_method))
            self.find_by(id: obj_id)
        end

        def update_or_create(object_hash)
            return if (obj_id = self.id_from_url(object_hash)).zero?

            %i[films characters residents pilots people planets starships vehicles species homeworld].each do |i|
                b_name = %i[characters residents pilots].include?(i) ? 'people' : i.to_s
                if i == :homeworld
                    homeworld_id = object_hash[i]&.remove("https://swapi.dev/api/planets/").to_i
                    object_hash[i] = homeworld_id if !homeworld_id.zero?
                elsif object_hash[i]&.any?
                    object_hash[i] = object_hash[i].map { |str| str.remove("https://swapi.dev/api/#{b_name}/").to_i}
                end
            end
            return true if self.find_by(id: obj_id)&.update(data_json: object_hash, updated_at: Time.now)
            
            self.create(id: obj_id, data_json: object_hash)
        end

        def base_name
            return 'people' if self.name == 'Person'

            self.name.underscore
        end

        def id_from_url(object_hash, options = {})
            object_hash.symbolize_keys[:url]&.remove("https://swapi.dev/api/#{options[:base_name] || self.base_name.pluralize}/").to_i
        end
    end

    def self.included(base)
        base.extend(BaseServiceClassMethods)
      end 
end