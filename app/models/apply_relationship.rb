class ApplyRelationship < ApplicationRecord
    belongs_to :applier, class_name: "User" 
    belongs_to :applied, class_name: "RidePost"
    validates :applier_id, presence: true 
    validates :applied_id, presence: true
end
