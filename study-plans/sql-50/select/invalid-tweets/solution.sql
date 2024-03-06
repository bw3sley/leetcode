/* Write your T-SQL query statement below */
SELECT Tweets.tweet_id FROM Tweets WHERE LEN(Tweets.content) > 15