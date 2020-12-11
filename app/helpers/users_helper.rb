module UsersHelper
  def users_lists(tweets)
    html = ''
    tweets.each do |tweet|
      html += render(partial: 'tweets/tweet', locals: { tweet: tweet })
    end
    raw(html)
  end
end
