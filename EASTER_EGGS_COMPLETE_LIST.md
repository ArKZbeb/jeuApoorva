# 🎮 Complete Easter Eggs List

**12 Secret Easter Eggs with Images** - Try them all!

---

## Easter Eggs Guide

All easter eggs are case-insensitive and ignore spaces. For example: "Meme", "MEME", "M E M E" all work the same way.

Just type the keyword at **any enigma** in the game and submit to trigger the easter egg!

---

## 🎯 12 Easter Eggs

| # | Keyword | Message | Image |
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

## How to Find Them

### Gameplay Tips
- Visit any **enigma object** in the game (they have question marks or labels)
- When an enigma is open, enter the secret keyword in the text input
- Click "Submit" or press Enter
- The easter egg will trigger with:
  - ✨ A special message with emojis
  - 🖼️ A popup image that displays for 3 seconds
  - ✅ The enigma is marked as solved!

### Where to Try Them
- **Bureau** (Act 1) - Multiple enigmas available
- **Salle d'Aventures** (Act 2) - More enigmas to discover
- **Mur de Messages** (Act 3) - Final enigmas
- **Any enigma** in the game works!

---

## Features

✅ **All 11 images are displayed**
- Each easter egg shows a unique or related image
- Images appear in a centered popup for 3 seconds
- Images are automatically resized to fit

✅ **Easter eggs count as solved enigmas**
- When you trigger an easter egg, it counts as if you solved that enigma
- Progress bar updates accordingly

✅ **Case-insensitive and space-tolerant**
- "Meme", "MEME", "M E M E" all work
- "Team", "TEAM", "T E A M" all work
- Perfect for typos!

---

## Easter Egg Themes

**Personal References** 🌟
- `apoorva` - The main character!
- `merci` - Gratitude
- `team` - Team appreciation
- `mariage` - Special wedding reference

**Game-Related** 🎮
- `godot` - Game engine
- `jeu` - French for "game"

**Positive Vibes** 💫
- `meme` - Fun and laughs
- `amour` - Love and adventure
- `photo` - Memories
- `souvenir` - Nostalgia
- `aventure` - The adventure spirit
- `help` - Helpful and supportive

---

## Adding More Easter Eggs

To add a new easter egg, edit `scripts/game_manager.gd` and follow this template:

```gdscript
# Easter egg N: "keyword"
if normalized_answer == "keyword":
    is_easter_egg = true
    solved_enigmas[enigma_id] = true
    var ui_manager = get_parent().get_node_or_null("UIManager")
    if ui_manager:
        ui_manager.show_feedback("🎯 Your message here! 🎯", true)
        trigger_easter_egg_image("res://assets/images/yourimage.jpg")
    check_all_enigmas_solved()
    print("[GameManager] Easter egg 'keyword' triggered!")
    return
```

**Key Points:**
1. Choose a unique keyword
2. Replace `"keyword"` with your keyword (must match normalized_answer == check)
3. Create an emoji-filled message
4. Point to an image in `res://assets/images/`
5. Add a debug print statement
6. Return to prevent further processing

---

## Images Available

All 11 images in `assets/images/`:
- `unnamed.jpg` - Small file
- `photoMariage.png` - Large wedding photo
- `IMG_0343.jpeg` - Personal photo
- `IMG_0348.jpeg` - Personal photo
- `IMG_0557.jpeg` - Personal photo
- `IMG_6271.jpeg` - Personal photo
- `IMG_7089.jpeg` - Personal photo
- `IMG_7093.jpeg` - Personal photo
- `IMG_7194.JPG` - Personal photo
- `20250925_134343.jpg` - Date-based photo
- `20250925_134412.jpg` - Date-based photo

---

## Testing

**To test easter eggs:**
1. Launch the game (F5 in Godot)
2. Navigate to any enigma
3. Type one of the keywords above
4. Press Submit or Enter
5. Watch the special message and image popup!

**All easter eggs work instantly** - no loading time!

---

**Enjoy discovering all 12 easter eggs! 🎉**
