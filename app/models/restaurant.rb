class Restaurant < ApplicationRecord
  has_many :slots, dependent: :destroy
  belongs_to :city
  has_many :reservations
  has_many :guests, through: :reservations
  has_many :reviews

  has_secure_password

  validates :email, :opening_time, :closing_time, :city_id, :phone_number, :address, :picture, :capacity, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_number, format: { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/, :message => "- Phone numbers must be in xxx-xxx-xxxx format." }

  def city_attributes=(attributes)
    if attributes[:id] != ''
      self.city = City.where(id: attributes[:id]).first
    else
      self.city = City.find_or_create_by(name: attributes[:name].split(' ').join('-'))
    end
  end

end
