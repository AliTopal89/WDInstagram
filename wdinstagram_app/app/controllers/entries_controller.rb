class EntriesController < ApplicationController

	before_action :find_entry, only: [:show, :edit, :update, :destroy]

	def index
		@entries = Entry.all
	
	end

	 def show
	 	# @entry = Entry.find(params[:id])
	
	 end
	
	def new
		@entry = Entry.new
	
	end

	def create
		@entry = Entry.new(entry_params)

		if @entry.save
			redirect_to @entry
		else
			render :new
		end

	end

	def edit

	end

	def update

		@entry.update(entry_params)
		redirect_to @entry
	
	end

	def destroy
		@entry.destroy
		redirect_to entries_path
	
	end

	private

	def entry_params
		params.require(:entry).permit(:author, :url, :created_at)
	end

	def find_entry
		@entry = Entry.find(params[:id])
	end




end
# index (displays all entries)
# show (displays a specific entry)
# new (displays a form to create a new entry)
# create (saves a new entry it to the database)
# edit (displays a form for editing a particular entry)
# update (takes input from the edit form and updates the entry in the db appropriately)
# destroy (deletes a specific entry from the database)