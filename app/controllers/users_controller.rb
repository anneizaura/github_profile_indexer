class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    if params[:query].present?
      @users = @users.global_search(params[:query])
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    scrapper_data = Scrapper::CreateScrapperService.new.get_from_url(@user.url)
    generate_short_url = Shortener::CreateShortenerService.new.short_link(@user.url)

    @user.nick_name = scrapper_data["nick_name"]
    @user.img = scrapper_data["img"]
    @user.followers = scrapper_data["followers"]
    @user.following = scrapper_data["following"]
    @user.stars = scrapper_data["stars"]
    @user.contributions = scrapper_data["contributions"]
    @user.organization = scrapper_data["organization"]
    @user.location = scrapper_data["location"]
    @user.short_url = generate_short_url

    respond_to do |format|
      if @user.save
        puts "created url #{@user.url}"

        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      scrapper_data = Scrapper::CreateScrapperService.new.get_from_url(@user.url)
      generate_short_url = Shortener::CreateShortenerService.new.short_link(@user.url)

      if @user.update(
        nick_name: scrapper_data["nick_name"],
        img: scrapper_data["img"],
        followers: scrapper_data["followers"],
        following: scrapper_data["following"],
        stars: scrapper_data["stars"],
        contributions: scrapper_data["contributions"],
        organization: scrapper_data["organization"],
        location: scrapper_data["location"],
        short_url: generate_short_url
      )
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :url)
  end
end
