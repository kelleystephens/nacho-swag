class User < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:eventful]

  has_many :items, dependent: :destroy
  has_many :rented_items
  has_many :items, through: :rented_items

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
    end
  end
end
