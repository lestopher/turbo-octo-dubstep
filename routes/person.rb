class Irb < Sinatra::Application
  namespace '/person' do
    get '/?' do
      response.headers['Content-Type'] = 'application/json;chartset=utf-8'
      person = Person.all.to_json
    end

    post '/create' do
      Person.create! do |p|
        p.first_name = params[:first_name]
        p.middle_name = params[:middle_name]
        p.last_name = params[:last_name]
        p.gender = params[:gender]
        p.email = params[:email]
      end
    end

    put '/update' do
      person = Person.find_by_id params[:id]

      Person.update_attributes do |p|
        p.first_name = params[:first_name] || person.first_name
        p.middle_name = params[:middle_name] || person.middle_name
        p.last_name = params[:last_name] || person.last_name
        p.gender = params[:gender] || person.gender
        p.email = params[:email] || person.email
      end
    end

    get '/:id' do
      response.headers['Content-Type'] = 'application/json;chartset=utf-8'
      person = Person.find_by_id(params[:id]).to_json
    end

    delete '/delete/:id' do
      person = Person.find_by_id params[:id]

      person.destroy if !person.nil?
    end
  end
end
