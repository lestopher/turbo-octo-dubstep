class Irb < Sinatra::Application
  get '/person' do
    response.headers['Content-Type'] = 'application/json;chartset=utf-8'
    person = Person.all.to_json
  end

  get '/person/:id' do
    person = Person.find_by_id(params[:id]).to_json
  end

  post '/person/create' do
  end

  put '/person/edit' do
  end

  delete '/person/delete/:id' do
    
  end
end
