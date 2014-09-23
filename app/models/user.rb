class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:eventful]

  has_many :items, dependent: :destroy
  has_many :rented_items
  has_many :items, through: :rented_items

  def self.from_omniauth(auth)
    puts auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      # user.username = auth.info.username
      # user.bio = auth.info.bio
      # user.hometown = auth.info.hometown
      # user.first_name = auth.info.first_name
      # user.last_name = auth.info.last_name
      # user.interests = auth.info.interests
      # user.images = auth.info.images.image.url
      # user.links = auth.info.links
      # user.locales = auth.info.locales
      # user.going = auth.info.going
    end
  end
end
