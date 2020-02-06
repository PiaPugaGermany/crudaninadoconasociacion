class EmployeesController < ApplicationController

  def create
    @employee = Employee.new(employee_params)
    @employee.area = Area.find(params[:area_id])
    @employee.company = Company.find(params[:company_id])
    @employee.save
    redirect_to @employee.company, notice: "Employee created successfully"
  end

  def destroy
    @employee.destroy
    redirect_to @employee.company, notice: 'Employee was successfully fired.' }
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :area_id)
    end
end
