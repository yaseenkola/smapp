class StudentsController < ApplicationController
 before_action :set_student, only: [:show, :edit, :update, :destroy]
 before_action :require_user, except: [:index, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]
 before_action :require_admin, only: [:remove_all]
  # GET /fees
  # GET /fees.json
  def index
    @students = Student.search(params[:search])

    respond_to do |format|
      format.html
      format.js
    end

  end

  def import
    Student.import(params[:file])
    redirect_to admissions_path, success: "File was successfully imported."
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    # @student = Student.new
    @student = current_user.students.build
  end

  # GET /fees/1/edit
  def edit
  end

  # POST /fees
  # POST /fees.json
  def create
    @student = current_user.students.build(student_params)
    # @student = Student.new(student_params)
    # @student.user_id = current_user.id

    respond_to do |format|
      if @student.save
        format.html { redirect_to admissions_url, success: 'Student record was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to admissions_url, success: 'Student record was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admissions_url, danger: 'Student record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_all
    Student.delete_all
    flash[:danger] = "You have removed all results!"
    redirect_to admissions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:admission_no, :admission_date, :student_name, :surname, :class_applied, :age, :dob, :pob, :card_no, :gender, :father_name, :occupation, :qualification, :mob_no, :email, :address,:mother_name, :m_occupation, :m_qualification, :specialist, :m_address, :m_mob, :m_email, :whats_app, :req_trans, :trans_addr, :image, :remarks, :user_id
      )
    end
    
    
    def require_same_user
      if current_user != @student.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own records"
      redirect_to root_path
      end
    end
    
    def require_admin
      if logged_in? & !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
      end
    end

  
end
