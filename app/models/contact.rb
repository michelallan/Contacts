class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :telephone, :photo
	validates_presence_of :name, :email
	validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	# validates_format_of :telephone, :with => /^[\d]+$/, :message => " - must be a number"
	# validates_length_of :telephone, :is => 10, :message => " must have 10 numbers"
	validates_uniqueness_of :name, :email

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
