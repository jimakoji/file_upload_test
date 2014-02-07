class Attachment < ActiveRecord::Base
  attr_accessible :content, :name

  validates :content, :presence => true

end
