class UsersController < ApplicationController
  ###  for the new user page ###
  def new
    @user = User.new
  end
  def create
      puts "\n\nrunning create def in the user controller\n\n"
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
  ### The login Page
  ### should be a session but doing it this way for
  ### a deeper understanding...
  ###########################################################
  def log_in
    @user = User.new
  end
  def log_in_check
    # this will get the input from the forum
    user_to_check = User.new(params_user)

    # Check the databace for the user and log them in
    @user = User.find_by name: user_to_check.name
    if @user
      puts "\n user name is in the databace \n"

      #check the users passworrd
      if @user.authenticate(user_to_check.password)
        puts "\n Password Matches!"

        # change users logged_in status to true
        @user.logged_in = true
        puts "user logged in status: #{@user.logged_in}"
        cookies[:logged_in] = @user.id
        @user.save
        redirect_to '/pages/home', notice: "You have logged in!"
      else
        puts "\n Password doesn't Match! \n"
        @user = User.new
        flash.now[:error] = "That password doesn't match the user!"
        render 'users/log_in'
      end
    else
      puts "\n name doesn't Match! \n"
      @user = User.new
      flash.now[:error] = "That user name is not in the database!"
      render 'users/log_in'
    end
  end

end
