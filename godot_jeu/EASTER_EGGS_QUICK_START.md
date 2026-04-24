# 🎁 Guide Complet: Utiliser et Créer des Easter Eggs

## 📌 Résumé Rapide

**Les easter eggs sont des réponses secrètes/bonus** qu'on peut taper dans n'importe quelle énigme.

| Mot-clé | Feedback | Effet |
|---------|----------|-------|
| **meme** | 👑 MEME QUEEN FOR LIFE! 👑 | +1 énigme résolue + image aléatoire |
| **apoorva** | 🌟 C'est elle! Apoorva est une REINE! 🌟 | +1 énigme résolue + image |
| **merci** | 💙 De rien! Merci à toi aussi Apoorva! 💙 | +1 énigme résolue + image |
| **team** | 👥 C'est ça! L'équipe c'est super avec toi! 👥 | +1 énigme résolue + image |
| **help** | 📖 L'indice est là! Regarde bien! 📖 | +1 énigme résolue + image |
| **godot** | 🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮 | +1 énigme résolue + image |

---

## 🎮 Comment Jouer avec les Easter Eggs

### En Jeu

```
1. Lance le jeu (F5 dans Godot)
2. Clique sur "Commencer le Jeu"
3. Une énigme s'affiche
4. Au lieu de répondre correctement:
   - Tape "meme" (ou un autre easter egg)
   - Clique "Soumettre"
5. 🎉 Le message spécial s'affiche + une image aléatoire!
6. L'énigme compte comme résolue
```

### Exemple Visuel

```
Écran du jeu:
┌─────────────────────────────────┐
│  Question: Quel pays manque ... │
│                                 │
│  [Réponse: ________]            │
│           [meme]  ← Tu tapes ça │
│                                 │
│  [Indice]  [Soumettre] ← Clique │
└─────────────────────────────────┘
        ↓
┌─────────────────────────────────┐
│  👑 MEME QUEEN FOR LIFE! 👑    │ ← Feedback vert
│                                 │
│  [Image aléatoire]              │ ← Apparaît 3 sec
│  (photoMariage.png ou autre)    │
└─────────────────────────────────┘
```

---

## 🔧 Comment Ajouter des Easter Eggs

### 📂 Fichier à Modifier

```
godot_jeu/scripts/game_manager.gd
Lignes 137-147 (section des easter eggs)
```

### 📝 Template

Copie/colle ce bloc et adapte-le:

```gdscript
	# Easter egg N: "MON_MOT_CLE"
	if normalized_answer == "mon_mot_cle":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎉 TON MESSAGE AVEC EMOJI! 🎉", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'mon_mot_cle' triggered!")
		return
```

### 🎯 Exemple: Ajouter "SURPRISE"

```gdscript
	# Easter egg 7: "surprise"
	if normalized_answer == "surprise":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎉 Surprise! C'était un easter egg! 🎉", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'surprise' triggered!")
		return
```

### ✅ Checklist

1. [ ] Ouvre `godot_jeu/scripts/game_manager.gd`
2. [ ] Localise ligne 137-147 (easter eggs existants)
3. [ ] Copie le template ci-dessus
4. [ ] Remplace `MON_MOT_CLE` par ton mot
5. [ ] Remplace `TON MESSAGE` par ton feedback
6. [ ] Colle le code après le dernier `return` (ligne ~146)
7. [ ] Sauvegarde (Ctrl+S)
8. [ ] Recharge Godot (pas d'erreurs rouges?)
9. [ ] Lance le jeu et teste!

---

## 🎨 Emojis Populaires

```
👑 Couronne        🎉 Fête           🌟 Étoile
💙 Cœur bleu       😂 Rire           🎮 Manette
🎵 Musique         🇫🇷 France         🇮🇳 Inde
🇨🇴 Colombie       🇳🇱 Pays-Bas      🇲🇺 Maurice
💛 Cœur jaune      🌸 Fleur          🎤 Micro
🏆 Trophée         👥 Équipe         ⭐ Star
🚀 Fusée           💕 Cœurs          🎊 Confettis
📖 Livre           💡 Idée           🌍 Monde
🙏 Merci           ❄️ Glaçons        ✨ Paillettes
```

---

## 📊 Codage des Easter Eggs

### Structure du Code

```gdscript
if normalized_answer == "mot_cle":     ← Vérifie si la réponse = mot-clé
    is_easter_egg = true               ← Marque comme easter egg
    solved_enigmas[enigma_id] = true   ← Compte comme résolu
    var ui_manager = ...               ← Trouve l'UIManager
    if ui_manager:
        ui_manager.show_feedback(...)  ← Affiche le message vert
    check_all_enigmas_solved()         ← Vérifie si jeu terminé
    print(...)                          ← Debug (console)
    return                              ← Quitte la fonction
```

### Normalisation (Important!)

```gdscript
var normalized_answer = answer.to_lower().replace(" ", "")
```

**Cela signifie:**
- `"MEME"` → `"meme"` (majuscules → minuscules)
- `"M E M E"` → `"meme"` (espaces supprimés)
- `"mEMe"` → `"meme"` (mélange → minuscules)

**Donc ces entrées fonctionnent toutes:**
- Taper: `MEME` ✅
- Taper: `meme` ✅
- Taper: `Meme` ✅
- Taper: `m e m e` ✅ (les espaces sont supprimés!)

---

## 🎁 3 Idées d'Easter Eggs à Ajouter

### Idée 1: MERCI MERCI (Gratitude Extra)

```gdscript
	# Easter egg 7: "merci merci"
	if normalized_answer == "mercimerci":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("💙💙 MERCI MERCI MERCI!! 💙💙", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'merci merci' triggered!")
		return
```

### Idée 2: GRACIAS (Colombie)

```gdscript
	# Easter egg 8: "gracias"
	if normalized_answer == "gracias":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("💛 ¡Gracias, Apoorva! ¡Eres la mejor! 💛", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'gracias' triggered!")
		return
```

### Idée 3: COLOMBIE

```gdscript
	# Easter egg 9: "colombie"
	if normalized_answer == "colombie":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🇨🇴 La Colombie du cœur d'Apoorva! 🇨🇴", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'colombie' triggered!")
		return
```

---

## 🔍 Vérifier que tout fonctionne

### Test 1: Compilation
```
1. Ouvre Godot
2. Regarde la console
3. Pas de messages d'erreur rouge? ✅
```

### Test 2: En Jeu
```
1. Appuie sur F5 (Play)
2. Clique "Commencer le Jeu"
3. À la première énigme
4. Tape "meme"
5. Clique "Soumettre"
6. ✅ Tu vois "👑 MEME QUEEN FOR LIFE! 👑"?
7. ✅ Une image apparaît et disparaît après 3 sec?
```

### Test 3: Le Tien
```
1. Ajoute ton nouvel easter egg
2. Sauvegarde et relance Godot
3. Teste avec ton mot-clé
4. ✅ Le feedback s'affiche?
5. ✅ Pas d'erreurs?
```

---

## 📋 Documentation Créée

Tu as maintenant 3 guides:

1. **EASTER_EGGS_GUIDE.md** - Guide complet (technique)
2. **EASTER_EGGS_TUTORIAL.md** - Tutorial interactif (3 exemples)
3. **THIS FILE** - Quick reference (résumé visuel)

---

## 🎯 Prochaines Étapes

### Court terme:
1. Test les 6 easter eggs existants
2. Ajoute 3 nouveaux easter eggs (voir idées ci-dessus)
3. Ajouste les messages/emojis à ton goût

### Long terme:
1. Ajouter du son quand easter egg trouvé
2. Créer un compteur secret
3. Débloquer un bonus si tous les easter eggs trouvés

---

## ❓ FAQ

**Q: Je tape "meme" mais rien ne se passe?**
A: Vérifie que tu es dans une énigme (pas au menu)

**Q: Le feedback s'affiche mais pas l'image?**
A: Normal! L'image dépend du EasterEggManager. Elle devrait apparaître.

**Q: Je veux ajouter un easter egg qui marche seulement à l'énigme 1?**
A: Utilise `if enigma_id == 1:` avant les autres vérifications

**Q: Peut-on avoir le même easter egg qui donne différentes réponses?**
A: Oui! Créer plusieurs `if normalized_answer == "mot":` 

---

## 🚀 Tu es Prêt!

Maintenant tu sais:
- ✅ Comment jouer avec les easter eggs
- ✅ Comment en créer de nouveaux
- ✅ Comment les personnaliser
- ✅ Comment les tester

**À toi de jouer! 🎮**
