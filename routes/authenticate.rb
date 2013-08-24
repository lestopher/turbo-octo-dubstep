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
        return payload({ :authenticated => false })
      else
        return payload({ :authenticated => true })
      end
    end
  end
end
