class PaystubsController < ApplicationController
skip_before_filter :authorize
  def index
    @paystubs = Paystub.all
  end

  def new
    @paystub = Paystub.new
  end



  # def create
  #       @paystub = Paystub.new(params.require(:paystub).permit(:pay_period1, :pay_period2, :income))
  #       if @paystub.save
  #           redirect_to user_path(:paystub)
  #       else
  #           render 'new'
  #       end
  # end

  def create
    @id = params[:user_id]
    @user = current_user
    @user.paystubs << Paystub.new(params.require(:paystub).permit(:pay_period1, :pay_period2, :income))
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end








  def show
    @paystub = Paystub.find(params[:id])
  end

  def edit
    @paystub = Paystub.find(params[:id])
  end

  def destroy
        @paystub = Paystub.find(params[:id])
        @paystub.destroy
        redirect_to paystubs_path
  end

 
  def update
        @paystub = Paystub.find(params[:id])
        if @paystub.update_attributes(params.require(:paystub).permit(:pay_period, :income, :health_insurance, :benefits))
            redirect_to paystubs_path
        else
            render 'edit'
        end
  end

  

 

end

# field :pay_period, type: Date
#   field :income, type: Decimal
#   field :health_insurance, type: Mongoid::Boolean
#   field :benefits, type: Mongoid::Boolean


