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
    @paystub = current_user.paystubs.find(params[:id])
    # @paystub = Paystub.find(params[:id])
    # current_user = User.find(params[:paystub])
    # @paystub = Paystub.current_user.find(params[:id])

    # # raise User.find(params[:id])
    # # @user = User.find(params[:id])
    # # @paystub = @user.Paystub.find(params[:id])
    # @users = User.all
    # @paystub = Paystub.find(params[:id])
    # @friends = current_user.paystubs.order('id')
    # # gives me a "friendship" to enter into friendship delete forms so it routes
    # # properly, never changes since the delete controller only worries about
    # # the user_id
    # # @fake_friendship = Friendship.find(51)
  end

def update
        @paystub = Paystub.find(params[:id])
        if @paystub.update_attributes(params.require(:paystub).permit(:pay_period, :income, :health_insurance, :benefits))
            redirect_to user_path
        else
            render 'edit'
        end
  end



  def destroy
        @paystub = User.find(params[:_id])
        @paystub.destroy
        redirect_to paystubs_path
  end

 
  

  

 

end


# field :pay_period, type: Date
#   field :income, type: Decimal
#   field :health_insurance, type: Mongoid::Boolean
#   field :benefits, type: Mongoid::Boolean
