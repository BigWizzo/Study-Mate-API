class ApplicationController < ActionController::API
  def authenticate
    authorization_header = request.headers[:authorization]
    if !authorization_header
      render status: :unauthorized
    else
      token = authorization_header.split(" ")[1]
      secret_key = Rails.application.secrets.secret_key_base[0]
      decode_token = JWT.decode(token, secret_key)
      @student = Student.find(decode_token[0]["student_id"])
    end
  end
end
