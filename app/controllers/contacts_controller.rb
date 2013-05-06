class ContactsController < ApplicationController

	before_filter :authenticate_user!
	
	def index
		if params[:search]
			@contacts = Contact.where('name LIKE ? ', "%#{params[:search]}%")
		else
			@contacts = Contact.all
		end
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])	
	
		if @contact.save
			redirect_to contacts_path
		else
			render :new
		end
	end
	
	def edit
		@contact = Contact.find(params[:id])
	end
	
	def update
		@contact = Contact.find(params[:id])

		if @contact.update_attributes(params[:contact])
			redirect_to contacts_path
		else
			render :edit
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy

		redirect_to contacts_path
		
	end

	def info
		@contact = Contact.find(params[:id])
	end


end
