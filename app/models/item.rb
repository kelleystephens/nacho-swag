class Item < ActiveRecord::Base
  belongs_to :user
  has_many :rented_items
  has_many :users, through: :rented_items
end
