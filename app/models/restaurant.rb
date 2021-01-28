class Restaurant < ApplicationRecord
  has_many :slots, dependent: :destroy
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations

  has_secure_password

  validates :email, :opening_time, :closing_time, :city_id, :phone_number, :address, :picture, :capacity, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone_number, length: { is: 10 }

  def city_attributes=(attributes)
    # attributes = {"name"=>"asd", "id"=>"1"}
    # self = <Restaurant id: nil, email: "asd", password_digest: [FILTERED], password_confirmation: nil, opening_time: "asd", closing_time: "asd", city_id: nil, phone_number: "asd", address: "sad", picture: "asd", capacity: 123, created_at: nil, updated_at: nil, name: "asd">
    if attributes[:id] != ''
      self.city = City.where(id: attributes[:id]).first
    else
      self.city = City.find_or_create_by(name: attributes[:name].split(' ').join('-'))
    end
  end

  def phone_formatter(number)
    "(#{number[0..2]})#{number[3..5]}-#{number[6..10]}"
  end
end
