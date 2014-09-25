require "pry"

class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:eventful]

  has_many :items, dependent: :destroy
  has_many :rented_items
  has_many :items, through: :rented_items

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.username = auth.info.username
      user.bio = auth.info.bio
      user.hometown = auth.info.hometown
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.interests = auth.info.interests
      if auth.info.images
        user.image = auth.info.images.image.first.url
      end
    end
  end
end
