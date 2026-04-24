# 🎮 Liste Complète des Easter Eggs

**12 Easter Eggs Secrets avec Images** - Essayez-les tous!

---

## Guide des Easter Eggs

Tous les easter eggs sont **insensibles à la casse** et **ignorent les espaces**. Par exemple: "Meme", "MEME", "M E M E" fonctionnent tous de la même façon.

Il suffit de taper le mot-clé à **n'importe quelle énigme** du jeu et de valider pour déclencher l'easter egg!

---

## 🎯 Les 12 Easter Eggs

| # | Mot-clé | Message | Image |
|---|---------|---------|-------|
| 1 | **meme** | 👑 MEME QUEEN FOR LIFE! Merci d'avoir joué! 👑 | unnamed.jpg |
| 2 | **apoorva** | 🌟 C'est elle! Apoorva est une REINE! 🌟 | photoMariage.png |
| 3 | **merci** | 💙 De rien! Merci à toi aussi Apoorva! 💙 | IMG_0343.jpeg |
| 4 | **team** | 👥 C'est ça! L'équipe c'est super avec toi! 👥 | IMG_0348.jpeg |
| 5 | **help** | 📖 L'indice est là! Regarde bien! 📖 | IMG_0557.jpeg |
| 6 | **godot** | 🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮 | IMG_6271.jpeg |
| 7 | **amour** | 💕 Amour et aventure! Le jeu parfait! 💕 | 20250925_134343.jpg |
| 8 | **jeu** | 🎮 Merci de jouer à ce jeu spécial! 🎮 | IMG_7089.jpeg |
| 9 | **photo** | 📸 Des souvenirs magnifiques! 📸 | IMG_7093.jpeg |
| 10 | **souvenir** | ✨ Un beau souvenir! ✨ | IMG_7194.JPG |
| 11 | **aventure** | 🗺️ L'aventure commence! 🗺️ | 20250925_134412.jpg |
| 12 | **mariage** | 💍 Un jour spécial! 💍 | photoMariage.png |

---

## Comment les Découvrir

### Conseils de Jeu
- Visitez **n'importe quelle énigme** dans le jeu (elles ont des points d'interrogation ou des étiquettes)
- Quand une énigme est ouverte, entrez le mot-clé secret dans le champ de texte
- Cliquez sur "Valider" ou appuyez sur Entrée
- L'easter egg se déclenche avec:
  - ✨ Un message spécial avec des emojis
  - 🖼️ Une popup d'image qui s'affiche pendant 3 secondes
  - ✅ L'énigme est marquée comme résolue!

### Où les Essayer
- **Bureau** (Acte 1) - Plusieurs énigmes disponibles
- **Salle d'Aventures** (Acte 2) - Plus d'énigmes à découvrir
- **Mur de Messages** (Acte 3) - Énigmes finales
- **N'importe quelle énigme** du jeu fonctionne!

---

## Caractéristiques

✅ **Les 11 images sont toutes affichées**
- Chaque easter egg affiche une image unique ou connexe
- Les images apparaissent dans une popup centrée pendant 3 secondes
- Les images sont automatiquement redimensionnées pour s'adapter

✅ **Les easter eggs comptent comme des énigmes résolues**
- Quand vous déclenchez un easter egg, il compte comme si vous aviez résolu cette énigme
- La barre de progression se met à jour en conséquence

✅ **Insensible à la casse et tolérant aux espaces**
- "Meme", "MEME", "M E M E" fonctionnent tous
- "Team", "TEAM", "T E A M" fonctionnent tous
- Parfait pour les fautes de frappe!

---

## Thèmes des Easter Eggs

**Références Personnelles** 🌟
- `apoorva` - Le personnage principal!
- `merci` - Gratitude
- `team` - Appréciation de l'équipe
- `mariage` - Référence mariage spéciale

**Liés au Jeu** 🎮
- `godot` - Moteur de jeu
- `jeu` - Le jeu lui-même

**Vibes Positives** 💫
- `meme` - Amusement et rires
- `amour` - Amour et aventure
- `photo` - Souvenirs
- `souvenir` - Nostalgie
- `aventure` - L'esprit d'aventure
- `help` - Aide et soutien

---

## Ajouter d'Autres Easter Eggs

Pour ajouter un nouvel easter egg, modifiez `scripts/game_manager.gd` et suivez ce modèle:

```gdscript
# Easter egg N: "motcle"
if normalized_answer == "motcle":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("🎯 Votre message ici! 🎯", true)
        trigger_easter_egg_image("res://assets/images/votreimage.jpg")
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'motcle' triggered!")
    return
```

**Points Clés:**
1. Choisissez un mot-clé unique
2. Remplacez `"motcle"` par votre mot-clé (doit correspondre à la vérification)
3. Créez un message rempli d'emojis
4. Pointez vers une image dans `res://assets/images/`
5. Ajoutez une instruction print de débogage
6. Retournez pour éviter tout traitement ultérieur

---

## Images Disponibles

Les 11 images dans `assets/images/`:
- `unnamed.jpg` - Petite image
- `photoMariage.png` - Grande photo de mariage
- `IMG_0343.jpeg` - Photo personnelle
- `IMG_0348.jpeg` - Photo personnelle
- `IMG_0557.jpeg` - Photo personnelle
- `IMG_6271.jpeg` - Photo personnelle
- `IMG_7089.jpeg` - Photo personnelle
- `IMG_7093.jpeg` - Photo personnelle
- `IMG_7194.JPG` - Photo personnelle
- `20250925_134343.jpg` - Photo datée
- `20250925_134412.jpg` - Photo datée

---

## Tests

**Pour tester les easter eggs:**
1. Lancez le jeu (F5 dans Godot)
2. Naviguez vers n'importe quelle énigme
3. Tapez l'un des mots-clés ci-dessus
4. Appuyez sur Valider ou Entrée
5. Regardez le message spécial et la popup d'image!

**Tous les easter eggs fonctionnent instantanément** - pas de temps de chargement!

---

**Amusez-vous à découvrir les 12 easter eggs! 🎉**
