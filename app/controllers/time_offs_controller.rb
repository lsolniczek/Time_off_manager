class TimeOffsController < ApplicationController
  before_action :set_time_off, only: [:show, :edit, :update, :destroy]
  before_filter :get_employee

  
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

    respond_to do |format|
      if @time_off.save
        format.html { redirect_to [@employee, @time_off], notice: 'Time off was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @time_off.update(time_off_params)
        format.html { redirect_to @time_off, notice: 'Time off was successfully updated.' }
      else
        render action: 'edit' 
      end
    end
  end

  
  def destroy
    @time_off.destroy
      redirect_to employee_time_offs_url
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
end
