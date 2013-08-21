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
  end
end
