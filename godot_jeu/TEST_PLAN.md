# 🧪 Plan de Test - Jeu d'Adieu Apoorva

## 📋 Vue d'ensemble

Ce document décrit le processus complet de test du jeu. Le jeu a été modifié pour supporter:
- ✅ Mode single-player (1 joueur au clavier)
- ✅ Musique Espresso qui joue du menu jusqu'à la fin
- ✅ Easter egg "meme" qui déverrouille une réponse spéciale
- ✅ Système d'énigmes avec réponses personnalisées pour Apoorva
- ✅ 3 actes progressifs avec conditions d'avancement

## 🎮 Test 1: Lancer le Jeu

### Étapes:
1. Ouvrir le dossier `godot_jeu/`
2. Double-cliquer sur `project.godot` PUIS sélectionner "Edit with Godot Editor"
3. Attendre que Godot se charge
4. Vérifier qu'il n'y a pas d'erreurs en bas (Console rouge = erreur)

### Résultats attendus:
- [ ] Godot se lance sans crash
- [ ] Console n'affiche pas d'erreurs critiques
- [ ] Tous les fichiers sont détectés:
  - res://assets/data/enigmes.json
  - res://assets/data/message.json
  - res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3
  - res://assets/images/ (photos optionnelles)

---

## 🎵 Test 2: Musique et Menu

### Étapes:
1. Appuyer sur **F5** (ou cliquer Play)
2. Attendre le démarrage de la scène Menu
3. Écouter si la musique Espresso se lance

### Résultats attendus:
- [ ] Menu apparaît avec titre "👑 MEME QUEEN 👑"
- [ ] La musique Espresso commence à jouer
- [ ] Deux boutons visibles: "Commencer le Jeu" et "Quitter"
- [ ] Le volume est audible et non mute

### Si la musique ne joue pas:
1. Vérifier console pour `[MusicManager] Music loaded and playing`
2. Vérifier que le fichier MP3 existe: `C:\Users\turgy\Documents\jeuApoorva\godot_jeu\assets\audio\`
3. Vérifier le volume système Windows (coin bas-droit)
4. Relancer Godot

---

## 🏢 Test 3: Acte 1 - Bureau (Exploration)

### Étapes:
1. Cliquer "Commencer le Jeu"
2. Vous devriez être dans une salle (Bureau)
3. Tester les contrôles:

| Clé | Action |
|-----|--------|
| Z | Avancer |
| S | Reculer |
| Q | Tourner gauche |
| D | Tourner droite |
| Clic droit + Souris | Regarder autour |
| E | Interagir |

4. Chercher le bouton rouge "Quitter Bureau"
5. Cliquer/appuyer E pour interagir avec le bouton
6. Vérifier le message de progression

### Résultats attendus:
- [ ] Les contrôles répondent correctement
- [ ] Le joueur peut se déplacer librement
- [ ] Le bouton rouge est visible et cliquable
- [ ] La musique continue en arrière-plan
- [ ] Transition vers "Salle Aventures" réussie

---

## 🎯 Test 4: Acte 2 - Salle Aventures (6 Énigmes)

### Étapes:

#### 4.1 Vérifier la scène:
1. Vous devriez voir 6 buzzers (cylindres colorés)
2. Chaque buzzer doit avoir une lumière d'ambiance colorée
3. Il doit y avoir un bouton "Accès Mur des Messages" (à droite)
4. Ce bouton doit être **DÉSACTIVÉ** (gris) au départ

#### 4.2 Tester la première énigme:
1. Appuyer sur **E** sur le premier buzzer (bleu)
2. Un panneau de dialogue doit apparaître avec:
   - La question: "Quel pays manque à sa famille?"
   - Un champ de texte pour la réponse
   - Un bouton "Soumettre"
3. Répondre: **netherlands**
4. Appuyer Entrée ou cliquer "Soumettre"

### Énigmes complètes à tester:

| # | Buzzeur | Question | Réponse Officielle | Easter Egg |
|---|---------|----------|------------------|-----------|
| 1 | Bleu | Quel pays manque à sa famille? | netherlands | meme |
| 2 | Vert | Premier grand projet qu'elle a mené? | one ad conducteur | meme |
| 3 | Violet | Quel autre projet majeur? | le décrochage | meme |
| 4 | ? | Sa passion secrète? | karaoke | meme |
| 5 | ? | Phrase culte pour briser les... ? | briser les glaçons | meme |
| 6 | ? | Mot 'interdit' qu'on adorait dire? | bordel | meme |

### Résultats attendus pour chaque énigme:
- [ ] Le dialogue apparaît
- [ ] La question affichée correspond
- [ ] La réponse correcte affiche ✅ en vert + feedback
- [ ] Une réponse incorrecte affiche ❌ en rouge + indice
- [ ] Après résolution: compteur X/6 augmente en bas de l'écran

### Test 4.3: Easter Egg "meme"
1. Résoudre une énigme incorrectement (ex: répondre "blabla")
2. Essayer de répondre **"meme"** (cas-insensible: MEME, Meme, etc.)
3. Vérifier que vous recevez le message spécial "👑 MEME QUEEN FOR LIFE!"

### Résultats attendus:
- [ ] "meme" est accepté comme réponse spéciale et compte comme résolution
- [ ] Message affiche: "👑 MEME QUEEN FOR LIFE!"
- [ ] L'énigme est marquée comme résolue

### Test 4.4: Vérifier la condition d'accès
1. Résoudre toutes les 6 énigmes
2. Vérifier que le compteur affiche "6/6"
3. Le bouton "Accès Mur des Messages" doit devenir:
   - [ ] Vert/Actif (couleur vive)
   - [ ] Cliquable (E ne fait plus rien avant)
4. Appuyer E pour progresser vers l'Acte 3

---

## 📜 Test 5: Acte 3 - Mur des Messages (Finale)

### Étapes:
1. Vous devriez être dans une nouvelle scène (Mur des Messages)
2. Un grand texte doit afficher tous les messages d'adieu
3. Vérifier que les messages du fichier `message.json` s'affichent

### Résultats attendus:
- [ ] Scène se charge correctement
- [ ] Les 10 messages d'adieu s'affichent sur l'écran
- [ ] La musique continue en arrière-plan
- [ ] Affichage lisible (pas de texte qui se chevauche)

---

## 🔄 Test 6: Flux Complet

### Étapes:
1. Redémarrer le jeu: **F5**
2. Compléter entièrement:
   - Menu → Buton "Commencer" ✅
   - Bureau → Bouton "Quitter Bureau" ✅
   - Salle Aventures → Résoudre 6/6 énigmes ✅
   - Mur des Messages → Voir les messages ✅

### Résultats attendus:
- [ ] Aucun crash entre les scènes
- [ ] Musique joue en continu du menu à la fin
- [ ] Tous les contrôles restent réactifs
- [ ] Pas d'erreurs en console

---

## 💾 Test 7: Préparation à l'Export

### Vérifications:
1. Tous les fichiers requis existent:
   ```
   ✅ godot_jeu/assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3
   ✅ godot_jeu/assets/data/enigmes.json
   ✅ godot_jeu/assets/data/message.json
   ✅ godot_jeu/scenes/*.tscn
   ✅ godot_jeu/scripts/*.gd
   ```

2. Vérifier les fichiers JSON sont valides:
   ```bash
   # Dans le dossier godot_jeu/
   cat assets/data/enigmes.json  # Doit être du JSON valide
   cat assets/data/message.json   # Doit être du JSON valide
   ```

3. Tous les scripts compilent sans erreur (vérifier en haut dans Godot)

### Résultats attendus:
- [ ] Aucun fichier manquant
- [ ] JSON valides (pas d'erreur de parsing)
- [ ] Scripts compilent OK

---

## 🚀 Test 8: Export Windows (.exe)

### Étapes:
1. Dans Godot: **Project → Export... (Ctrl+Alt+E)**
2. Si "Windows Desktop" n'existe pas:
   - Cliquer "Add Preset"
   - Sélectionner "Windows Desktop"
   - Cliquer "Create & Edit"
3. Vérifier les paramètres:
   - Export Path: `../Jeu_Adieu_Apoorva.exe`
   - Application: Console non cochée
   - Checksum optionnel
4. Cliquer **"Export Project"**
5. Choisir un dossier (ex: Desktop)
6. Attendre la compilation (~30 sec)

### Résultats attendus:
- [ ] Export se termine sans erreur
- [ ] Un fichier `Jeu_Adieu_Apoorva.exe` est créé
- [ ] Un dossier `Jeu_Adieu_Apoorva.exe.folder` avec les assets (ou .pck)

### Post-Export - Test l'exécutable:
1. **Fermer Godot** d'abord
2. Double-cliquer sur `Jeu_Adieu_Apoorva.exe`
3. Vérifier que le jeu se lance
4. Tester rapidement:
   - [ ] Menu apparaît
   - [ ] Musique joue
   - [ ] Bouton "Commencer" fonctionne
   - [ ] Scène Bureau se charge

---

## 📊 Résumé du Test

| Composant | Status | Notes |
|-----------|--------|-------|
| Lancement du Jeu | ⏳ À tester | |
| Menu + Musique | ⏳ À tester | |
| Contrôles Clavier | ⏳ À tester | |
| Bureau (Acte 1) | ⏳ À tester | |
| Salle Aventures (Acte 2) | ⏳ À tester | |
| 6 Énigmes | ⏳ À tester | |
| Easter Egg "meme" | ⏳ À tester | |
| Condition 6/6 | ⏳ À tester | |
| Mur des Messages (Acte 3) | ⏳ À tester | |
| Musique Continue | ⏳ À tester | |
| Export .exe | ⏳ À tester | |

---

## 🐛 Dépannage Rapide

### "Erreur: Scripts not compiling"
```
→ F12 pour ouvrir la console
→ Chercher l'erreur rouge
→ Corriger le fichier indiqué
→ Godot recompilera automatiquement
```

### "Pas de musique"
```
→ Vérifier: assets/audio/ le fichier existe
→ Vérifier: Menu contient MusicManager
→ Vérifier: Console pour [MusicManager] messages
→ Relancer Godot
```

### "Énigmes ne marchent pas"
```
→ Vérifier: Salle Aventures a GameManager
→ Vérifier: UIManager est dans la scène
→ Vérifier: enigmes.json existe et est valide
→ Console chercher: [GameManager] ou [UIManager] messages
```

### "Bouton transition grayed out"
```
→ Normal! Résoudre d'abord 6/6 énigmes
→ Vérifier le compteur en haut (X/6)
→ Tous les buzzers doivent être résolus
```

---

**Bon Test! Amusez-vous bien avec le jeu d'adieu! 👑**
