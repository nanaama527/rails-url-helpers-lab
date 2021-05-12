class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = students
  end

  def show
    @student = find_student
  end

  def activate
    student = find_student
    student.active = !student.active
    student.save
    redirect_to student_path(student)
  end

  private

  def students
    Student.all
  end


  def set_student
    @student = Student.find(params[:id])
  end

  def find_student 
    Student.find(params[:id])
  end
end