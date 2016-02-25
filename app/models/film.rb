class Film < ActiveRecord::Base
  has_and_belongs_to_many :cinematographs
  has_and_belongs_to_many :directors
  has_and_belongs_to_many :distributors
  has_and_belongs_to_many :editors
  has_and_belongs_to_many :musicans
  has_and_belongs_to_many :producers
  has_and_belongs_to_many :production_companys
  has_and_belongs_to_many :stars
  has_and_belongs_to_many :storytellers
  has_and_belongs_to_many :writers
  include ForForms
  include ForTests if Rails.env == "test"
  validates :name, presence: true, length: { maximum: 70 }, uniqueness: true
  validates :description, length: { maximum: 65536 }
end
