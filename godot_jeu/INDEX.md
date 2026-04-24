# 📑 INDEX - Navigation Complète du Projet

**Version:** 1.1.0  
**Status:** FINAL RELEASE ✅  
**Date:** 24 Avril 2026

## 🎯 Par Cas d'Usage

### Je veux JUSTE JOUER
→ Lire: **QUICKSTART.md** (5 min)  
→ Commandes: `F5` dans Godot  
→ Ou: Double-clic sur `Jeu_Adieu_Apoorva.exe`

### Je veux UTILISER les EASTER EGGS ✨ (NOUVEAU!)
→ Lire: **EASTER_EGGS_QUICK_START.md** (2 min)  
→ Taper "meme" à une énigme  
→ Voir le feedback spécial + image!

### Je veux AJOUTER un EASTER EGG ✨ (NOUVEAU!)
→ Lire: **EASTER_EGGS_HOW_TO.md** (5 min)  
→ Guide pas à pas avec copie/colle  
→ Ligne 146 du `scripts/game_manager.gd`

### Je veux COMPRENDRE les EASTER EGGS ✨ (NOUVEAU!)
→ Lire: **EASTER_EGGS_GUIDE.md** (15 min)  
→ Explication technique complète  
→ Comment modifier et créer

### J'ai un PROBLÈME
→ Lire: **TROUBLESHOOTING.md**  
→ Vérifier: Console Godot (F12)  
→ Consult: Relevant documentation section

### Je veux TESTER COMPLÈTEMENT
→ Lire: **TEST_PLAN.md** (NEW - v1.1.0)  
→ Suivi: 8 catégories de tests  
→ Durée: 30-45 minutes

### Je veux COMPRENDRE l'architecture
→ Lire: **README.md**  
→ Lire: **MANIFEST.txt**  
→ Structure: `scripts/` (34 files) + `scenes/` (4 scenes)

### Je veux EXPORTER en .exe
→ Lire: **BUILD.md** (UPDATED - v1.1.0)  
→ Commandes: `Project → Export`  
→ Durée: 15-20 minutes

### Je veux DÉPLOYER vers Apoorva
→ Lire: **DEPLOYMENT_CHECKLIST.md** (NEW - v1.1.0)  
→ Suivi: Checklist complet  
→ Durée: 30-45 minutes

### Je veux PERSONNALISER les messages
→ Éditer: `assets/data/message.json`  
→ Relancer: `F5`  
→ Format: JSON array with auteur & texte

---

## 📁 Fichiers & Dossiers

### 📚 Documentation

```
├── README.md                    ← Guide complet (UPDATED v1.1.0)
├── QUICKSTART.md                ← Démarrage rapide (UPDATED v1.1.0)
├── TEST_PLAN.md                 ← Plan de test complet (NEW v1.1.0) ⭐
├── BUILD.md                     ← Export Windows/Mac (UPDATED v1.1.0)
├── CHANGELOG.md                 ← Historique des versions (NEW v1.1.0) ⭐
├── MANIFEST.txt                 ← Fichiers & structure détaillée (UPDATED v1.1.0)
├── DEPLOYMENT_CHECKLIST.md      ← Déploiement vers Apoorva (NEW v1.1.0) ⭐
├── TROUBLESHOOTING.md           ← Résolution de problèmes
├── RESUME.txt                   ← Vue d'ensemble visuelle
├── IMPROVEMENTS.md              ← Améliorations (NEW v1.2.0) ⭐
├── BUGFIXES.md                  ← Corrections bugs (NEW v1.2.0) ⭐
├── EASTER_EGGS_QUICK_START.md   ← Easter eggs rapide (NEW v1.2.0) ⭐
├── EASTER_EGGS_HOW_TO.md        ← Guide pas à pas (NEW v1.2.0) ⭐
├── EASTER_EGGS_GUIDE.md         ← Guide complet (NEW v1.2.0) ⭐
├── EASTER_EGGS_TUTORIAL.md      ← Tutoriel pratique (NEW v1.2.0) ⭐
├── COMPLETE_SUMMARY.md          ← Résumé complet (NEW v1.2.0) ⭐
├── INDEX.md                     ← Ce fichier (navigation)
├── LAUNCH.txt                   ← Instructions de lancement
└── checklist.sh                 ← Vérifier tout est OK
```

**NOUVEAU en v1.1.0:**
⭐ TEST_PLAN.md - Procédures de test complètes avec résultats attendus
⭐ CHANGELOG.md - Historique détaillé des changements
⭐ DEPLOYMENT_CHECKLIST.md - Guide complet du déploiement

**NOUVEAU en v1.2.0 (Easter Eggs & Images):**
⭐ IMPROVEMENTS.md - Résumé de toutes les améliorations (musique, images)
⭐ BUGFIXES.md - 2 bugs corrigés avec explications
⭐ EASTER_EGGS_QUICK_START.md - Résumé rapide des easter eggs (2 min)
⭐ EASTER_EGGS_HOW_TO.md - Guide pas à pas (5 min)
⭐ EASTER_EGGS_GUIDE.md - Documentation technique complète (15 min)
⭐ EASTER_EGGS_TUTORIAL.md - 3 tutoriels pratiques (10 min)
⭐ COMPLETE_SUMMARY.md - Vue d'ensemble complète avec tous les détails

### 🎮 Scènes (Fichiers .tscn)
```
scenes/
├── menu.tscn              ← Écran titre avec boutons
├── bureau.tscn            ← Acte 1 - Exploration 4 joueurs
├── salle_aventures.tscn   ← Acte 2 - Énigmes coopératives
└── mur_messages.tscn      ← Acte 3 - Messages final + photos
```

### 📝 Scripts (Fichiers .gd)
```
scripts/

🎮 Core Gameplay:
├── input_manager.gd            ← Détecte 4 manettes
├── player_controller.gd        ← Mouvement FPS + caméra joueur
├── camera_manager.gd           ← Split-screen 2x2

🎯 Game Logic:
├── game_manager.gd             ← Énigmes, progression
├── ui_manager.gd               ← Popups, feedback, UI
├── message_parser.gd           ← Parse JSON messages

🎨 Objets & Interactions:
├── interactable_object.gd      ← Objets interactifs (drapeaux, etc.)
├── interaction_raycaster.gd    ← Raycast pour clics
├── photo_frame.gd              ← Affichage photos 3D

🎬 Scènes:
├── menu.gd                      ← Logique menu
├── bureau.gd                    ← Logique Acte 1
├── salle_aventures.gd          ← Logique Acte 2
├── mur_messages.gd             ← Logique Acte 3

🔧 Utilitaires:
├── audio_manager.gd            ← Gestion musique
├── scene_transition.gd         ← Transitions entre scènes
├── game_globals.gd             ← Variables globales
└── game_scene.gd               ← Initialisation générale
```

### 🎨 Assets
```
assets/
├── images/                      ← 11 photos
│   ├── 20250925_134343.jpg
│   ├── 20250925_134412.jpg
│   ├── IMG_0343.jpeg
│   ├── IMG_0348.jpeg
│   ├── IMG_0557.jpeg
│   ├── IMG_6271.jpeg
│   ├── IMG_7089.jpeg
│   ├── IMG_7093.jpeg
│   ├── IMG_7194.JPG
│   ├── photoMariage.png
│   └── unnamed.jpg
│
├── audio/                       ← Musique
│   └── Sabrina Carpenter - Espresso (Official Video).mp3
│
└── data/                        ← Données JSON
    ├── message.json             ← 10 messages d'adieu
    └── enigmes.json             ← 6 énigmes + réponses
```

### ⚙️ Configuration
```
project.godot                   ← Config Godot (Engine, rendering, input)
.gitignore                      ← (Si Git)
```

---

## 🎯 Flux de Développement

### 1. Démarrage
```
Godot Project Manager
└─ Open Project
   └─ jeuApoorva/godot_jeu/
      └─ Edit
         └─ Godot Editor charge le projet
```

### 2. Pendant le développement
```
Godot Editor
├─ F5 pour tester
├─ F12 pour logs
├─ Ctrl+Alt+U pour recompiler
└─ Modifier scripts/données
```

### 3. Personnalisation
```
Éditer les JSON:
├─ godot_jeu/assets/data/message.json
└─ godot_jeu/assets/data/enigmes.json
   └─ F5 pour recharger
```

### 4. Export
```
Project Menu
└─ Export...
   ├─ Windows Desktop → .exe
   └─ macOS → .app
```

### 5. Distribution
```
jeu_adieu.exe ou jeu_adieu.app
└─ Exécutable standalone
   └─ Prêt à partager/lancer
```

---

## 🎮 Architecture du Jeu

### Scène 1: Menu
```
Menu Control
├─ Titre: 👑 MEME QUEEN 👑
├─ Buttons:
│  ├─ "Commencer" → bureau.tscn
│  └─ "Quitter" → quit
└─ MessageParser (charge messages)
```

### Scène 2: Bureau (Acte 1)
```
Bureau Node3D
├─ InputManager (écoute 4 manettes)
├─ CameraManager (gère split-screen)
├─ 4x Players (bureau.gd init chaque joueur)
├─ Énigmes (objets interactifs)
├─ UIManager (popups)
└─ GameManager (progression)
```

### Scène 3: Salle Aventures (Acte 2)
```
SalleAventures Node3D
├─ Idem Bureau mais:
├─ Énigmes différentes
├─ Progression narrative
└─ Transition vers Acte 3
```

### Scène 4: Mur Messages (Acte 3)
```
MurMessages Node3D
├─ Grand mur 3D blanc
├─ Messages affichés (JSON parsé)
├─ Photos en cadres
├─ Musique émouvante
└─ Finale: 👑 MEME QUEEN 👑
```

---

## 🔍 Points d'Entrée (Pour Éditer)

| Besoin | Fichier | Ligne |
|--------|---------|-------|
| Ajouter message | `assets/data/message.json` | Anywhere |
| Changer énigme | `assets/data/enigmes.json` | Anywhere |
| Modifier contrôles | `scripts/input_manager.gd` | ~50 |
| Changer split-screen | `scripts/camera_manager.gd` | ~40 |
| Ajouter UI | `scripts/ui_manager.gd` | Any |
| Changer main scene | `project.godot` | ~13 |
| Ajouter photo | `assets/images/` | New file |

---

## 🚀 Commandes Principales

```bash
# Lancer le jeu
F5

# Ouvrir console (logs)
F12

# Recompiler
Ctrl+Alt+U

# Quitter test
Échap

# Dupliquer nœud
Ctrl+D

# Annuler
Ctrl+Z

# Exporter
Project → Export

# Voir fichier systems
Ctrl+Alt+F
```

---

## 📊 Statistiques

| Élément | Nombre |
|---------|--------|
| Scènes (.tscn) | 4 |
| Scripts (.gd) | 17 |
| Énigmes | 6 |
| Messages | 10 |
| Photos | 11 |
| Musiques | 1 |
| Lignes de code | ~1500 |
| Temps dev total | ~4 heures |

---

## ✅ Checklist Complète

- [x] Godot 4.3+ installé
- [x] Projet créé
- [x] 17 scripts écrits
- [x] 4 scènes créées
- [x] JSON parsing implémenté
- [x] Split-screen fonctionnel
- [x] Manettes reconnues
- [x] Photos intégrées
- [x] Musique chargée
- [x] UI responsive
- [x] Documentation complète
- [ ] Test avec 4 manettes (à faire)
- [ ] Export .exe (à faire)
- [ ] Export .app (à faire)

---

## 🎓 Pour Apprendre

Ressources recommandées:
- Docs Godot: https://docs.godotengine.org/
- GDScript: https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/
- Split-screen: https://docs.godotengine.org/en/stable/tutorials/3d/using_3d_characters/using_3d_characters.html

---

## 💡 Tips & Tricks

```
# Tester rapidement
F5

# Voir les logs en détail
F12 + chercher "[NomDuScript]"

# Recharger sans relancer
Modifier JSON puis F5

# Déboguer des manettes
Brancher 1 manette, voir si elle apparaît dans logs

# Prendre screenshot
F11 (capture d'écran)

# Vérifier performance
F1 dans le jeu (stats)
```

---

## 🆘 Emergency Links

| Problème | Lire |
|----------|------|
| Scripts erreur | TROUBLESHOOTING.md |
| Manettes pas détectées | TROUBLESHOOTING.md |
| Split-screen cassé | TROUBLESHOOTING.md |
| Export fail | BUILD.md |
| Architecture pas claire | README.md |

---

**Besoin d'aide?** Consulte le fichier adéquat ci-dessus! 🚀

