class User < ApplicationRecord
  attr_accessor :activation_token
  before_create :create_activation_digest
  before_save { self.email = email.downcase }

  validates :nickname, :first_name, :last_name, :email, :phone, :gender, presence: true
  validates_inclusion_of :status, :in => [true, false]

  validates :first_name, :last_name,  presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_many :ride_posts, dependent: :destroy
  has_many :active_apply_relationships, class_name: "ApplyRelationship",
                                        foreign_key: "applier_id",
                                        dependent: :destroy
  has_many :applying, through: :active_apply_relationships, source: :applied
  has_many :passive_approve_relationships, class_name: "ApproveRelationship",
                                           foreign_key: "approved_id",
                                           dependent: :destroy
  has_many :approvers, through: :passive_approve_relationships, source: :approver
  has_many :active_certificate_relationships, class_name: "CertificateRelationship",
                                        foreign_key: "cer_id",
                                        dependent: :destroy
  has_many :certificating, through: :active_certificate_relationships, source: :ced
  has_many :passive_certificate_relationships, class_name: "CertificateRelationship",
                                        foreign_key: "ced_id",
                                        dependent: :destroy
  has_many :certificater, through: :passive_certificate_relationships, source: :cer
  has_many :driver_conversation, class_name: "Conversation", foreign_key: "driver_id"
  has_many :send_msgs, class_name: "Message", foreign_key: "sender_id"
  has_many :receive_msgs, class_name: "Message", foreign_key: "receiver_id"
  
  has_many :active_past_relationships, class_name: "PastRelationship",
                                        foreign_key: "driver_id",
                                        dependent: :destroy
  has_many :passengers, through: :active_past_relationships, source: :passenger
  has_many :passive_past_relationships, class_name: "PastRelationship",
                                           foreign_key: "passenger_id",
                                           dependent: :destroy
  has_many :drivers, through: :passive_past_relationships, source: :driver
  
  
  has_secure_password

  def change_status(user)
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def apply(other_post)
    applying << other_post
  end

  def unapply(other_post)
    applying.delete(other_post)
    if(other_post.approving?(self))
      other_post.approving.delete(self)
    end
  end

  def applying?(other_post)
    applying.include?(other_post)
  end

  def certificate(other_user)
    certificating << other_user
  end
  
  def addpassenger(other_user)
    passengers << other_user
  end
  
  def removepassenger(other_user)
    passengers.delete(other_user)
  end
  
end
