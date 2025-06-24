# La première pipeline


### 🧮 Mini Projet - Calculatrice Moderne

Un projet généré grâce à de l'intelligence artificielle dans le but de mettre en place un pipeline
d'Intégration Continue.


## Déploiement Automatisé avec Netlify

Nous utilisons **Netlify** pour déployer automatiquement chaque branche et chaque pull request, sans modification de la CI.

- **Branch Deploys** :

  - À chaque push sur une branche, Netlify construit et déploie le site.
  - URL de déploiement : `https://integration-deploiement.netlify.app`

- **Deploy Previews (PR)** :

  - Lorsqu’une pull request est ouverte, Netlify génère un aperçu (review deploy) accessible via une URL dédiée.

---

## Intégration avec GitHub Actions (CI)

Le pipeline CI reste inchangé et continue de valider le code avant déploiement :

- **Fichier** : `.github/workflows/ci.yml`
- **Déclencheurs** :
  - `push` sur **toutes** les branches
  - `pull_request` sur **toutes** les branches

### Jobs définis

1. **Linting (pre-commit)**

   - Environnement : `ubuntu-latest` + Node.js 20
   - Étapes :
     - Checkout du code
     - Installation des dépendances (`npm ci --no-cache`)
     - Exécution du lint (`npm run lint`)

2. **Build & Tests (build-test)**

   - Environnement : `ubuntu-latest` + Node.js 20
   - Étapes :
     - Checkout du code
     - Installation des dépendances (`npm ci`)
     - Construction du projet (`npm run build`)
     - Exécution des tests (`npm run test`)

> **Aucun changement requis** : ces jobs s’exécutent sur toutes les branches et PR, assurant une validation avant chaque déploiement Netlify.

---



