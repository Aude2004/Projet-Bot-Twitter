require 'twitter'
require 'dotenv'
Dotenv.load

def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

  return client
end
def send_tweet(message, client = nil)
  client ||= login_twitter
  client.update(message)
end
# === 3. Tweeter à 5 journalistes aléatoires ===
def tweet_to_journalists(journalists, client = login_twitter)
  journalists.sample(5).each do |handle|
    message = "Salut #{handle}, merci pour votre travail ! #hello_world"
    send_tweet(message, client) 
  end
end

# === 4. Liker les derniers tweets avec un hashtag ===  
def like_latest(hashtag, count = 25)
  client = login_twitter
  client.search(hashtag, result_type: "recent").take(count).each do |tweet|
    begin
      tweet.favorite
      puts "Tweet liké : #{tweet.text[0..50]}..."
    rescue => e
      puts "Erreur like : #{e.message}"
    end
  end
end

# === 5. Follow les derniers comptes ayant tweeté avec un hashtag ===
def follow_latest(hashtag, count = 20)
  client = login_twitter
  client.search(hashtag, result_type: "recent").take(count).each do |tweet|
    begin
      user = tweet.user
      unless user.following?
        user.follow
        puts "Follow : #{user.screen_name}"
      end
    rescue => e
      puts "Erreur follow : #{e.message}"
    end
  end
end

# === 6. Streaming en live pour like et follow ===
def live_stream(hashtag, stream_client = nil)
  stream_client ||= Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

  stream_client.filter(track: hashtag) do |tweet|
    next unless tweet.respond_to?(:favorite) && tweet.respond_to?(:user)
    begin
      tweet.favorite
      user = tweet.user
      user.follow unless user.following?
    rescue => e
      puts "Erreur live : #{e.message}"
    end
  end
end
#require 'pry'
#binding.pry