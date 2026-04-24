# 🎮 Jeu d'Adieu Apoorva - Godot 4.6

## Description
Un jeu FPS single-player développé en Godot pour célébrer le départ d'Apoorva, notre collègue bien-aimée. Résolvez 6 énigmes personnalisées et découvrez les messages d'adieu du team!

### Caractéristiques:
- ✅ **Mode single-player** (1 joueur au clavier)
- ✅ **Contrôles clavier ZQSD** + souris + manette optionnelle
- ✅ **3 actes progressifs** avec conditions d'avancement
- ✅ **6 énigmes personalisées** sur Apoorva
- ✅ **Musique ambiance** (Sabrina Carpenter - Espresso)
- ✅ **Messages d'adieu** depuis JSON
- ✅ **Easter egg spécial** (réponse "meme")
- ✅ **Compatible Windows & Mac**

---

## 🚀 Installation & Lancement

### Prérequis:
- Godot 4.6+ ([Télécharger](https://godotengine.org/download/))
- Windows 10+ ou macOS

### Setup Rapide:
1. Télécharger ou cloner le projet
2. Ouvrir le dossier `godot_jeu/` dans Godot
3. Godot détectera automatiquement le projet
4. Cliquer "Edit" pour lancer l'éditeur
5. Appuyer sur **F5** (ou cliquer Play) pour tester

### Jeu Directement:
Si vous avez l'exécutable `Jeu_Adieu_Apoorva.exe`:
- Double-cliquez simplement sur le fichier
- Aucune installation requise!

---

## 📁 Structure du Projet

```
godot_jeu/
├── scenes/
│   ├── menu.tscn          # Écran titre
│   ├── bureau.tscn        # Acte 1 - Exploration
│   ├── salle_aventures.tscn # Acte 2 - Énigmes
│   └── mur_messages.tscn  # Acte 3 - Messages final
├── scripts/
│   ├── input_manager.gd   # Gestion manettes
│   ├── player_controller.gd # Mouvement FPS
│   ├── camera_manager.gd  # Split-screen
│   ├── game_manager.gd    # Énigmes & progression
│   ├── ui_manager.gd      # UI & popups
│   ├── message_parser.gd  # Parse JSON
│   ├── menu.gd            # Menu principal
│   ├── bureau.gd          # Scène Bureau
│   └── interaction_raycaster.gd # Interactions
├── assets/
│   ├── images/            # Photos (11 images)
│   ├── audio/             # Musique (Espresso.mp3)
│   └── data/
│       ├── message.json   # Messages collègues
│       └── enigmes.json   # Définition énigmes
└── project.godot          # Config projet
```

---

## 🎮 Contrôles

### Clavier:
```
Mouvement:
  Z / Haut      → Avancer
  S / Bas       → Reculer
  Q / Gauche    → Tourner à gauche
  D / Droite    → Tourner à droite

Caméra:
  Souris        → Regarder autour (si clic-droit enfoncé)
  Clic-droit    → Mode look-around

Interaction:
  E             → Interagir avec objets/énigmes
  Espace        → Sauter (pour easter egg!)
  Entrée        → Valider réponse d'énigme

Autre:
  Échap         → Menu (si implémenté)
```

### Manette (optionnel):
```
Stick gauche  → Mouvement
Stick droit   → Regard
Bouton X/Carré → Interagir
```

---

## 🎯 Les 3 Actes du Jeu

### 📍 Acte 1: Bureau (Exploration)
- Une salle de bureau vide
- Le joueur doit explorer et trouver le bouton rouge "Quitter Bureau"
- Appuyer E sur le bouton pour progresser
- Aucune condition, libre d'accès

### 🔮 Acte 2: Salle Aventures (6 Énigmes)
- Une grande salle avec 6 buzzers colorés
- Chaque buzzer représente une énigme
- **CONDITION REQUISE**: Résoudre les 6/6 énigmes avant de pouvoir accéder à l'Acte 3
- Un bouton "Accès Mur des Messages" (désactivé jusqu'à 6/6 énigmes)

### 📜 Acte 3: Mur des Messages (Finale)
- Affichage des messages d'adieu personnalisés
- Messages du fichier `message.json`
- Scène finale pour célébrer Apoorva
- 👑 MEME QUEEN 👑

---

## 🎯 Les 6 Énigmes

| # | Question | Réponse Officielle | Bonus |
|---|----------|------------------|--------|
| 1 | Quel pays manque à sa famille? | netherlands | Tape "meme" pour easter egg! |
| 2 | Premier grand projet qu'elle a mené? | one ad conducteur | Tape "meme" pour easter egg! |
| 3 | Quel autre projet majeur? | le décrochage | Tape "meme" pour easter egg! |
| 4 | Sa passion secrète? | karaoke | Tape "meme" pour easter egg! |
| 5 | Phrase culte pour briser les...? | briser les glaçons | Tape "meme" pour easter egg! |
| 6 | Mot "interdit" qu'on adorait dire? | bordel | Tape "meme" pour easter egg! |

### 🎉 Easter Egg Spécial:
Si vous tapez **"meme"** pour n'importe quelle énigme:
- ✅ L'énigme est marquée comme résolue
- 👑 Message spécial: "MEME QUEEN FOR LIFE!"
- 🎊 Déverrouille une réponse amusante

---

## 📝 Personnalisation

### Ajouter tes propres messages:
Édite `assets/data/message.json`:
```json
{
  "messages": [
    {"auteur": "Ton Nom", "texte": "Ton message..."},
    {"auteur": "Autre", "texte": "Autre message..."}
  ]
}
```

### Modifier les énigmes:
Édite `assets/data/enigmes.json` pour ajouter/modifier les énigmes.

---

## 🔧 Développement

### Structure des Scènes:
Chaque scène (`*.tscn`) contient:
- **Player**: Le joueur (CharacterBody3D) avec Camera3D et PlayerController
- **GameManager**: Gère la progression et les énigmes
- **UIManager**: Affiche les dialogues et feedback
- **Environnement**: Les décors et objets interactifs

### Ajouter une énigme:
1. Éditer `assets/data/enigmes.json`
2. Ajouter un nouvel objet dans le array "enigmes":
   ```json
   {
     "id": 7,
     "question": "Ta question?",
     "reponse": "ta reponse",
     "indice": "indice si mauvaise",
     "type": "texte",
     "feedback": "message si correct"
   }
   ```
3. La nouvelle énigme sera chargée automatiquement

### Déboguer:
- Ouvrir la **console Godot** (bas de l'écran ou F12)
- Les logs apparaissent avec le préfixe `[NomDuScript]`
- Exemples:
  ```
  [GameManager] Loaded 6 enigmas
  [UIManager] Answer submitted for enigma 1
  [EasterEgg] 🎉 SECRET UNLOCKED!
  ```

---

## 🏗️ Build & Export

### Export Windows .exe:
1. **Project → Export...**
2. Sélectionner **Windows Desktop**
3. Cliquer **Export Project**
4. Choisir le dossier de destination

### Export Mac .app:
1. **Project → Export...**
2. Sélectionner **macOS**
3. Cliquer **Export Project**

*Note: Le build Mac depuis Windows nécessite quelques configurations avancées.*

---

## 🐛 Troubleshooting

### Godot n'ouvre pas le projet:
- Vérifier la version Godot: doit être 4.6+
- Télécharger la version correcte depuis godotengine.org
- Relancer Godot et sélectionner le dossier `godot_jeu/`

### Les scripts ne compilent pas:
- Ouvrir console (F12)
- Vérifier les erreurs rouges
- Les erreurs indiquent le fichier et la ligne du problème
- Relancer Godot après correction

### Pas de musique au démarrage:
- Vérifier que le fichier existe: `assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3`
- Vérifier que MusicManager est attaché à la scène Menu
- Vérifier le volume système Windows (coin bas-droit)
- Regarder console pour `[MusicManager] Music loaded`

### Les énigmes ne marchent pas:
- Vérifier que `enigmes.json` existe et est valide (jsonlint.com)
- Vérifier console pour `[GameManager] Loaded X enigmas`
- Vérifier que GameManager est dans la scène
- Vérifier que UIManager existe avec les bons éléments

### Le bouton "Quitter Bureau" ne marche pas:
- Vérifier qu'il existe dans la scène Bureau
- Vérifier que NextSceneButton.gd est attaché au bouton
- Appuyer E quand le curseur est sur le bouton

### L'énigme 6/6 n'active pas le bouton suivant:
- Attendre 2 secondes après "6/6 énigmes résolues"
- Appuyer E sur le bouton "Accès Mur des Messages"
- Si toujours grayed out: résoudre à nouveau la dernière énigme

### Manette ne fonctionne pas:
- Vérifier que la manette est branchée et détectée (Windows Settings → Devices)
- Relancer Godot après branchement
- Le jeu fonctionne aussi en clavier seul (ZQSD)

---

## 📞 Support

Besoin d'aide? Consulte les logs Godot (F12) pour plus d'infos.

---

**Créé avec ❤️ en Godot 4.3+**
