module BaseService

    DATA_SYNC_DELAY = 5.minutes

    def up_to_date?
        updated_at >= Time.now - DATA_SYNC_DELAY
    end
  
    module BaseServiceClassMethods
        # Films & People only
        def all_objects
            return self.all if(TableUpdateInfo.up_to_date?(self.table_name)) || %w[people film].exclude?(self.base_name)
  
            swapi_dev_get_all_method = "#{self.base_name}_all"
            SwapiDev.class_eval(swapi_dev_get_all_method)[:results].each do |object_hash|
                next if (obj_id = self.id_from_url(object_hash)).zero?

                self.update_or_create(object_hash) if (obj = self.find_by(id: obj_id)).nil? || !obj.up_to_date?
            end
            TableUpdateInfo.update_or_create(self.table_name)
            self.all
        end

        def find_object(obj_id)
            return (obj = self.find_by(id: obj_id)) if obj&.up_to_date?

            swapi_dev_get_by_id_method = "#{self.base_name}_id(#{obj_id})"
            update_or_create(SwapiDev.class_eval(swapi_dev_get_by_id_method))
            self.find_by(id: obj_id)
        end

        def update_or_create(object_hash)
            return if (obj_id = self.id_from_url(object_hash)).zero?

            %i[films characters residents pilots people planets starships vehicles species].each do |i|
                b_name = %i[characters residents pilots].include?(i) ? 'people' : i.to_s
                if object_hash[i]&.any?
                    object_hash[i] = object_hash[i].map { |str| str.remove("https://swapi.dev/api/#{b_name}/").to_i}
                end
            end
            return true if self.find_by(id: obj_id)&.update_attribute :data_json, object_hash
            
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