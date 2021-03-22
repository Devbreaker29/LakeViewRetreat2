class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
    
  
    def welcome_email 
      
      @user = params[:user]
      @url  = 'users/sign_in'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
        format.html { render 'contact.html.erb' }
        format.text { render plain: 'Render text' }
      end
    end
  end
