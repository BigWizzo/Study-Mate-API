class V1::StudentsController < ApplicationController
  def create
    student = Student.create(
      username: params[:username],
      password: params[:password]
    )
    render json: student, status: :created
  end
end
