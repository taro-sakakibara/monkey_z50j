class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets_5to7 = user.tweets.where(category_id: 2).sample(1)
    @tweets_8to11 = user.tweets.where(category_id: 3).sample(1)
    @tweets_12to13 = user.tweets.where(category_id: 4).sample(1)
    @tweets_14to16 = user.tweets.where(category_id: 5).sample(1)
    @tweets_17to19 = user.tweets.where(category_id: 6).sample(1)
    @tweets_20to22 = user.tweets.where(category_id: 7).sample(1)
    @tweets_23to4 = user.tweets.where(category_id: 8).sample(1)
  end
end
