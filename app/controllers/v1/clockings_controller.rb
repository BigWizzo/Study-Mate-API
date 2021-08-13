class V1::ClockingsController < ApplicationController
  before_action :set_clocking, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :show, :update, :destroy]

  def show
    if @clocking.student_id == @student.id
      render json: @clocking
    else
      render json: {message: "unauthorized"}
    end
  end

  def create
    @clocking = Clocking.new(
      topic: params[:topic],
      details: params[:details],
      duration: params[:duration],
      subject_id: params[:subject_id],
      student: @student
    )
    if @clocking.save
      render json: @clocking, status: :created
    else
      render json: @clocking.errors, status: :unprocessable_entity
    end
  end

  def update
    if @clocking.student_id == @student.id
      if @clocking.update(
        topic: params[:topic],
        details: params[:details],
        duration: params[:duration],
        subject_id: params[:subject_id],
        student: @student
      )
        render json: @clocking
      else
        render json: @clocking.errors, status: :unprocessable_entity
      end
    else
      render json: {message: "unauthorized"}
    end
  end

  def destroy
    if @clocking.student_id == @student.id
      @clocking.destroy
    else
      render json: {message: "unauthorized"}
    end
  end

  private

  def set_clocking
    @clocking = Clocking.find(params[:id])
  end
end
