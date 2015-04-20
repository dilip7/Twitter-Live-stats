# demoapp

it fetches live stats for a keyword say "android" , shows domains and count of twweets .

However I have for now kept google.co.in or app.facebook.com as domain as going for two charachter domain was a big pain to do  and I spent lot of time but nothing worthwhile was achieved, for demo purpose I think this much would suffice


MongoDB is used from MongoLab as an addon on heroku

if twitter sends #error
  server will stop.
  twitter sends #end
  server will stop ..

in both these cases peocess will restart.


# limitations
1. on desktop pcs , clicking on url is little bit messed up as data is fetched fast ,but on mobiles it works like charm
2. UI , UX  could be improved period. 


#TODO
clicking on  domain shows list of tweets which had the specified domain url in them (either directly or shortened)
