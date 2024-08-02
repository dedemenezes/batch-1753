class Intern < ActiveRecord::Base
  belongs_to :doctor # the belongs to will ALWAYS carry the id of the parent
  # belongs to CREATES A METHOD with the :method_name
end
