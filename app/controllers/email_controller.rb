class EmailController < ApplicationController

        
    def contact_us
                        
        
        customer_info = params[:user] 
     
        UserMailer.with(customer_info: customer_info).welcome_email.deliver_later

        
end
end

