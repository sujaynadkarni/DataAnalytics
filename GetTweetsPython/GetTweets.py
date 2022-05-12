import tweepy
import pandas as pd

Client = tweepy.Client("Enter your Bearer Token")

search_query = "BTC"

tweets = Client.get_recent_tweets_count(query = search_query)

data = tweets.data

df = pd.DataFrame(data,columns = ['end','start','tweet_count'])

df.to_csv('tweets_count_BTC.csv')

tweets_sentiments = Client.search_recent_tweets(query = search_query, max_results  = 100)

data_sentiments = tweets_sentiments.data

df_sentiments = data_sentiments[0:]

df2 = pd.DataFrame(df_sentiments)

df2.to_csv('tweet_sentiment_analysis.csv')
