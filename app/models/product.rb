class Product < ActiveRecord::Base
  include Attachable

  belongs_to :group
  validates :name, presence: true
end
