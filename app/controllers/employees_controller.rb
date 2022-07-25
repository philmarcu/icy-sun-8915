class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @employee.tickets.order_by_age
  end

  def add_ticket
    @employee = Employee.find(params[:id])
    @tickets = Ticket.all
    @new_ticket = @tickets.last
    @employee.tickets << @new_ticket
    redirect_to "/employees/#{@employee.id}"
  end
end