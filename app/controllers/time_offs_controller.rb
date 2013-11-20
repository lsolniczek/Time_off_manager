class TimeOffsController < ApplicationController
  before_action :set_time_off, only: [:show, :edit, :update, :destroy]
  #before_action :current_user_id_check
  before_filter :current_user, :get_employee

  
  def index
    @time_offs = @employee.time_offs
  end

  
  def show
  end

 
  def new
    @time_off = TimeOff.new
  end

  
  def edit
  end

  
  def create
    @time_off = @employee.time_offs.new(time_off_params)

    if @time_off.save
      redirect_to [@employee, @time_off], notice: 'Time off was successfully created.'
    else
      render action: 'new'
    end
  end

  
  def update
    if @time_off.update(time_off_params)
      redirect_to [@employee, @time_off], notice: 'Time off was successfully updated.'
    else
      render action: 'edit' 
    end
  end

  
  def destroy
    @time_off.destroy
      redirect_to employee_time_offs_url
  end


  #STATE CONTROL
  def change
    @change = @employee.time_offs.find(params[:time_off_id])
    @change.change!
    redirect_to employee_time_offs_path, notice: 'Wysłałeś wniosek uropowy do akceptacji'
  end

  def accept
    @accept = @employee.time_offs.find(params[:time_off_id])
    @accept.approve!
    redirect_to employee_time_offs_path, notice: 'Twój wniosek urlopowany został zaakceotowany'
  end

  def reject
    @reject = @employee.time_offs.find(params[:time_off_id])
    @reject.reject!
    redirect_to employee_time_offs_path, notice: 'Twój wniosek urlopowany został odrzucony'
  end

  def cancel
    @cancel = @employee.time_offs.find(params[:time_off_id])
    @cancel.cancel!
    redirect_to employee_time_offs_path, notice: 'Twój wniosek urlopowany został anulowany'
  end


  private
   
    def set_time_off
      @time_off = TimeOff.find(params[:id])
    end

    
    def time_off_params
      params.require(:time_off).permit(:date_from, :date_to, :reason)
    end

    def get_employee
      @employee = Employee.find(params[:employee_id])
    end

    def current_user
      current_user ||= session[:user_id]

      unless current_user
        redirect_to root_path, notice: 'Musisz byc zalogowany.'
      end
    end

    def current_user_id_check
      other_user = params[:employee_id]
      current_user = session[:user_id]

      unless other_user == current_user
        redirect_to employee_time_offs_path(:employee_id => session[:user_id])
      end
    end
end
