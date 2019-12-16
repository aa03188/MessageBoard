class ContactsController < ApplicationController
  def index
    # index page
  end

  def contactUs
    if params[:title].blank? or params[:message].blank?
      flash[:notice] = "Please fill in the inputs"
    else
      ContactMailer.contact(current_user.email, params[:title], params[:message]).deliver_now
      flash[:notice] = "Email sent succesfully"
    end

    redirect_to contact_path
  end
end
