# 🎮 GUIDE: Activer les Easter Eggs & Images EN JEU

## 🎯 3 Objectifs Simples

1. **Activer les easter eggs** - Pouvoir les taper dans le jeu
2. **Afficher les images** - Voir les 11 photos dans les cadres
3. **Musique persistante** - Elle continue même quand on change de scène

**TOUT EST DÉJÀ CONFIGURÉ! Tu dois juste tester! ✨**

---

## 🎮 COMMENT JOUER AVEC LES EASTER EGGS

### Étape 1: Lance le jeu

```
Dans Godot:
1. Appuie sur F5 (ou Play button)
2. Attends le chargement
3. Tu vois l'écran titre: "👑 MEME QUEEN 👑"
```

### Étape 2: Commence le jeu

```
Écran du jeu:
┌─────────────────────────┐
│  👑 MEME QUEEN 👑       │
│                         │
│  [Commencer le Jeu]     │
│  [Quitter]              │
└─────────────────────────┘

Clique sur: "Commencer le Jeu"
```

### Étape 3: Une énigme s'affiche

```
Tu vois la première énigme:
┌──────────────────────────────────┐
│ Question: Quel pays manque à     │
│ sa famille?                      │
│                                  │
│ Réponse: [Tape ici]              │
│          ▼▼▼▼▼▼▼▼▼▼▼▼▼         │
│                                  │
│ [Indice] [Soumettre]             │
└──────────────────────────────────┘
```

### Étape 4: Tape un easter egg!

```
Au lieu de taper la bonne réponse, tape:
"meme"

Puis clique "Soumettre"
```

### Étape 5: Voir la Magie! ✨

```
Tu vois:
┌──────────────────────────────────┐
│ 👑 MEME QUEEN FOR LIFE! 👑       │
│ (Message vert, 2 secondes)       │
│                                  │
│ [Image aléatoire]                │
│ (Popup 3 secondes)               │
│                                  │
│ +1 Énigme Résolue!               │
└──────────────────────────────────┘
```

---

## 🎁 LES 6 EASTER EGGS DISPONIBLES

Tu peux taper N'IMPORTE LEQUEL à TOUTE ÉNIGME:

| Mot | Message |
|-----|---------|
| **meme** | 👑 MEME QUEEN FOR LIFE! 👑 |
| **apoorva** | 🌟 C'est elle! Apoorva est une REINE! 🌟 |
| **merci** | 💙 De rien! Merci à toi aussi Apoorva! 💙 |
| **team** | 👥 L'équipe c'est super avec toi! 👥 |
| **help** | 📖 L'indice est là! Regarde bien! 📖 |
| **godot** | 🎮 Ce jeu est créé en Godot 4.6! 🎮 |

**Important:** Tu peux les taper en majuscules, minuscules, avec espaces:
- "MEME" ✓
- "Meme" ✓
- "M E M E" ✓

---

## 📸 LES IMAGES

### Où sont les images?

Les 11 images s'affichent dans les **cadres photo** du jeu:

```
Bureau (Acte 1):
└─ Cadres photo dispersés
   ├─ Affichent une image aléatoire
   ├─ Changent quand on trouve un easter egg
   └─ 11 photos au total

Salle Aventures (Acte 2):
└─ Idem

Mur Messages (Acte 3):
└─ Photos autour du mur final
```

### Les 11 Images

```
1. 20250925_134343.jpg
2. 20250925_134412.jpg
3. IMG_0343.jpeg
4. IMG_0348.jpeg
5. IMG_0557.jpeg
6. IMG_6271.jpeg
7. IMG_7089.jpeg
8. IMG_7093.jpeg
9. IMG_7194.JPG
10. photoMariage.png
11. unnamed.jpg
```

### Comment Elles S'affichent?

```
Mode Normal:
- Cadres affichent des images aléatoires
- Chaque cadre = une image différente
- Aléatoire à chaque lancement

Quand tu trouves un Easter Egg:
- Une image aléatoire popup (3 sec)
- Les cadres peuvent se mettre à jour
- Feedback spécial + image!
```

---

## 🎵 MUSIQUE PERSISTANTE

### Le Problème (RÉSOLU!)

Avant:
```
Menu: La musique joue ✓
Bureau: La musique s'arrête ✗
Salle: La musique s'arrête ✗
Messages: La musique s'arrête ✗
```

Après (MAINTENANT):
```
Menu: La musique joue ✓
Bureau: La musique continue! ✓
Salle: La musique continue! ✓
Messages: La musique continue! ✓

Même quand on change de scène!
```

### Comment Ça Marche?

```
Avant (ANCIEN SYSTÈME):
Menu.tscn ← AudioManager chargé
  ↓ Change de scène
Bureau.tscn ← AudioManager supprimé! ✗
  ↓ Change de scène
SalleAventures.tscn ← Nouveau AudioManager!

Après (NOUVEAU SYSTÈME):
GlobalMusicManager (Autoload)
  ↓ Créé UNE FOIS au démarrage
  ↓ Persiste TOUJOURS
  ├─ Menu.tscn
  ├─ Bureau.tscn (musique continue!)
  ├─ SalleAventures.tscn (musique continue!)
  └─ MurMessages.tscn (musique continue!)
```

### Caractéristiques

```
✅ Musique: -15.0 dB (discret, ambiance)
✅ Persiste: Entre toutes les scènes
✅ Boucle: Continu (3:38 par lecture)
✅ Pas de: Silence entre les lectures
✅ Volumes: Peut être contrôlé globalement
```

---

## ✅ CHECKLIST POUR JOUER

### Avant de Jouer

- [ ] Godot ouvert
- [ ] Pas d'erreurs rouges en bas
- [ ] Console propre (F2 pour vérifier)

### Pendant le Test

- [ ] Lance le jeu (F5)
- [ ] Clique "Commencer le Jeu"
- [ ] À la 1ère énigme, tape "meme"
- [ ] Clique "Soumettre"
- [ ] Vois le message 👑 + image
- [ ] Entends la musique continue
- [ ] Passe à l'énigme suivante
- [ ] Tape un autre easter egg (ex: "apoorva")
- [ ] Vois un message différent + image différente
- [ ] Musique toujours là!
- [ ] Change de scène (résous énigmes)
- [ ] Musique NE S'ARRÊTE PAS ✓

---

## 🔧 SI QUELQUE CHOSE NE FONCTIONNE PAS

### ❌ "Je tape 'meme' mais rien ne se passe"

**Solution:**
1. Assure-toi d'être à une énigme (pas au menu)
2. Tape le mot en minuscules ou majuscules (ça marche pareil)
3. Clique bien sur "Soumettre"
4. Regarde la console: vois-tu le message "[GameManager] Easter egg 'meme' triggered!"?

### ❌ "Les images ne s'affichent pas"

**Solution:**
1. Vérifie que le dossier `assets/images/` existe
2. Ouvre la console (F2)
3. Cherche un message d'erreur "[ImageManager]"
4. Lis le message d'erreur

### ❌ "La musique s'arrête encore quand je change de scène"

**Solution:**
1. Redémarre Godot complètement (ferme/ouvre)
2. Godot va charger le GlobalMusicManager automatiquement
3. Teste à nouveau

### ❌ "Erreurs de compilation rouge"

**Solution:**
1. Ouvre la console (F2)
2. Lis le message d'erreur
3. Va au fichier indiqué
4. Regarde la ligne indiquée
5. Corrige (généralement indentation)

---

## 🎮 CHEMIN COMPLET DU JEU

```
1. Menu: 👑 MEME QUEEN 👑
   └─ Tape "Commencer"

2. Bureau (Acte 1):
   ├─ Énigme 1: Quel pays?
   │  └─ Réponse correcte: netherlands
   │     OU Easter egg: meme, apoorva, merci, team, help, godot
   ├─ Énigme 2: Projet 1?
   ├─ Énigme 3: Projet 2?
   ├─ Énigme 4: Passion?
   ├─ Énigme 5: Phrase?
   └─ Énigme 6: Mot interdit?

3. Salle Aventures (Acte 2):
   └─ Mêmes énigmes que Bureau
   └─ Pareil: réponses correctes OU easter eggs

4. Mur Messages (Acte 3):
   ├─ Affiche les 10 messages
   ├─ Photos autour
   └─ 👑 MEME QUEEN 👑 (final)
   └─ Musique continue tout du long!
```

---

## 🎯 RÉSUMÉ RAPIDE

### Pour Jouer:
```
1. F5 (lance le jeu)
2. "Commencer le Jeu"
3. À une énigme, tape "meme" (ou autre easter egg)
4. Clique "Soumettre"
5. Voir la magie ✨
```

### Pour Ajouter des Easter Eggs:
```
1. Ouvre: scripts/game_manager.gd
2. Va ligne: 146
3. Ajoute: un bloc d'easter egg
4. Sauvegarde: Ctrl+S
5. Teste: F5
```

### Pour Vérifier la Musique:
```
1. Clique "Commencer"
2. Prête l'oreille à la musique
3. Change de scène (résous les 6 énigmes)
4. La musique doit TOUJOURS jouer!
```

---

## 💡 TIPS

### Normalisation des Entrées
```
Tu tapes:        Godot comprend:
"MEME"      →    "meme"
"meme"      →    "meme"
"mEme"      →    "meme"
"M E M E"   →    "meme" (espaces supprimés)
```

### Indenter le Code (Important!)
```
✅ CORRECT:
	# Easter egg
	if condition:
		faire_quelquechose()

❌ INCORRECT:
# Easter egg     ← Pas d'indentation!
if condition:
faire_quelquechose()     ← Erreur!
```

### Volume de la Musique
```
Très discret:  -15.0 dB (actuellement)
Discret:       -10.0 dB
Normal:         -5.0 dB
Loud:           0.0 dB

Pour changer:
Ouvre: scripts/audio_manager.gd
Cherche: volume_db = -15.0
Change en: volume_db = -10.0
Sauvegarde et teste!
```

---

## 🚀 PROCHAINES ÉTAPES

### Aujourd'hui:
```
□ Teste "meme" dans le jeu
□ Teste un autre easter egg
□ Écoute la musique (elle doit persister!)
□ Observe les images
```

### Demain:
```
□ Ajoute ton propre easter egg
□ Personnalise les feedbacks
□ Ajoute plus d'images
```

### Plus tard:
```
□ Easter eggs avec conditions
□ Son spécial pour easter eggs
□ Bonus si tous les easter eggs trouvés
```

---

## 📞 SUPPORT RAPIDE

| Besoin | Solution |
|--------|----------|
| Jouer avec easter eggs | Tape le mot + Soumet |
| Voir les images | Elles s'affichent automatiquement |
| Musique qui persiste | Elle fonctionne maintenant! Godot la charge automatiquement |
| Ajouter easter egg | game_manager.gd ligne 146 + copie/colle |
| Vérifier que ça marche | F2 (console) + cherche "[GameManager]" |

---

## ✨ C'EST PRÊT!

**Tu as maintenant:**
- ✅ 6 easter eggs activés
- ✅ 11 images intégrées
- ✅ Musique persistante entre scènes
- ✅ Tout configuré automatiquement

**Tu peux:**
- 🎮 Jouer et tester
- 🎁 Trouver les easter eggs
- 📸 Voir les images
- 🎵 Profiter de la musique continue

**Prêt? F5 pour lancer! 🚀**
