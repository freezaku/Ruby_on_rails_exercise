class Subject < ApplicationRecord

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("position ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :serach, lambda { |query| where(["name LIKE ?", "%#{query}%"])}

end
