# 🐦 Twitter Bot — `#hello_world`

Un bot Twitter en **Ruby** permettant d'automatiser certaines interactions sur Twitter : envoyer des tweets, liker, suivre des comptes, et interagir avec des hashtags ou des journalistes.

---

## ✨ Fonctionnalités

- **`send_tweet`** — Envoyer un tweet
- **`tweet_to_journalists`** — Tweeter à 5 journalistes aléatoires
- **`like_latest`** — Liker les derniers tweets d'un hashtag
- **`follow_latest`** — Suivre les derniers comptes ayant tweeté un hashtag
- **`live_stream`** *(optionnel)* — Streaming en live pour liker et suivre automatiquement les tweets en direct

---

## 📁 Structure du projet
```
twitter_bot/
├── lib/
│   └── twitter_bot.rb       # Méthodes du bot
├── spec/
│   └── twitter_bot_spec.rb  # Tests RSpec
├── run.rb                   # Fichier principal d'exécution
├── Gemfile                  # Dépendances
└── .env                     # Variables d'environnement (non versionné)
```

---

## ⚙️ Installation

### 1. Cloner le dépôt
```bash
git clone https://github.com/<votre-utilisateur>/twitter_bot.git
cd twitter_bot
```

### 2. Installer les dépendances
```bash
bundle install
```

Gems utilisées : `twitter`, `dotenv`, `rspec`

---

## 🔐 Configuration

### 1. Créer le fichier `.env` à la racine du projet
```env
TWITTER_CONSUMER_KEY=xxxxxx
TWITTER_CONSUMER_SECRET=xxxxxx
TWITTER_ACCESS_TOKEN=xxxxxx
TWITTER_ACCESS_TOKEN_SECRET=xxxxxx
```

### 2. Obtenir vos clés API

Rendez-vous sur le [Twitter Developer Portal](https://developer.twitter.com/) pour générer vos clés et remplacer les `xxxxxx` ci-dessus.

> ⚠️ Ne committez jamais votre fichier `.env`. Ajoutez-le à votre `.gitignore`.

---

## 🚀 Utilisation

Créez un fichier `run.rb` et configurez les actions souhaitées :
```ruby
require_relative 'lib/twitter_bot'

# Envoyer un tweet de bienvenue
send_tweet("Bonjour Twitter ! #hello_world")

# Liker les tweets du hashtag
like_latest("#hello_world")

# Suivre les comptes du hashtag
follow_latest("#hello_world")

# Tweeter à 5 journalistes aléatoires
tweet_to_journalists([
  "@journaliste1",
  "@journaliste2",
  "@journaliste3",
  "@journaliste4",
  "@journaliste5"
])

# Streaming en live (optionnel)
# live_stream("#hello_world")
```

Puis exécutez :
```bash
ruby run.rb
```

---

## 🧪 Tests
```bash
rspec
```

Couverture : envoi de tweets, interaction avec les journalistes, like et follow automatique, streaming en live.

---

## 🤝 Contributions

Les contributions sont les bienvenues ! Quelques idées :

- Ajouter des fonctionnalités (retweets, réponses automatiques…)
- Gérer plusieurs hashtags ou listes d'utilisateurs
- Améliorer les logs et la robustesse

Ouvrez une *issue* ou soumettez une *pull request*.

---

