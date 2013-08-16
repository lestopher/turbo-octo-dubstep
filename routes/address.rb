class Irb < Sinatra::Application
  before do
    response.headers['Content-Type'] = 'application/json;chartset=utf-8'
  end

  namespace '/address' do
    get '/?' do
      payload Address.all
    end

    get '/count' do
      payload "count" => Address.all.count
    end

    post '/create' do
      # Need some type of authentication to get the user info here
      addy = Address.new do |a|
        a.street_line_1 = params[:street_line_1]
        a.street_line_2 = params[:street_line_2]
        a.city          = params[:city]
        a.state         = params[:state]
        a.zip_code      = params[:zip_code]
        a.country       = params[:country]
        a.person_id     = person_id
      end

      if addy.save
        status 200
        return payload addy
      else
        status 500
        return payload {}, "Unable to create address"
      end
    end

    put '/update/:id' do
      addy = Address.find_by_id params[:id]

      success = addy.update_attributes do |a|
        a.street_line_1 = params[:street_line_1] || addy.street_line_1
        a.street_line_2 = params[:street_line_2] || add.street_line_2
        a.city          = params[:city] || addy.city
        a.state         = params[:state] || addy.state
        a.zip_code      = params[:zip_code] || addy.zip_code
        a.country       = params[:country] || addy.country
        a.person_id     = params[:person_id] || addy.person.id
      end

      if !success
        status 500
        return payload {}, "Unable to update address"
      else
        status 200
        return payload addy 
      end

    end

    delete '/delete/:id' do
      addy = Address.find_by_id params[:id]

      if !addy.nil?
        addy.destroy 

        status 200
        return payload if addy.destroyed?

        status 500
        return payload {}, "Could not delete address"
      end

      status 422
      return payload {}, "Address does not exist"
    end

    get '/address/:id' do
      payload Address.find_by_id(params[:id])
    end
  end
end