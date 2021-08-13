class V1::SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:index, :create, :show, :update, :destroy]

  def index
    @subjects = @student.subjects
    render json: @subjects
  end

  def show
    if @subject.student_id == @student.id
      @clockings = @subject.clockings.includes(:student)
      render json: @clockings      
    else
      render json: {message: "unauthorized"}
    end
  end

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

  def destroy
    if @subject.student_id == @student.id
     @subject.destroy
    else
      render json: {message: "unauthorized"}
    end
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
