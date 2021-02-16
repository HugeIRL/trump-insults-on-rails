# For this assignment, I will be using Trump's tweet data from Kaggle.
# It is organized as one row with the following columns:
# "#"(Number), date(DateTime), target(String), insult(String) and tweet(String).
# I will build 3 models based off the tweet itself (with the time included)...
# The target that the tweet was targetting as the second model...
# And the insult that was used during the tweet.
# I will primarily use a one to one relationship from the tweet to the insult and target,
# But I will also use a many to one on the opposite side of the relationship
# (from the target/insult) back to the tweet. This will allow me to use joins if required.

require "csv"

Tweet.delete_all
Target.delete_all
Insult.delete_all

filename = Rails.root.join("db/trump_tweets.csv")

puts "Importing CSV data from: #{filename}"

csv_data = File.read(filename)
tweets = CSV.parse(csv_data, headers: true, encoding: "utf-8")

tweets.each do |t|
  target = Target.find_or_create_by(prey: t["target"])
  insult = Insult.find_or_create_by(text: t["insult"])

  if target && target&.valid?
    if insult && insult&.valid?
      tweet = Tweet.create(
        date:    t["date"],
        message: t["tweet"],
        target:  target,
        insult:  insult
      )
      puts "Invalid or duplicate tweet: #{t['tweet']}" unless tweet&.valid?
    else
      puts "Invalid insult: #{t['insult']} for tweet: #{t['tweet']}"
    end
  else
    puts "Invalid target: #{t['target']} for tweet: #{t['tweet']}"
  end
end

puts "Created #{Tweet.count} tweets."
puts "Created #{Target.count} targets."
puts "Created #{Insult.count} insults."
