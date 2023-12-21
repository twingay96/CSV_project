class UsersController < ApplicationController
  require "csv"
  before_action :set_user, only: %i[ show edit update destroy ]

  def import
    uploaded_file = params[:file]
    return redirect_to users_path, notice: "Only CSV please!" unless uploaded_file .content_type == "text/csv"
    file_contents = uploaded_file.read
    csv = CSV.parse(file_contents, headers: true)
    #csv = CSV.parse(file_contents, headers: true, col_sep: ",")
    csv.each do |row|
      user_hash = {}
      user_hash[:firstname] = row["First Name"]
      user_hash[:Lastname] =  row["Last Name"]
      user_hash[:email] = row["Email Address"]
      user_hash[:food] = row["Favorite Food"]
      #user_hash[:username] = row["Email Address"].split("@").first if row["Email Address"].present?
      #binding.b
      #p row
      User.create(user_hash)
    end
    redirect_to users_path, notice: "CSV file was imported!"

  end

  # GET /users or /users.json
  def index
    @users = User.all
  end
end
