class UsersController < ApplicationController
  wrap_parameters :user, include: [:username, :email, :password, :password_confirmation]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /me (Auto Login feature)
  def show
    user = User.find_by(id: session[:user_id])
    # byebug
    if user 
        render json: user, include: [:movies, :categories]
    else
        render json: { errors: ["Not authorized"] }, status: :unauthorized
    end
  end

  # POST /users (create new user)
  def create
    user = User.create!(user_params)
    if user
      session[:user_id] = user.id 
      render json: user, include: ['movies'], status: :created
    else
      render json: { errors: ['Not authorized'] }, status: :unauthorized
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
