# 🎁 Tutorial Interactif: Créer tes Propres Easter Eggs

## 🎯 Objectif
Tu vas apprendre à ajouter 3 nouveaux easter eggs en moins de 5 minutes!

---

## 📚 Exemple 1: Easter Egg Simple

### Étape 1: Choisis un mot
```
Mot choisi: "surprise"
Feedback: "🎉 Surprise! C'était un easter egg! 🎉"
```

### Étape 2: Localise le fichier
```
Fichier: godot_jeu/scripts/game_manager.gd
Ligne: ~146 (après le dernier easter egg "godot")
```

### Étape 3: Ajoute le code

**AVANT (ce qui est déjà là):**
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

**APRÈS (avec ton nouvel easter egg):**
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
	
	# Easter egg 7: "surprise"  ← NOUVELLE LIGNE
	if normalized_answer == "surprise":  ← NOUVELLE LIGNE
		is_easter_egg = true  ← NOUVELLE LIGNE
		solved_enigmas[enigma_id] = true  ← NOUVELLE LIGNE
		var ui_manager = get_parent().get_node_or_null("UIManager")  ← NOUVELLE LIGNE
		if ui_manager:  ← NOUVELLE LIGNE
			ui_manager.show_feedback("🎉 Surprise! C'était un easter egg! 🎉", true)  ← NOUVELLE LIGNE
		check_all_enigmas_solved()  ← NOUVELLE LIGNE
		print("[GameManager] Easter egg 'surprise' triggered!")  ← NOUVELLE LIGNE
		return  ← NOUVELLE LIGNE
	
	var is_correct = normalized_answer == normalized_correct
```

### Étape 4: Teste
```
1. Relance le jeu
2. À n'importe quelle énigme, tape "surprise"
3. ✅ Tu vois "🎉 Surprise! C'était un easter egg! 🎉"
4. ✅ Une image aléatoire s'affiche
```

---

## 📚 Exemple 2: Easter Egg Personnalisé

### Idée: Easter Egg "Merci Apoorva"
```
Mot: "gracias"
Feedback: "💛 ¡Gracias, Apoorva! ¡Eres la mejor! 💛"
Raison: Référence à la Colombie (mari colombien)
```

### Code à ajouter
```gdscript
	# Easter egg 8: "gracias" (Colombie)
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

### Où le placer
Après le code de "surprise" qu'on vient d'ajouter!

---

## 📚 Exemple 3: Easter Egg avec Référence Personnelle

### Idée: Easter Egg "Pays"
```
Mot: "pays"
Feedback: "🌍 Inde, Colombie, Pays-Bas, Île Maurice, France... Quelle richesse! 🌍"
Raison: Tous les pays mentionnés dans les énigmes
```

### Code à ajouter
```gdscript
	# Easter egg 9: "pays" (Tous les pays du jeu)
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

## 🎨 Template Réutilisable

Copie/colle et adapte ce template pour chaque nouvel easter egg:

```gdscript
	# Easter egg N: "MON_MOT_CLE"
	if normalized_answer == "mon_mot_cle":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("EMOJI MESSAGE ICI EMOJI", true)
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'mon_mot_cle' triggered!")
		return
```

### Instructions de remplissage:
1. Remplace `MON_MOT_CLE` par ton mot-clé (ex: "surprise")
2. Remplace `EMOJI MESSAGE ICI EMOJI` par ton message avec emojis
3. Mets à jour le numéro (Easter egg N)
4. Copie tout le bloc après le dernier easter egg existant
5. Teste!

---

## 📋 Checklist Pas à Pas

### ✅ Étape 1: Prépare
- [ ] Choisis un mot-clé
- [ ] Écris le message avec emojis
- [ ] Ouvre le fichier `game_manager.gd`

### ✅ Étape 2: Localise
- [ ] Ligne ~146: Tu vois le code `return` du dernier easter egg
- [ ] Ligne ~148: Tu vois `var is_correct = normalized_answer == normalized_correct`

### ✅ Étape 3: Ajoute
- [ ] Copie le template ci-dessus
- [ ] Remplace les valeurs
- [ ] Colle entre la ligne 146 et 148

### ✅ Étape 4: Sauvegarde
- [ ] Ctrl+S (ou Cmd+S sur Mac)
- [ ] Attends 1-2 secondes (compilation Godot)
- [ ] Regarde la console: pas d'erreur rouge?

### ✅ Étape 5: Teste
- [ ] Lance le jeu (F5)
- [ ] Va à une énigme
- [ ] Tape ton mot-clé
- [ ] Clique "Soumettre"
- [ ] ✅ Voir le feedback?
- [ ] ✅ Voir une image?

---

## 🎯 Les 3 Easter Eggs à Ajouter

### Easter Egg 7: SURPRISE
```
Mot: surprise
Feedback: 🎉 Surprise! C'était un easter egg! 🎉
```

### Easter Egg 8: GRACIAS (Colombie)
```
Mot: gracias
Feedback: 💛 ¡Gracias, Apoorva! ¡Eres la mejor! 💛
```

### Easter Egg 9: PAYS
```
Mot: pays
Feedback: 🌍 Inde 🇮🇳, Colombie 🇨🇴, Pays-Bas 🇳🇱, Île Maurice 🇲🇺, France 🇫🇷!
```

---

## 🐛 Troubleshooting

### ❌ Ça ne fonctionne pas!

**Problème 1: Erreur de compilation**
```
Symptôme: Console rouge avec erreur
Solution: Vérifie que tu as bien fermé la parenthèse et les accolades
```

**Problème 2: L'easter egg ne se déclenche pas**
```
Symptôme: Tu tapes le mot mais rien ne se passe
Solution: Vérifie l'indentation (4 espaces par niveau)
```

**Problème 3: L'image ne s'affiche pas**
```
Symptôme: Le feedback oui, mais pas l'image
Solution: C'est normal! L'image dépend du EasterEggManager
```

---

## 🎊 Résultat Final

Quand tu auras ajouté les 3 easter eggs, tu auras:

```
✅ Réponses correctes (6): netherlands, one ad conducteur, le décrochage, karaoke, briser les glaçons, bordel
✅ Easter eggs originaux (6): meme, apoorva, merci, team, help, godot
✅ Tes nouveaux easter eggs (3): surprise, gracias, pays
═════════════════════════════════════════════════════════════════
TOTAL: 15 réponses différentes! 🎉
```

Et en jeu:
```
Joueur: "Quel pays manque à sa famille?"
Joueur tape: "gracias"
Jeu: "💛 ¡Gracias, Apoorva! ¡Eres la mejor! 💛"
+ Image aléatoire
+ Énigme compte comme résolue
```

---

## 💡 Prochaines Idées

Après avoir maîtrisé les easter eggs, tu peux:

1. **Ajouter des conditions**: Easter egg seulement après 3 énigmes résolues
2. **Varier les images**: Certains easter eggs affichent une image spécifique
3. **Ajouter du son**: Jouer un son quand un easter egg est trouvé
4. **Compteur secret**: Tracker les easter eggs trouvés et afficher un bonus

---

**Tu es prêt à créer tes easter eggs! 🚀**
