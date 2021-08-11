class V1::AuthenticationController < ApplicationController
  def login
    student = Student.find_by(username: params[:username])

    if !student
      render({ json: { error: "Invalid username" }, status: :unauthorized}) 
    else
      if student.authenticate(params[:password])
        render json: {message: "correct password"}
      else
        render json: {message: "wrong password"}
      end
    end
  end
end
