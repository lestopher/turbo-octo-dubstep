class Irb < Sinatra::Application
  namespace '/api/authenticate' do
    post '/?' do
      person = Person.new do |p|
        p.first_name = params[:first_name]
        p.middle_name = params[:middle_name]
        p.last_name = params[:last_name]
        p.gender = params[:gender]
        p.email = params[:email]
      end
    end   
  end
end
