class RidePost < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user_id, presence: true
  validates :starting_point, :destination, :available_seat_number, :date, :time, presence: true
  validates :note, length: { maximum: 140 }
  validates_numericality_of :available_seat_number, :greater_than => 0

  has_many :passive_apply_relationships, class_name: "ApplyRelationship",
                                        foreign_key: "applied_id",
                                        dependent: :destroy
  has_many :appliers, through: :passive_apply_relationships, source: :applier
  has_many :active_approve_relationships, class_name: "ApproveRelationship",
                                        foreign_key: "approver_id",
                                        dependent: :destroy
  has_many :approving, through: :active_approve_relationships, source: :approved

  def approve(other_user)
    if(self.approving.count < self.available_seat_number)
      approving << other_user
    end
  end

  def unapprove(other_user)
    approving.delete(other_user)
  end

  def approving?(other_user)
    approving.include?(other_user)
  end
  
  def self.starting_points(starting_point)
    where("starting_point LIKE ?", "%#{starting_point}%")
  end

  def self.destinations(destination)
    where("destination LIKE ?", "%#{destination}%")
  end
end
