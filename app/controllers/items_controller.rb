class ItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(todo_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved successfully"
      redirect_to current_user
    else
      flash[:alert] = "Item was not saved. Please enter item again."
      redirect_to current_user
    end
  end
#add destroy action
  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Marked as complete."
    else
      flash[:error] = "Error"
    end
#add AJAX
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def todo_params
    params.require(:item).permit(:name)
  end

end
