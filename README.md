
# Bot Twitter #hello_world

Un bot Twitter en **Ruby** permettant d'automatiser certaines interactions sur Twitter : envoyer des tweets, liker, suivre des comptes, et interagir avec des hashtags ou des journalistes.  

---

## Fonctionnalités

- **Envoyer un tweet** (`send_tweet`)  
- **Tweeter à 5 journalistes aléatoires** (`tweet_to_journalists`)  
- **Liker les derniers tweets d’un hashtag** (`like_latest`)  
- **Suivre les derniers comptes ayant tweeté un hashtag** (`follow_latest`)  
- **Streaming en live** pour liker et suivre automatiquement les tweets en direct (`live_stream`) — optionnel  

---

## Installation

1. Cloner le dépôt :  
```bash
git clone https://github.com/<votre-utilisateur>/twitter_bot.git
cd twitter_bot

Installer les dépendances :

bundle install

Gems utilisées :

twitter

dotenv

rspec (pour les tests)

Configuration

Créer un fichier .env à la racine :

TWITTER_CONSUMER_KEY=xxxxxx
TWITTER_CONSUMER_SECRET=xxxxxx
TWITTER_ACCESS_TOKEN=xxxxxx
TWITTER_ACCESS_TOKEN_SECRET=xxxxxx

**2.Remplacer xxxxxx par vos clés Twitter obtenues depuis le Twitter Developer Portal**


**3.Utilisation**

Créer un fichier run.rb pour exécuter le bot :

require_relative 'lib/twitter_bot'

# Envoyer un tweet de bienvenue
send_tweet("Bonjour Twitter ! #hello_world")

# Liker et suivre les tweets avec un hashtag
like_latest("#hello_world")
follow_latest("#hello_world")

# Tweeter à 5 journalistes aléatoires
tweet_to_journalists(["@journaliste1", "@journaliste2", "@journaliste3", "@journaliste4", "@journaliste5"])

# Streaming en live (optionnel)
# live_stream("#hello_world")

Exécuter :

ruby run.rb
Tests

Pour exécuter les tests :

rspec

Les tests couvrent :

Envoi de tweets

Interaction avec les journalistes

Like et follow automatique

Streaming en live

Structure du projet
twitter_bot/
│
├─ lib/
│   └─ twitter_bot.rb      # Méthodes du bot
├─ spec/
│   └─ twitter_bot_spec.rb # Tests RSpec
├─ run.rb                  # Fichier principal pour exécuter le bot
├─ Gemfile                 # Dépendances
└─ .env                    # Variables d'environnement
Contributions

Contributions bienvenues pour :

Ajouter des fonctionnalités supplémentaires (retweets, réponses automatiques…)

Gérer plusieurs hashtags ou utilisateurs

Améliorer les logs et la robustesse