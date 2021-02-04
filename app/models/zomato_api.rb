require 'uri'
require 'net/http'
require 'openssl'

class ZomatoApi < ApplicationRecord

  def self.get_restaurant(id)
    url = URI("https://developers.zomato.com/api/v2.1/restaurant?res_id=#{id}")
  
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/x-www-form-urlencoded'
    request["user-key"] = ENV['ZOMATO_KEY']
  
    response = http.request(request)
    JSON.parse(response.body)
    
    end

  def self.create_restaurants(quantity)
    counter = 1
    while counter <= quantity do
  
      id = rand(1..9999999)
  
      get_restaurant = ZomatoApi.get_restaurant(id)

      if get_restaurant['code'].nil? && get_restaurant["name"]

        city = City.find_or_create_by(name: get_restaurant["location"]["city"])
  
        params = {
        name: get_restaurant["name"],
        email: get_restaurant["name"].split.first + "@gmail.com",
        password: '12345',
        password_confirmation: '12345',
        opening_time: '12:00',
        closing_time: '23:00',
        phone_number: get_restaurant["phone_numbers"].split(' ').join('')[1..10],
        address: get_restaurant["location"]["address"],
        picture: get_restaurant["featured_image"],
        capacity: '100'
        }
        
          rest = Restaurant.new(params)
          rest.city = city
          rest.save
          counter +=1
      else
        counter +=1
      end
    end
  end
end