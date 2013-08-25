class Irb < Sinatra::Application
  namespace '/api/authenticate' do
    post '/?' do
      person = Person.authenticate params[:email], params[:password]

      if person
        session[:person_id] = person.id
        status 200
        return payload person.user_details
      end
    end   

    get '/isAuthenticated/?' do
      if session[:person_id].nil?
        payload({ :authenticated => false }, "User not authenticated")
      else
        person = Person.find session[:person_id]
        if person
          payload person.user_details
        else
          payload({ :authenticated => false }, "User not authenticated")
        end
      end
    end
  end
end
