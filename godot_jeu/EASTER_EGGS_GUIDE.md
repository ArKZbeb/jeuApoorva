# 🎁 Guide Complet des Easter Eggs

## 📚 Qu'est-ce qu'un Easter Egg ?

Un **easter egg** (œuf de Pâques) est une réponse secrète/bonus que les joueurs peuvent découvrir. Dans ton jeu, les easter eggs fonctionnent comme des réponses alternatives aux énigmes.

---

## 🎮 Easter Eggs Existants

Voici les 6 easter eggs déjà programmés dans le jeu :

| Réponse | Feedback | Où le taper | Image |
|---------|----------|-------------|-------|
| **meme** | 👑 MEME QUEEN FOR LIFE! 👑 | N'importe quelle énigme | Affiche une image aléatoire |
| **apoorva** | 🌟 C'est elle! Apoorva est une REINE! 🌟 | N'importe quelle énigme | Affiche une image aléatoire |
| **merci** | 💙 De rien! Merci à toi aussi Apoorva! 💙 | N'importe quelle énigme | Affiche une image aléatoire |
| **team** | 👥 C'est ça! L'équipe c'est super avec toi! 👥 | N'importe quelle énigme | Affiche une image aléatoire |
| **help** | 📖 L'indice est là! Regarde bien! 📖 | N'importe quelle énigme | Affiche une image aléatoire |
| **godot** | 🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮 | N'importe quelle énigme | Affiche une image aléatoire |

---

## 🎯 Comment jouer avec les Easter Eggs

### 📖 Étape 1: Lancer le jeu
```
1. Démarrer le jeu
2. Passer le menu
3. Arriver à une énigme
```

### 🔤 Étape 2: Taper un Easter Egg
```
À n'importe quelle énigme, au lieu de répondre correctement:
- Tape "meme"
- Clique sur "Soumettre" ou "Submit"
```

### ✅ Étape 3: Le feedback s'affiche
```
- Le message spécial apparaît ✅
- Une image aléatoire pop-up (3 secondes)
- L'énigme compte comme "résolue"
- Tu peux continuer au jeu
```

---

## 💻 Comment Fonctionnent les Easter Eggs (Technique)

### 1️⃣ Structure dans GameManager

Les easter eggs sont vérifiés **avant** les réponses correctes :

```gdscript
# FILE: game_manager.gd (lignes 75-147)

# Normaliser la réponse du joueur
var normalized_answer = answer.to_lower().replace(" ", "")
var normalized_correct = enigma["reponse"].to_lower().replace(" ", "")

# Vérifier les easter eggs
var is_easter_egg = false

# Easter egg 1: "meme"
if normalized_answer == "meme":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("👑 MEME QUEEN FOR LIFE! 👑", true)
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'meme' triggered!")
    return
```

### 2️⃣ Flow d'un Easter Egg

```
Joueur tape "meme"
    ↓
GameManager.submit_enigma_answer() est appelé
    ↓
Normalisation: "meme" → "meme" (identique)
    ↓
Vérification easter eggs: if normalized_answer == "meme"
    ↓
✅ Match trouvé!
    ↓
1. solved_enigmas[enigma_id] = true (compte comme résolu)
2. UIManager affiche le feedback 👑 MEME QUEEN FOR LIFE! 👑
3. EasterEggManager.show_easter_egg_image() (nouvelle image)
4. check_all_enigmas_solved() (vérifier si jeu terminé)
```

---

## 🔧 Ajouter un Nouveau Easter Egg

### 📝 Étape 1: Modifier game_manager.gd

Ajoute cette section après les autres easter eggs (avant la ligne 148):

```gdscript
# Easter egg 7: "fleur" (nouvel exemple)
if normalized_answer == "fleur":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("🌸 La fleur est belle, comme toi! 🌸", true)
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'fleur' triggered!")
    return
```

### 📋 Étape 2: Où mettre le code

Fichier: `/home/tristanturgy/Projets/jeuApoorva/godot_jeu/scripts/game_manager.gd`

```
Ligne 137-146: Easter egg 'godot'
Ligne 147: return
----> AJOUTE TON NOUVEAU CODE ICI (Ligne 148-156)
Ligne 148: var is_correct = normalized_answer == normalized_correct
```

### ✅ Exemple Complet

```gdscript
# Easter egg 7: "fleur"
if normalized_answer == "fleur":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("🌸 La fleur est belle, comme toi! 🌸", true)
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'fleur' triggered!")
    return

# Easter egg 8: "france"
if normalized_answer == "france":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("🇫🇷 Oui, c'est le pays de Apoorva! 🇫🇷", true)
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'france' triggered!")
    return
```

---

## 🎨 Personnaliser le Feedback

### 📝 Exemples de Feedback amusants

```gdscript
# Avec emojis
ui_manager.show_feedback("🎉 SURPRISE! Tu as trouvé un secret! 🎉", true)

# Avec références personnelles
ui_manager.show_feedback("💙 C'est exactement ce que nous pensons! 💙", true)

# Avec humour
ui_manager.show_feedback("😂 Bien vu! C'était un piège! 😂", true)

# Avec motivation
ui_manager.show_feedback("⭐ Tu es un champion! Continue! ⭐", true)
```

### 🎬 Emojis Utiles

```
👑 Couronne (royauté)
🎉 Confettis (fête)
🌟 Étoile (excellence)
💙 Cœur (affection)
😂 Rire (humour)
🎮 Manette (jeu)
🎵 Musique (passion)
🌸 Fleur (beauté)
🇫🇷 France (pays)
🎯 Objectif (cible)
```

---

## 🖼️ Affichage d'Images pour Easter Eggs

### Comment ça marche ?

Quand un easter egg est trouvé :

1. **GameManager** valide la réponse
2. **UIManager** affiche le feedback
3. **EasterEggManager** déclenche `show_easter_egg_image()`
4. **EasterEggImagePopup** affiche une image aléatoire (3 sec)

### Code pour ajouter l'image

L'image s'affiche **automatiquement** si tu ajoutes cette ligne :

```gdscript
# Après le feedback
ui_manager.show_feedback("🌸 La fleur est belle! 🌸", true)

# Déclencher l'image
var easter_egg_manager = get_tree().root.get_child(0).find_child("EasterEggManager", true, false)
if easter_egg_manager:
    easter_egg_manager.show_easter_egg_image()
```

---

## 🔄 Les 6 Easter Eggs Actuels

### 1. **MEME**
```
Réponse: meme
Feedback: 👑 MEME QUEEN FOR LIFE! 👑
Utilité: Easter egg principal, hommage à Apoorva
```

### 2. **APOORVA**
```
Réponse: apoorva
Feedback: 🌟 C'est elle! Apoorva est une REINE! 🌟
Utilité: Personnalisation directe
```

### 3. **MERCI**
```
Réponse: merci
Feedback: 💙 De rien! Merci à toi aussi Apoorva! 💙
Utilité: Gratitude réciproque
```

### 4. **TEAM**
```
Réponse: team
Feedback: 👥 C'est ça! L'équipe c'est super avec toi! 👥
Utilité: Sentiment collectif
```

### 5. **HELP**
```
Réponse: help
Feedback: 📖 L'indice est là! Regarde bien! 📖
Utilité: Aide intégrée
```

### 6. **GODOT**
```
Réponse: godot
Feedback: 🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮
Utilité: Meta-humour du jeu
```

---

## ⚙️ Fichiers Impliqués

```
game_manager.gd (lignes 75-147)
  ↓ Valide les easter eggs
  
ui_manager.gd (lignes 72-78)
  ↓ Affiche le feedback
  
easter_egg_manager.gd (lignes 50-80)
  ↓ Gère les images
  
easter_egg_image_popup.gd
  ↓ Affiche la popup
  
image_manager.gd (lignes 1-50)
  ↓ Charge les 11 images
```

---

## 🎯 Checklist pour Ajouter un Easter Egg

- [ ] Identifier le mot-clé (ex: "fleur")
- [ ] Écrire le message de feedback amusant
- [ ] Choisir les emojis appropriés
- [ ] Ajouter le code dans `game_manager.gd` (après ligne 146)
- [ ] Tester: relancer le jeu et taper le mot-clé
- [ ] Vérifier que l'image s'affiche
- [ ] Vérifier que l'énigme compte comme "résolue"

---

## 🧪 Tester les Easter Eggs

### Méthode 1: En jeu normal
```
1. Lancer le jeu
2. À une énigme quelconque
3. Taper "meme"
4. Cliquer "Soumettre"
5. ✅ Voir le message 👑 MEME QUEEN FOR LIFE! 👑
6. ✅ Voir une image aléatoire (3 sec)
```

### Méthode 2: Console Godot
```
1. Ouvrir Godot Editor
2. Jouer la scène
3. F2 pour ouvrir la console
4. Taper dans la console:
   get_tree().current_scene.get_node("GameManager").submit_enigma_answer(1, "meme")
5. ✅ L'easter egg devrait se déclencher
```

---

## 💡 Idées d'Easter Eggs Supplémentaires

```
"merci merci" → "Gratitude infinie! 🙏"
"bravo" → "Merci de ton soutien! 👏"
"amie" → "Tu es plus qu'une collègue, t'es une amie! 💕"
"colombie" → "La Colombie te manque? 🇨🇴"
"inde" → "L'Inde, le pays des parents! 🇮🇳"
"danse" → "Tu danses magnifiquement! 💃"
"rire" → "Ton rire nous manquera! 😊"
"boss" → "La meilleure boss de tous les temps! 👔"
```

---

## 📊 Résumé Technique

| Aspect | Détail |
|--------|--------|
| **Triggers** | 6 mots-clés: meme, apoorva, merci, team, help, godot |
| **Normalisation** | Minuscules, pas d'espaces (`to_lower().replace(" ", "")`) |
| **Feedback** | Couleur verte, durée 2 sec, avec emojis |
| **Images** | Aléatoires du dossier `assets/images/` (11 images) |
| **Compte comme résolu** | ✅ Oui, l'énigme compte comme résolue |
| **Auto-hide** | Popup : 3 secondes, puis disparition |
| **Affichage** | Centre de l'écran, format 400x300px |

---

## 🚀 Résultat Attendu

Quand tu tapes "meme" :

```
Input: "meme"
  ↓
✅ Easter egg detecté
  ↓
Feedback: "👑 MEME QUEEN FOR LIFE! 👑" (vert, 2 sec)
  ↓
Image: Affichée au centre (aléatoire, 3 sec)
  ↓
Compte comme résolu: ✅ Oui
  ↓
Progression: +1 énigme résolue sur 6
```

---

**Bon amusement avec les easter eggs! 🎁**
