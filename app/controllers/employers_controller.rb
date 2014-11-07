class EmployersController < ApplicationController
skip_before_filter :authorize
  def index
    @employers = Employer.all
  end

  def new
    @employer = Employer.new
  end

  def create
        @employer = Employer.new(params.require(:employer).permit(:pay_period, :income, :health_insurance, :benefits))
        if @employer.save
            redirect_to employers_path
        else
            render 'new'
        end
  end

  def show
    @employer = Employer.find(params[:id])
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def destroy
        @employer = Employer.find(params[:id])
        @employer.destroy
        redirect_to employers_path
  end

 
  def update
        @employer = Employer.find(params[:id])
        if @employer.update_attributes(params.require(:employer).permit(:pay_period, :income, :health_insurance, :benefits))
            redirect_to employers_path
        else
            render 'edit'
        end
  end

  

 

end

# field :pay_period, type: Date
#   field :income, type: Decimal
#   field :health_insurance, type: Mongoid::Boolean
#   field :benefits, type: Mongoid::Boolean


