class Person < ApplicationRecord
    include BaseService

    self.primary_key = :id
end
