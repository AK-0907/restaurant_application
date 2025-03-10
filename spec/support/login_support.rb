module LoginSupport
   def logged_in?
     !session[:user_id].nil?
   end
   
   module System
     def log_in(user)
       visit login_path
       fill_in 'sessions-email', with: user.email
       fill_in 'sessions-password', with: user.password
       click_button 'ログイン'
     end
   end
  
   module Request
     def log_in(user)
       post login_path, params: { session: { email: user.email,
                                             password: user.password } }
     end
  
     def logged_in?
       !session[:user_id].nil?
     end
   end
  end
   
  RSpec.configure do |config|
   config.include LoginSupport
   config.include LoginSupport::System, type: :system
   config.include LoginSupport::Request, type: :request
  end