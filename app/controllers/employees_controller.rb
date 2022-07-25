class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @employee.tickets.order_by_age
  end
end