class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
    @tweets_5to7 = Tweet.includes(:user).where(category_id: 2).sample(1)
    @tweets_8to11 = Tweet.includes(:user).where(category_id: 3).sample(1)
    @tweets_12to13 = Tweet.includes(:user).where(category_id: 4).sample(1)
    @tweets_14to16 = Tweet.includes(:user).where(category_id: 5).sample(1)
    @tweets_17to19 = Tweet.includes(:user).where(category_id: 6).sample(1)
    @tweets_20to22 = Tweet.includes(:user).where(category_id: 7).sample(1)
    @tweets_23to4 = Tweet.includes(:user).where(category_id: 8).sample(1)
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
