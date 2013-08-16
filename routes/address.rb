class Irb < Sinatra::Application
  namespace 'address' do
    get '/?' do
      Address.all.to_json
    end

    get '/count' do
      { "count" => Address.all.count }.to_json
    end

    post '/create' do
      # Need some type of authentication to get the user info here
      Address.create! do |a|
        a.street_line_1 = params[:street_line_1]
        a.street_line_2 = params[:street_line_2]
        a.city = params[:city]
        a.state = params[:state]
        a.zip_code = params[:zip_code]
        a.country = params[:country]
        a.person_id = person_id
      end
    end
  end
end