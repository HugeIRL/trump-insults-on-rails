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
      puts "Invalid tweet #{t['tweet']}" unless tweet&.valid?
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
