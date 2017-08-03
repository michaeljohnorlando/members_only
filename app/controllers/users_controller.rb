class UsersController < ApplicationController
  ###  for the new user page ###
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    @user.save
    #########################################################
    # testing that user is an object and has the right data #
    #puts "\n*************\n #{@user.name} \n************\n"#
    #########################################################
  end

  def params_user
    ##############################################################
    # params_user needs to be done, othwise would allow any user #
    # of the site to gain administrative access by including     #
    #  admin=’1’ in the web request.                             #
    # https://www.railstutorial.org/book/sign_up                 #
    ##############################################################
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  ###########################################################
  ### The login Page ###
  def log_in
    @user = User.new
  end
end
