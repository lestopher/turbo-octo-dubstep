require 'json'

module JsonMessage
  def payload(data={}, mesg="success")
   {"data" => data, "mesg" => mesg}.to_json
  end
end