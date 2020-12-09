class TweetsController < ApplicationController
  # before_action :set_tweet, only: [:edit, :show]
  # before_action :move_to_index, except: [:index, :show,:search]

  def index
    @tweets = Tweet.includes(:user).order('created_at DESC')
    #  query = "SELECT * FROM tweets"
    #  @tweets = Tweet.find_by_sql(query)
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

  #  def destroy
  #   tweet = Tweet.find(params[:id])
  #   tweet.destroy
  #  end

  #  def edit
  #  end

  #  def update
  #   tweet = Tweet.find(params[:id])
  #   tweet.update(tweet_params)
  #  end

  #  def show
  #   @comment = Comment.new
  #   @comments = @tweet.comments.includes(:user)
  #  end

  #  def search
  #   @tweets = SearchTweetsService.search(params[:keyword])
  #  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text, :category_id).merge(user_id: current_user.id)
  end

  #  def set_tweet
  #   @tweet = Tweet.find(params[:id])
  #  end

  #  def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
