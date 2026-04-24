# 🔧 Guide Pas à Pas: Ajouter des Easter Eggs

## 📍 Où Modifier?

**Fichier:** `godot_jeu/scripts/game_manager.gd`
**Section:** Easter eggs (lignes 75-147)

---

## 📝 La Structure Exacte

### Avant (État actuel)

```gdscript
[...des lignes de code...]

	# Easter egg 6: "godot"
	if normalized_answer == "godot":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'godot' triggered!")
		return           ← LIGNE 146
	
	var is_correct = normalized_answer == normalized_correct  ← LIGNE 148
```

### Après (Ce que tu vas ajouter)

```gdscript
[...des lignes de code...]

	# Easter egg 6: "godot"
	if normalized_answer == "godot":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'godot' triggered!")
		return
	
	# Easter egg 7: "surprise"  ← LIGNE 148 (AJOUTER ICI)
	if normalized_answer == "surprise":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎉 Surprise! C'était un easter egg! 🎉", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'surprise' triggered!")
		return
	
	var is_correct = normalized_answer == normalized_correct  ← LIGNE 159 (ANCIENNE 148)
```

---

## 🎯 Les 3 Étapes

### ÉTAPE 1️⃣: Ouvre le fichier

```
1. Dans Godot, ouvre le fichier:
   godot_jeu/scripts/game_manager.gd
2. Utilise Ctrl+G pour aller à la ligne 146
3. Tu dois voir:
   └─ return
```

### ÉTAPE 2️⃣: Positionne le curseur

```
À la ligne 146, après "return":
- Appuie sur "Fin" pour aller à la fin de la ligne
- Appuie sur "Entrée" (crée une nouvelle ligne)
- Tu es maintenant ligne 147
```

### ÉTAPE 3️⃣: Ajoute le code

```
À la ligne 147, ajoute:

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

---

## ✅ Checklist Visual

```
Avant:
├─ Easter egg 1: "meme"          ✅ Existe
├─ Easter egg 2: "apoorva"       ✅ Existe
├─ Easter egg 3: "merci"         ✅ Existe
├─ Easter egg 4: "team"          ✅ Existe
├─ Easter egg 5: "help"          ✅ Existe
├─ Easter egg 6: "godot"         ✅ Existe
└─ [FIN] var is_correct = ...    ← Point de jonction

Après:
├─ Easter egg 1-6                ✅ Inchangés
├─ Easter egg 7: "surprise"      ✨ NOUVEAU
├─ Easter egg 8: "gracias"       ✨ NOUVEAU (optionnel)
├─ Easter egg 9: "pays"          ✨ NOUVEAU (optionnel)
└─ [FIN] var is_correct = ...    ← Décalé vers le bas
```

---

## 📚 Les 3 Exemples à Ajouter

### Exemple 1: SURPRISE

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

### Exemple 2: GRACIAS (Colombie)

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

### Exemple 3: PAYS (Tous les pays)

```gdscript
	# Easter egg 9: "pays"
	if normalized_answer == "pays":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🌍 Inde 🇮🇳, Colombie 🇨🇴, Pays-Bas 🇳🇱, Île Maurice 🇲🇺, France 🇫🇷!", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'pays' triggered!")
		return
```

---

## 🎬 Démonstration Vidéo (Texte)

```
Utilisateur tape: "surprise"
    ↓
Godot reçoit: answer = "surprise"
    ↓
Normalisation: normalized_answer = "surprise"
    ↓
Vérification: if normalized_answer == "surprise" → TRUE
    ↓
Exécution du bloc:
    └─ is_easter_egg = true
    └─ solved_enigmas[enigma_id] = true (compte comme résolu!)
    └─ Affiche: "🎉 Surprise! C'était un easter egg! 🎉" (vert, 2 sec)
    └─ Image aléatoire apparaît (3 sec)
    └─ Vérification: check_all_enigmas_solved()
    └─ Console: "[GameManager] Easter egg 'surprise' triggered!"
    └─ Retour de la fonction: return
    ↓
Utilisateur voit:
    ├─ Message vert ✅
    ├─ Image popup
    └─ +1 énigme résolue (compte dans le total!)
```

---

## 🎵 Importance de l'INDENTATION

⚠️ **ATTENTION: L'indentation est TRÈS importante!**

### ✅ CORRECT

```gdscript
	# Easter egg 7: "surprise"
	if normalized_answer == "surprise":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
```

Chaque niveau = 1 TAB (ou 4 espaces)

### ❌ INCORRECT

```gdscript
# Easter egg 7: "surprise"  ← Pas assez d'indentation!
if normalized_answer == "surprise":  ← Pas assez!
is_easter_egg = true  ← ERREUR! Aucune indentation
```

**Résultat:** Erreur de compilation rouge!

---

## 🧪 Tester Immédiatement

### Après avoir ajouté le code:

1. **Sauvegarde** (Ctrl+S)
2. **Console Godot** (F2):
   - Pas de messages rouges? ✅
3. **Relance le jeu** (F5)
4. **Test:**
   - Tape "surprise"
   - Clique "Soumettre"
   - ✅ Voir "🎉 Surprise! C'était un easter egg! 🎉"?

---

## 💾 Avant/Après Complet

### AVANT:
```gdscript
	# Easter egg 6: "godot"
	if normalized_answer == "godot":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'godot' triggered!")
		return
	
	var is_correct = normalized_answer == normalized_correct
```

### APRÈS:
```gdscript
	# Easter egg 6: "godot"
	if normalized_answer == "godot":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'godot' triggered!")
		return
	
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
	
	# Easter egg 9: "pays"
	if normalized_answer == "pays":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🌍 Inde 🇮🇳, Colombie 🇨🇴, Pays-Bas 🇳🇱, Île Maurice 🇲🇺, France 🇫🇷!", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'pays' triggered!")
		return
	
	var is_correct = normalized_answer == normalized_correct
```

---

## 🚀 Résumé

✅ Ouvre `game_manager.gd`
✅ Va ligne 146 (après le dernier easter egg)
✅ Crée une nouvelle ligne
✅ Ajoute les 3 blocs d'easter eggs
✅ Sauvegarde (Ctrl+S)
✅ Teste (F5)

**C'est tout! Tu as 9 easter eggs maintenant! 🎁**

---

*Guide créé le 24 avril 2026*
