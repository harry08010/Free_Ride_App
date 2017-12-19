class ApproveRelationship < ApplicationRecord
    belongs_to :approver, class_name: "RidePost" 
    belongs_to :approved, class_name: "User"
    validates :approver_id, presence: true 
    validates :approved_id, presence: true
end
