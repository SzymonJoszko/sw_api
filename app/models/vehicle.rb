class Vehicle < ApplicationRecord
    include BaseService

    self.primary_key = :id
end
