class Page < ApplicationRecord

  belongs_to :subject, { :optional => false}

  # has_many :sections

  has_and_belongs_to_many :admin_users

end
