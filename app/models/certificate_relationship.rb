class CertificateRelationship < ApplicationRecord
    belongs_to :cer, class_name: "User" 
    belongs_to :ced, class_name: "User"
    validates :cer_id, presence: true 
    validates :ced_id, presence: true
end
