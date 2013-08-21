class Irb < Sinatra::Application
  before do 
    response.headers['Content-Type'] = 'application/json;chartset=utf-8'
  end

  namespace '/api/person' do
    get '/?' do
      payload Person.all
    end

    get '/count' do
      payload "count" => Person.all.count
    end

    post '/create' do
      person = Person.new do |p|
        p.first_name  = params[:first_name]
        p.middle_name = params[:middle_name]
        p.last_name   = params[:last_name]
        p.gender      = params[:gender]
        p.email       = params[:email]
        p.password    = params[:password]
      end

      if person.save
        status 200
        return payload person
      else
        status 500
        return payload {}, "Unable to create person"
      end
    end

    put '/update' do
      person = Person.find_by_id params[:id]

      success = person.update_attributes do |p|
        p.first_name  = params[:first_name] || person.first_name
        p.middle_name = params[:middle_name] || person.middle_name
        p.last_name   = params[:last_name] || person.last_name
        p.gender      = params[:gender] || person.gender
        p.email       = params[:email] || person.email
      end

      if !success
        status 500
        return payload {}, "Unable to update person"
      else
        status 200
        return payload person 
      end
    end

    get '/:id' do
      payload Person.find_by_id(params[:id])
    end

    delete '/delete/:id' do
      person = Person.find_by_id params[:id]

      if !person.nil?
        person.destroy 

        status 200
        return payload if person.destroyed?

        status 500
        return payload {}, "Could not delete person"
      end

      status 422
      return payload {}, "Person does not exist"
    end
  end
end
