class V1::SubjectsController < ApplicationController
  # before_action :set_subject, only: [:show, :update, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all

    render json: @subjects
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    authorization_header = request.headers[:authorization]
    if !authorization_header
      render status: :unauthorized
    else
      token = authorization_header.split(" ")[1]
      secret_key = Rails.application.secrets.secret_key_base[0]
      decode_token = JWT.decode(token, secret_key)
      byebug
      student = Student.find(decode_token[0]["student_id"])

      @subject = Subject.new(subject_params)
      if @subject.save
        render json: @subject, status: :created
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subject_params
      params.permit(:title, :description)
    end
end
