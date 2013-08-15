class Irb < Sinatra::Application
  get '/person' do
    response.headers['Content-Type'] = 'application/json;chartset=utf-8'
    person = Person.all.to_json
  end

  get '/person/:id' do
    response.headers['Content-Type'] = 'application/json;chartset=utf-8'
    person = Person.find_by_id(params[:id]).to_json
  end

  post '/person/create' do
    Person.create! do |p|
      p.first_name = params[:first_name]
      p.middle_name = params[:middle_name]
      p.last_name = params[:last_name]
      p.gender = params[:gender]
      p.email = params[:email]
    end
  end

  put '/person/update' do
    person = Person.find_by_id params[:id]

    Person.update_attributes do |p|
      p.first_name = params[:first_name]
      p.middle_name = params[:middle_name]
      p.last_name = params[:last_name]
      p.gender = params[:gender]
      p.email = params[:email]
    end
  end

  delete '/person/delete/:id' do
    person = Person.find_by_id params[:id]

    person.destroy if !person.nil?
  end
end
