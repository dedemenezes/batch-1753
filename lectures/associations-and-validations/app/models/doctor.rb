class Doctor < ActiveRecord::Base
  has_many :interns # has many is always in PLURAL!
  # has many CREATES A METHOD with the :method_nameS
  has_many :consultations
  has_many :patients, through: :consultations

  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  # validates :first_name, :last_name, uniqueness: true
end
