class UsersController < ApplicationController

  def index
  	@users = User.all
  	
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :is_contributor, :is_admin)
  end

end
