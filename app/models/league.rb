class League < ActiveRecord::Base
  attr_accessible :description, :end, :name, :start
  validates :name, :presence => true
  validates :start, :presence => true
  validates :end, :presence => true
  validates_date :start, :before => :end, :before_message => "must be before end date"
  validates_date :end
end
