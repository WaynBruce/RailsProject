require 'csv'
class WelcomeController < ApplicationController
  before_action :set_auth 
  def index
 
  end

  def profile
    if params["email"].present? && params["last_name"] && params.empty? != nil
      @user_data = Hash.new
      @user_data["email"] = params["email"] 
      @user_data["first_name"] = params["first_name"]
      @user_data["last_name"] = params["last_name"]
      @user_data["day_of_birth"] = params["day_of_birth"]
      @user_data["month_of_birth"] = params["month_of_birth"]
      @user_data["year_of_birth"] = params["year_of_birth"]
      @user_data["building"] = params["building"]
      @user_data["street"] = params["street"]
      @user_data["locality"] = params["locality"]
      @user_data["postcode"] = params["postcode"]
      @user_data["country"] = params["country"]
      @user_data["passport_photo"] = params["passport_photo"]
      @user_data["passport_number"] = params["passport_number"]
      @user_data["license_photo"] = params["license_photo"]
 

      file = "#{Rails.root}/public/user_data.csv"
      
      column_headers = ["Email", "First_Name", "Last_Name", "Day_of_birth",
                      "Month_of_birth", "Year_of_birth", "Building", "street", 
                      "Locality", "Postcode", "Country", "Passport_photo" ,
                      "Passport_number", "License_photo"]

      if @user_data.empty? != nil && @user_data["email"] != nil
        if File.file?("#{file}") 
          CSV.open(file, 'a+') do |writer|
              writer << [@user_data["email"], @user_data["first_name"], @user_data["last_name"],
              @user_data["day_of_birth"], @user_data["month_of_birth"],@user_data["year_of_birth"],
              @user_data["building"],@user_data["street"], @user_data["locality"],
              @user_data["postcode"],@user_data["country"], @user_data["passport_photo"],
              @user_data["passport_number"], @user_data["license_photo"] ]
          end
        else 
          CSV.open(file, 'a+', write_headers: true, headers: column_headers) do |writer|      
              writer << [@user_data["email"], @user_data["first_name"], @user_data["last_name"],
              @user_data["day_of_birth"], @user_data["month_of_birth"],@user_data["year_of_birth"],
              @user_data["building"],@user_data["street"], @user_data["locality"],
              @user_data["postcode"],@user_data["country"], @user_data["passport_photo"],
              @user_data["passport_number"], @user_data["license_photo"] ]
          end
        end
        redirect_to :controller => 'welcome', :action => 'index'
      end   
    end
  end


  private

  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
