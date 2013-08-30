class Irb < Sinatra::Application
  namespace '/api/authenticate' do
    post '/?' do
      person = Person.authenticate params[:email], params[:password]

      if person
        session[:person_id] = person.id
        status 200
        payload person.user_details
      else
        payload({ }, "Invalid username or password")
      end
      
    end   

    get '/isAuthenticated/?' do
      if session[:person_id].nil?
        payload({ :authenticated => false }, "User not authenticated")
      else
        person = Person.find session[:person_id]
        unless person.nil?
          payload person.user_details
        else
          payload({ :authenticated => false }, "User not authenticated")
        end
      end
    end

    # @param email
    # @param password
    # @param new_password
    post '/setPassword/?' do
      return payload({}, "New password is empty") if params[:new_password].nil?

      person = Person.authenticate params[:email], params[:password]

      set_password = lambda do |person, password|
        person.password = password
        person.save
        person
      end

      set_password.call person, params[:new_password]

      if person
        payload person.user_details
      else
        person = Person.find_by_email params[:email]
        
        if person.password_hash.nil? and person.password_salt.nil?
          person = set_password.call params[:email], params[:password]
          payload person.user_details
        else
          status 403
          payload {}, "Error with authentication" 
        end
      end
    end
  end
end
