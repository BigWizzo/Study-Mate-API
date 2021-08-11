class V1::AuthenticationController < ApplicationController
  def login
    student = Student.find_by(username: params[:username])

    if !student
      render({ json: { error: "Invalid username" }, status: :unauthorized}) 
    else
      if student.authenticate(params[:password])
        secret_key = Rails.application.secrets.secret_key_base[0]
        token = JWT.encode({
          student_id: student.id,
          username: student.username,
        }, secret_key)
        render json: {token: token}
      else
        render json: {message: "wrong password"}
      end
    end
  end
end
