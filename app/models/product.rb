class Product < ActiveRecord::Base
  belongs_to :group
  validates :name, presence: true
end
