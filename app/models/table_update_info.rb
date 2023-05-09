class TableUpdateInfo < ApplicationRecord
    validates :t_name, uniqueness: true

    class << self
        def update_or_create(table_name)
            return true if self.find_by(t_name: table_name)&.touch

            self.create t_name: table_name
        end

        def up_to_date?(table_name)
            return false unless (last_update = self.find_by(t_name: table_name)&.updated_at).present?

            last_update >= Time.now - BaseService::DATA_SYNC_DELAY
        end
    end
end
