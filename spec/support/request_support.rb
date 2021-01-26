module RequestSupport

  def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end
  
  def body_json(symbolize_keys: false)
    json = JSON.parse(response.body)
    symbolize_keys ? json.deep_symbolize_keys : json
  rescue StandardError
    {}
  end
end

RSpec.configure do |config|
  config.include RequestSupport, type: :request
end