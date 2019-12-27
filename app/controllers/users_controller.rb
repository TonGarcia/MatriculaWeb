class UsersController < ApplicationController
  before_action :setup, only: [:new, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update, only: [:update]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @user = User.new
    @user.password = 123123
    @user.password_confirmation = 123123
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:locale, :role])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update
      devise_parameter_sanitizer.permit(:account_update, keys: [:locale])
    end

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      super(resource)
      # flash[:info] = t('devise.confirmations.send_instructions')
      flash.keep(:notice)
      new_session_path(resource)
    end

    # The path used after sign up for inactive accounts.
    def after_inactive_sign_up_path_for(resource)
      super(resource)
      # flash[:info] = t('devise.confirmations.send_instructions')
      flash.keep(:notice)
      new_user_session_path(resource)
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :code, :user_id)
    end

    # Role setup
    def setup
      @roles = Role.all
      @schools = School.all
    end

    # SignUp allowed params
    def sign_up_params
      sup = params.require(:user).permit(%i[locale name email password password_confirmation remember_me])
      sup[:role] = Role.with_name :user
      sup
    end
end
