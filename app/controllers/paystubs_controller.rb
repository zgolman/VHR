class PaystubsController < ApplicationController
skip_before_filter :authorize
  def index
    @paystubs = Paystub.all

  end

  def new
    @paystub = Paystub.new
  end




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
    @paystub = user.find(params[:id])
 
  end

  def update
          @paystub = Paystub.find(params[:id])
          if @paystub.update_attributes(params.require(:paystub).permit(:pay_period1, :pay_period2, :income))
              redirect_to user_path
          else
              render 'edit'
          end
    end



  def destroy
        @user = current_user
        @user.paystubs << Paystub.new(params.require(:paystub).permit(:pay_period1, :pay_period2, :income))
        # @paystub = Paystub.find(params[:_id])
        # @paystub.destroy
        @user.paystubs.destroy
        redirect_to user_path
  end

 
  private 
  def paystub_params
    params.require(:paystub).permit(:pay_period1, :pay_period2,:income, :user_id)
  end



end



