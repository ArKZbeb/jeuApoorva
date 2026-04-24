# 🚀 Quick Start - Godot Jeu d'Adieu

## 1️⃣ Ouvrir le Projet

```bash
# Depuis Godot Project Manager
# Sélectionner: godot_jeu/
# Cliquer: Edit
```

## 2️⃣ Vérifier la Confiture

Une fois dans Godot, vérifier que:
- ✅ Les scripts compilent (pas d'erreurs en bas)
- ✅ Les fichiers JSON sont présents: `res://assets/data/`
- ✅ Les images sont présentes: `res://assets/images/`
- ✅ La musique est présente: `res://assets/audio/`

## 3️⃣ Lancer le Jeu

```
Appuyer F5 (ou Play en haut à droite)
```

### Mode Single Player (1 joueur):
- Clavier ZQSD pour se déplacer
- Souris ou stick droit pour regarder autour
- Clique droit pour activer le mode look-around
- Appuyer E ou X pour interagir

## 4️⃣ Les 3 Actes

### Acte 1: Bureau (exploration)
- Exploration libre
- Appuyer sur le bouton rouge "Quitter Bureau" pour progresser

### Acte 2: Salle Aventures (énigmes)
- 6 buzzers colorés à interagir
- Résoudre les 6 énigmes pour pouvoir progresser
- Chaque énigme pose une question personnelle sur Apoorva
- Easter egg: Taper "meme" pour une réponse surprise! 👑

### Acte 3: Mur des Messages (finale)
- Affichage des messages d'adieu
- Voir tous les messages des collègues
- Photo galerie (si disponible)
- 👑 MEME QUEEN 👑

## 5️⃣ Contrôles (Clavier)

```
Mouvement:
├─ Z ou Haut      → Avancer
├─ S ou Bas       → Reculer
├─ Q ou Gauche    → Tourner à gauche
└─ D ou Droite    → Tourner à droite

Caméra:
├─ Souris         → Regarder autour
└─ Clic droit     → Mode look-around

Interaction:
├─ E              → Interagir avec objets
├─ Espace         → Sauter
└─ Entrer         → Valider réponse d'énigme

Manette (optionnel):
├─ Stick gauche   → Mouvement
├─ Stick droit    → Regard
└─ Bouton X/Carré → Interagir
```

## 🐛 Si ça ne marche pas

### Erreur "scripts not compiling"
→ Vérifier la console (F12) pour les erreurs exactes

### Pas de musique au démarrage
→ Vérifier que `res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3` existe
→ Vérifier que MusicManager est attaché à la scène Menu

### Les énigmes ne marchent pas
→ Vérifier que GameManager est dans la scène
→ Vérifier que UIManager existe avec les bons éléments (QuestionLabel, AnswerInput, SubmitButton)
→ Regarder la console pour les messages de debug [GameManager] et [UIManager]

### Le bouton "Quitter Bureau" ne marche pas
→ Vérifier que NextSceneButton existe dans la scène Bureau
→ Vérifier que require_all_enigmas est bien configuré

## 📦 Export Vers Exécutable

### Créer un .exe Windows:

1. Depuis Godot:
   ```
   Project → Export... (ou Ctrl+Alt+E)
   ```

2. Si "Windows Desktop" n'existe pas:
   - Cliquer "Add Preset"
   - Sélectionner "Windows Desktop"
   - Cliquer "Create & Edit"

3. Configurer l'export:
   - Name: "Jeu Adieu Apoorva"
   - Path: `../Jeu_Apoorva.exe`
   - Vérifier les ressources:
     * Cliquer "Export PCK/Zip" pour inclure tous les assets
     * S'assurer que les fichiers JSON et MP3 sont inclus

4. Exporter:
   - Cliquer "Export Project"
   - Choisir le dossier de destination
   - L'exécutable sera créé!

5. Tester l'exécutable:
   - Double-cliquer sur `Jeu_Apoorva.exe`
   - Vérifier que le jeu se lance correctement

### Export macOS (optionnel):

```
Project → Export... → macOS → Export
```

### Problèmes d'export courants:

- **"Missing PCK"**: Vérifier que tous les assets sont visibles dans Project
- **"DLL not found"**: Tous les fichiers .dll requis sont inclus avec Godot
- **"Ressources manquantes"**: Vérifier que les fichiers JSON et MP3 sont dans res://

## 📝 Personnaliser

### Ajouter des messages:
Éditer `assets/data/message.json`

### Modifier les énigmes:
Éditer `assets/data/enigmes.json`

### Ajouter des photos:
Copier dans `assets/images/`
Créer des nodes PhotoFrame

---

**C'est prêt! Bon jeu! 🎮**
