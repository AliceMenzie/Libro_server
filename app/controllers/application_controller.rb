class ApplicationController < ActionController::API
  

  def encode(payload)
    JWT.encode(payload, Rails.application.credentials.jwt_secret_key, "HS512")
  end

  def authenticated
    # puts request.authorized()
    # unless authorized
    begin
      token = request.authorization.split(" ")[1]
      decoded = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: "HS512")
      user_id = decoded[0]["user_id"]
      @user = User.find(user_id)
    rescue => exception
      render json: { message: "Unauthorized: Please Login" }
    end
    # end
  end

  def current_user
    @user
  end
end
