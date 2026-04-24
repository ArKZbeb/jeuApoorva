# 🔧 Guide de Dépannage - Jeu Godot

## ❌ Les Scripts ne Compilent Pas

### Erreur: "Script not found"
**Solution:**
1. Vérifier le chemin dans le fichier `.tscn`
2. S'assurer que le script existe dans `scripts/`
3. Recharger Godot (F5)

### Erreur: "Variable not found"
**Solution:**
- Vérifier l'orthographe des noms de variables
- Vérifier les majuscules/minuscules
- Consulter la console (F12) pour plus de détails

---

## 🎮 Les Manettes ne Marchent Pas

### Les manettes ne sont pas détectées
**Causes possibles:**
1. Les manettes ne sont pas branchées
2. Godot n'a pas accès aux périphériques

**Solutions:**
```
1. Brancher les 4 manettes
2. Redémarrer Godot
3. Vérifier Project → Project Settings → Input Devices → Gamepad
4. Mettre axis_deadzone à 0.15
```

### Le joueur ne bouge pas
**Solutions:**
1. Vérifier que la manette est détectée (voir ci-dessus)
2. Vérifier dans le script `input_manager.gd` les axes joystick
3. Tester avec une manette seule d'abord

---

## 📺 Split-Screen ne fonctionne pas

### Je vois qu'un écran au lieu de 4
**Solutions:**
1. Vérifier que 4 joueurs sont créés
2. Vérifier les caméras (chaque joueur doit avoir une Camera3D enfant)
3. Vérifier le script `camera_manager.gd` → `get_viewport_for_player()`

### L'écran est décalé
**Solution:**
- Ajuster les coordonnées dans `get_viewport_for_player()`

---

## 📁 Les Fichiers JSON ne se Chargent Pas

### Erreur "JSON not found"
**Solutions:**
1. Vérifier le chemin: `res://assets/data/enigmes.json`
2. Vérifier que les fichiers existent dans Godot (File System panel)
3. Relancer Godot après copie de fichiers

### Erreur "JSON parse error"
**Solutions:**
1. Valider le JSON sur [jsonlint.com](https://jsonlint.com)
2. Vérifier les guillemets (doubles: `"`, pas simples)
3. Vérifier les virgules entre les éléments

---

## 🎨 Les Images/Photos ne s'affichent Pas

### Les textures sont invisibles
**Solutions:**
1. Vérifier le chemin: `res://assets/images/`
2. Vérifier que les fichiers sont des formats supportés (PNG, JPG)
3. Dans le script `photo_frame.gd`, vérifier le material

### Les photos sont floues
**Solution:**
- Augmenter la résolution dans `photo_frame.gd`:
```gdscript
material.use_nearest_mip_filter = false
```

---

## 🔊 La Musique ne Joue Pas

### Pas de son
**Solutions:**
1. Vérifier que `Sabrina Carpenter - Espresso (Official Video).mp3` existe
2. Vérifier le chemin dans `audio_manager.gd`
3. Vérifier les paramètres Master bus

### Le son est trop fort/faible
**Solution:**
Ajuster `volume_db` dans `audio_manager.gd`:
```gdscript
volume_db = -10  # Augmenter/diminuer la valeur
```

---

## 🎯 Les Énigmes ne s'Affichent Pas

### Le panel d'énigme n'apparaît pas
**Solutions:**
1. Vérifier que le bouton d'interaction a été cliqué (X/Carré)
2. Vérifier que l'objet est marqué `is_enigma_object = true`
3. Consulter la console (F12) pour les logs

### Les réponses ne sont pas acceptées
**Solution:**
- Les réponses doivent correspondre exactement à `enigmes.json`
- Les espaces et majuscules sont ignorés (normalisés dans le code)

---

## 🔄 Transition entre Scènes

### Le jeu ne change pas de scène
**Solutions:**
1. Vérifier que la scène existe: `res://scenes/bureau.tscn`
2. Vérifier le script de transition
3. Consulter la console pour les erreurs

### La scène change mais c'est noir
**Solution:**
- La transition au noir prend du temps, c'est normal
- Attendre ~2 secondes

---

## 💾 Après Modifications

### Les changements n'apparaissent pas
**Solutions:**
1. **Recharger le projet**: F5 (Play)
2. **Recompiler les scripts**: Ctrl+Alt+U (ou attendre)
3. **Redémarrer Godot** si rien ne marche

### Le .exe ne marche pas sur un autre PC
**Solutions:**
1. Exporter en mode "Release" (plus petit, plus rapide)
2. Vérifier que toutes les dépendances sont incluses
3. Tester sur le même PC avant de distribuer

---

## 🆘 Rien ne Marche!

### Dernier recours:
1. Consulter la **Console Godot** (F12) - c'est là qu'il y a les infos!
2. Regarder les **logs detaillés** avec les préfixes `[NomDuScript]`
3. Redémarrer Godot complètement
4. Supprimer le dossier `.godot/` et recharger
5. Consulter la documentation Godot: https://docs.godotengine.org/

---

**Besoin d'aide supplémentaire?**
Consulte les logs Godot (F12) - ils disent TOUJOURS d'où vient le problème! 🔍
