class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @tweet = Tweet.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render new_tweet_path
    end
  end

  def destroy
    @tweet.destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text, :category_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
