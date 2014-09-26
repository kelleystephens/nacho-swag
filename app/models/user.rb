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
      user.hometown = auth.info.default_location
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.interests = auth.info.interests
      if auth.info.images
        user.image = auth.info.images.image.first.sticker280.url
      else
        user.image = "https://openclipart.org/image/800px/svg_to_png/192758/1397379218.png"
      end
    end
  end
end
