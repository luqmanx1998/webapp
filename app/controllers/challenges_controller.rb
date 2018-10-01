class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def index
    @challenges = Challenge.all
  end

  def show
    @posts = Post.where(:submission_type => 'Challenge', :submission_id => @challenge).order("created_at DESC")
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
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: 'Challenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:title, :description, :cover, :video, :resources, :user, :challenge_type_id)
    end
end
