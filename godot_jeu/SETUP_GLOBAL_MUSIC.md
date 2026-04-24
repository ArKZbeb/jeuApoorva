# ⚙️ CONFIGURATION GODOT: Activer la Musique Persistante

## 🎯 Objectif

Faire en sorte que la musique **NE S'ARRÊTE JAMAIS** même quand on change de scène.

**Status:** ✅ PRESQUE DÉJÀ CONFIGURÉ!

---

## 📋 Qu'est-ce qu'un Autoload?

Un **Autoload** (ou Singleton) est un nœud qui:
- Se charge UNE FOIS au démarrage du jeu
- Persiste TOUJOURS (même en changeant de scène)
- Est accessible de partout dans le jeu
- S'appelle GlobalMusicManager pour nous

**Exemple:**
```
Menu.tscn ← GlobalMusicManager joue (✓)
  ↓ Change de scène
Bureau.tscn ← GlobalMusicManager continue (✓)
  ↓ Change de scène
Salle.tscn ← GlobalMusicManager continue (✓)
```

---

## ✅ CONFIGURATION (Déjà faite!)

### Étape 1: Le script existe

```
✅ Fichier: scripts/global_music_manager.gd
   Status: CRÉÉ et PRÊT
   Contenu: Classe GlobalMusicManager
```

### Étape 2: Configuration Godot

```
✅ Fichier: project.godot
   Modification: AJOUTÉE
   Contenu: [autoload] section avec GlobalMusicManager
```

---

## 🎮 COMMENT ACTIVER DANS GODOT

### Méthode 1: Automatique (RECOMMANDÉE) ✨

Godot chargera automatiquement grâce à la modification du `project.godot`:

```
1. Ferme Godot complètement
2. Réouvre Godot
3. Le projet charge
4. GlobalMusicManager est automatiquement créé! ✅
```

**C'est tout! La modification est déjà faite! 🎵**

### Méthode 2: Manuelle (Si tu veux vérifier)

Si tu veux vérifier dans l'interface Godot:

```
1. Ouvre Godot
2. Menu: Project → Project Settings
3. Onglet: Autoload
4. Tu devrais voir: GlobalMusicManager
   └─ Path: res://scripts/global_music_manager.gd
5. Si tu ne le vois pas, ajoute-le manuellement:
   ├─ Node Path: res://scripts/global_music_manager.gd
   ├─ Nom: GlobalMusicManager
   └─ Clique: "Ajouter"
```

---

## 🔍 VÉRIFIER QUE C'EST ACTIVÉ

### Dans la Console Godot

```
1. Lance le jeu (F5)
2. Ouvre la console (F2)
3. Tu devrais voir:
   "[GlobalMusicManager] Music loaded and playing globally"
   ✅ La musique est prête!
```

### En Jeu

```
1. Lance (F5)
2. Écoute: Tu entends la musique de menu ✓
3. Clique: "Commencer le Jeu"
4. Change de scène vers le Bureau
5. Écoute: La musique CONTINUE! ✓✓✓
6. Va à une autre scène
7. Écoute: La musique est TOUJOURS là! ✓✓✓
```

---

## 📝 CE QUI S'EST PASSÉ TECHNIQUEMENT

### Avant (Ancien Système)

```
Menu.tscn
├─ AudioManager attaché à Menu
└─ Charge la musique

Bureau.tscn
├─ AudioManager attaché à Bureau
└─ Change de scène
   ↓
   L'AudioManager de Menu est SUPPRIMÉ! ✗
   Un nouveau AudioManager charge... mais avant il n'avait rien ✗
```

### Après (Nouveau Système)

```
Démarrage du Jeu
├─ GlobalMusicManager créé (Autoload)
├─ Musique chargée UNE FOIS
└─ Marque: is_playing = true

Menu.tscn
├─ GlobalMusicManager joue 🎵
└─ Visible pour tous

Bureau.tscn
├─ GlobalMusicManager continue! 🎵
├─ Pas de suppression!
└─ Pas de rechargement!

SalleAventures.tscn
├─ GlobalMusicManager toujours là! 🎵
└─ Musique ininterrompue!
```

---

## 🎵 FONCTIONNALITÉS DISPONIBLES

Maintenant tu peux utiliser GlobalMusicManager de PARTOUT:

### Jouer la Musique
```gdscript
GlobalMusicManager.play_music()
print("Musique lancée!")
```

### Arrêter la Musique
```gdscript
GlobalMusicManager.stop_music()
print("Musique arrêtée")
```

### Changer le Volume
```gdscript
GlobalMusicManager.set_volume(-10.0)  # Plus fort
GlobalMusicManager.set_volume(-20.0)  # Plus discret
GlobalMusicManager.set_volume(-5.0)   # Normal
```

### Pause/Reprise
```gdscript
GlobalMusicManager.pause_music()   # Pause
GlobalMusicManager.resume_music()  # Reprendre
```

---

## ⚙️ CODE DU GLOBAL MUSIC MANAGER

```gdscript
extends Node

class_name GlobalMusicManager

var audio_player: AudioStreamPlayer
var music_path: String = "res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3"
var is_playing: bool = false

func _ready():
	# S'assurer que ce nœud persiste entre les scènes
	set_process_mode(Node.PROCESS_MODE_ALWAYS)
	
	# Créer le lecteur audio
	audio_player = AudioStreamPlayer.new()
	audio_player.bus = "Master"
	add_child(audio_player)
	
	# Charger et jouer la musique
	var music = load(music_path)
	if music:
		audio_player.stream = music
		audio_player.volume_db = -15.0  # Volume discret
		audio_player.bus = "Master"
		play_music()
		is_playing = true
		print("[GlobalMusicManager] Music loaded and playing globally")
	else:
		push_error("[GlobalMusicManager] Could not load music: %s" % music_path)

func _process(_delta):
	# Assurer que la musique boucle en continu
	if audio_player and not audio_player.playing and is_playing:
		audio_player.play()

# ... autres fonctions ...
```

---

## ✅ CHECKLIST D'ACTIVATION

- [ ] Le fichier `global_music_manager.gd` existe
- [ ] Le fichier `project.godot` a la section `[autoload]`
- [ ] Tu as fermé et réouvert Godot
- [ ] La console montre "[GlobalMusicManager] Music loaded"
- [ ] Tu entends la musique au démarrage
- [ ] Tu entends la musique même après changement de scène
- [ ] Pas d'erreurs rouges dans la console

---

## 🐛 TROUBLESHOOTING

### ❌ "Je ne vois pas GlobalMusicManager dans l'Autoload"

**Solution:**
1. Godot n'a pas rechargé la config
2. Ferme Godot complètement
3. Réouvre Godot
4. Va à Project → Project Settings → Autoload
5. Tu devrais le voir maintenant

### ❌ "La musique s'arrête toujours"

**Causes possibles:**
1. L'Autoload n'est pas activé
   → Ferme/Réouvre Godot

2. Le process mode est mauvais
   → Vérifie: `set_process_mode(Node.PROCESS_MODE_ALWAYS)`

3. Il y a une erreur dans le script
   → Regarde la console (F2)

### ❌ "Erreur: Cannot find GlobalMusicManager"

**Solution:**
1. Godot ne charge pas l'Autoload
2. Va à Project → Project Settings
3. Onglet: Autoload
4. Ajoute manuellement:
   - Script: res://scripts/global_music_manager.gd
   - Nom: GlobalMusicManager

### ❌ "La musique est trop basse/trop haute"

**Solution:**
```
1. Ouvre: scripts/global_music_manager.gd
2. Cherche: audio_player.volume_db = -15.0
3. Change le nombre:
   - Plus discret: -20.0
   - Discret: -15.0 (actuellement)
   - Normal: -10.0
   - Loud: -5.0
4. Sauvegarde et teste
```

---

## 🎯 RÉSULTAT FINAL

Quand tout est configuré:

```
🎮 MENU
   🔊 Musique joue: Espresso (3:38)

👉 CLIQUE "COMMENCER"

📍 BUREAU (Acte 1)
   🔊 Musique CONTINUE!
   ✨ Easter eggs testables
   📸 Images affichées

👉 RÉSOUS LES 6 ÉNIGMES

📍 SALLE AVENTURES (Acte 2)
   🔊 Musique CONTINUE!
   ✨ Easter eggs testables
   📸 Images affichées

👉 RÉSOUS LES 6 ÉNIGMES

📍 MUR MESSAGES (Acte 3)
   🔊 Musique CONTINUE!
   💬 Messages affichés
   📸 Photos autour
   👑 MEME QUEEN 👑

TOTAL: Musique ne s'arrête JAMAIS! ✅
```

---

## 🚀 PROCHAINES ÉTAPES

### Maintenant:
```
1. Ferme/Réouvre Godot
2. Lance (F5)
3. Écoute la musique
4. Change de scène
5. Vérifie que la musique continue
```

### Si ça marche:
```
✅ Bravo! La musique persiste maintenant!
✅ Tu peux jouer avec les easter eggs
✅ Les images s'affichent
✅ Tout fonctionne!
```

### Si ça ne marche pas:
```
Lis la section "TROUBLESHOOTING" ci-dessus
Ou: Regarde la console (F2) pour les erreurs
```

---

**La musique persistante est prête! 🎵🚀**
