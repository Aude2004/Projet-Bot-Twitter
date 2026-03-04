require 'rspec'
require 'twitter'
require 'dotenv'
Dotenv.load
require_relative '../lib/twitter_bot'

# === 1. Test login_twitter non demandé ===

# === 2. Test send_tweet ===
describe "send_tweet method" do
  it "should call update on the Twitter client" do
    client = instance_double("Twitter::REST::Client")
    allow(client).to receive(:update)
    
    expect(client).to receive(:update).with("Hello world!")
    send_tweet("Hello world!", client)
  end
end

# === 3. Test tweet_to_journalists ===
describe "tweet_to_journalists method" do
  it "should send tweets to 5 journalists" do
    journalists = ["@jcunniet", "@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart",
                   "@bendarag", "@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol"]

    client = instance_double("Twitter::REST::Client")
    allow(client).to receive(:update)

    expect(client).to receive(:update).exactly(5).times
    tweet_to_journalists(journalists, client)
  end
end

# === 4. Test like_latest ===
describe "like_latest method" do
  it "should like tweets with a hashtag" do
    tweet = double("tweet", text: "Test tweet")
    allow(tweet).to receive(:favorite)

    client = instance_double("Twitter::REST::Client")
    allow(client).to receive(:search).and_return([tweet])
    allow_any_instance_of(Object).to receive(:login_twitter).and_return(client)

    expect(tweet).to receive(:favorite)
    like_latest("#hello_world", 1)
  end
end

# === 5. Test follow_latest ===
describe "follow_latest method" do
  it "should follow users from tweets with a hashtag" do
    user = double("user", screen_name: "testuser", following?: false)
    allow(user).to receive(:follow)

    tweet = double("tweet", user: user)

    client = instance_double("Twitter::REST::Client")
    allow(client).to receive(:search).and_return([tweet])
    allow_any_instance_of(Object).to receive(:login_twitter).and_return(client)

    expect(user).to receive(:follow)
    follow_latest("#hello_world", 1)
  end
end

# === 6. Test live_stream ===
describe "live_stream method" do
  it "should like and follow tweets in the live stream" do
    user = double("user", screen_name: "liveuser", following?: false)
    allow(user).to receive(:follow)

    tweet = double("tweet", text: "Live tweet test", user: user)
    allow(tweet).to receive(:favorite)

    stream_client = double("stream_client")
    allow(Twitter::Streaming::Client).to receive(:new).and_return(stream_client)
    allow(stream_client).to receive(:filter).and_yield(tweet)

    expect(tweet).to receive(:favorite).once
    expect(user).to receive(:follow).once

    live_stream("#hello_world", stream_client)
  end
end