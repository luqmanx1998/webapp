class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy, :submit]
  before_action :authenticate_user!

  def index
    @posts = Challenge.all
  end

  def show
    @posts = Post.submitted(@challenge)
  end

  def new
    @challenge = Challenge.new
    @challenge.user = current_user
    @challenge.challenge_type = Interest.find_by_name(params["type"])
  end

  def edit
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' 
  end

  def submit 
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:title, :description, :cover, :video, :resources, :user, :challenge_type_id)
    end
end
