class PastRelationship < ApplicationRecord
    belongs_to :driver, class_name: "User" 
    belongs_to :passenger, class_name: "User" 
    validates :driver_id, presence: true 
    validates :passenger_id, presence: true
end
