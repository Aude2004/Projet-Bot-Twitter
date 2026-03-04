Bot Twitter #hello_world

Un bot Twitter simple en Ruby pour envoyer des tweets, liker, suivre des comptes et écouter les tweets en live sur un hashtag.

Fonctionnalités

Connexion à Twitter via l’API avec des clés sécurisées dans .env.

Envoyer un tweet avec send_tweet(message).

Tweeter à 5 journalistes aléatoires avec tweet_to_journalists(journalists).

Liker les derniers tweets d’un hashtag avec like_latest(hashtag, count = 25).

Suivre les derniers comptes ayant tweeté avec un hashtag avec follow_latest(hashtag, count = 20).

Streaming en live pour liker et suivre automatiquement les tweets en temps réel sur un hashtag avec live_stream(hashtag).