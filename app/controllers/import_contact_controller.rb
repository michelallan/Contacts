class ImportContactController < ApplicationController

	before_filter :authenticate_user!
	
	def new
		@contact = Contact.new
	end

	def create
		require "csv"

		CSV.foreach(params[:file_name].tempfile,"r:ISO-8859-1") do |r|
			Contact.create(:name => r[0], :email => r[14], :telephone => r[20])
		end
		redirect_to root_path
	end

end
