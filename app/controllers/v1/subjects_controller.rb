class V1::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:index, :create, :show, :update, :destroy]

  # GET /subjects
  def index
    @subjects = @student.subjects

    render json: @subjects
  end

  # GET /subjects/1
  def show
    if @subject.student_id == @student.id
      @clockings = @subject.clockings.includes(:student)
      render json: @clockings      
    else
      render json: {message: "unauthorized"}
    end
  end

  # POST /subjects
  def create
    @subject = Subject.new(
      title: params[:title],
      description: params[:description],
      student: @student
    )
    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.student_id == @student.id
      if @subject.update(
        title: params[:title],
        description: params[:description],
        student: @student
      )
        render json: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "unauthorized"}
    end
  end

  # DELETE /subjects/1
  def destroy
    if @subject.student_id == @student.id
     @subject.destroy
    else
      render json: {message: "unauthorized"}
    end
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
