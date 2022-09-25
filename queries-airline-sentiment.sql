-- See how many rows the table has
SELECT COUNT(*)
FROM codedtweets;

-- See the negative reasons
SELECT negativereason, COUNT(negativereason) as n
FROM codedtweets
GROUP BY negativereason;

-- Count of only negative tweets
SELECT count(*)
FROM codedtweets
WHERE airline_sentiment = 'negative';

-- Clean up data for R visuals
-- Breakdown by airline
SELECT airline, COUNT(negativereason) as n_tweets
FROM codedtweets
GROUP BY airline
ORDER BY n_tweets DESC;

-- Breakdown by reason
-- * note: in R change 'longlines' to 'Long Lines'
SELECT negativereason, COUNT(negativereason) as n_tweets
FROM codedtweets
GROUP BY negativereason
ORDER BY n_tweets DESC
LIMIT 10;

-- Breakdown by airline and reason
SELECT airline, negativereason, COUNT(negativereason) as n_tweets
FROM codedtweets
GROUP BY airline, negativereason
HAVING(COUNT(negativereason)) > 0
ORDER BY airline ASC, n_tweets DESC;

-- Negative sentiment check
SELECT tweet_id, airline_sentiment_confidence, negativereason, negativereason_confidence, text
FROM codedtweets
WHERE airline_sentiment = 'negative';

-- Non-negative sentiment check
SELECT tweet_id, airline_sentiment_confidence, text
FROM codedtweets
WHERE airline_sentiment <> 'negative';