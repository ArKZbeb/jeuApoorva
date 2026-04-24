# 📝 Changelog - Jeu d'Adieu Apoorva

## Version 1.1.0 - Final Build (24 Avril 2026)

### ✨ Nouvelles Fonctionnalités:
- ✅ **Easter Egg "meme"** - Tape "meme" sur n'importe quelle énigme pour déverrouiller une réponse spéciale
- ✅ **Musique persistante** - La musique Espresso joue du menu jusqu'à la fin du jeu
- ✅ **Mode single-player optimisé** - Contrôles clavier ZQSD fluides et réactifs
- ✅ **Système de progression** - Impossible de progresser sans résoudre les 6/6 énigmes

### 🎮 Améliorations de Gameplay:
- Refined player movement and camera controls
- Added keyboard support (Z/Q/S/D for AZERTY/QWERTY)
- Improved enigma UI with better feedback messages
- Added visual counter (X/6 enigmas solved)
- Enigma button becomes green/active only when all 6 are solved

### 📚 Documentation:
- ✅ Created comprehensive TEST_PLAN.md with step-by-step testing procedures
- ✅ Updated QUICKSTART.md for single-player mode
- ✅ Updated BUILD.md with detailed export instructions
- ✅ Updated README.md with complete game overview
- ✅ Created this CHANGELOG.md

### 🔧 Technical Changes:
- Modified `game_manager.gd` to check for "meme" easter egg answer
- Added case-insensitive and space-insensitive answer checking
- Improved UIManager dialogue system
- MusicManager now persists across scene changes
- Added comprehensive debug logging for troubleshooting

### 🐛 Bug Fixes:
- Fixed enigma progress counter display
- Fixed NextSceneButton condition checking
- Fixed UIManager node path lookups
- Fixed music volume levels

### 📦 Files Modified:
- `scripts/game_manager.gd` - Added easter egg logic
- `scripts/music_manager.gd` - Music persistence
- `godot_jeu/QUICKSTART.md` - Updated for single-player
- `godot_jeu/BUILD.md` - Detailed export guide
- `godot_jeu/README.md` - Complete documentation
- `godot_jeu/TEST_PLAN.md` - NEW - Comprehensive test procedures

### 📊 Known Limitations:
- Photos not yet integrated into message display (feature: optional enhancement)
- Message display is text overlay (could be 3D wall projection in future)
- Easter egg system is minimal (could add more hidden features)

---

## Version 1.0.0 - Initial Release (Previous)

### Initial Features:
- ✅ 3-act story progression
- ✅ 6 enigmas with personalized questions about Apoorva
- ✅ 3 scenes (Bureau, Salle Aventures, Mur des Messages)
- ✅ JSON-based enigma and message system
- ✅ Single-player FPS controls
- ✅ GameManager for progression tracking
- ✅ UIManager for dialogue and feedback

---

## 🎯 Roadmap (Future)

### v1.2.0 - Polish & Enhancement:
- [ ] Integrate photos into message display
- [ ] Add 3D text projection on wall
- [ ] Add more easter eggs
- [ ] Add achievements/completion tracking
- [ ] Add in-game settings menu (volume, graphics, etc.)

### v2.0.0 - Extended Features:
- [ ] Multiplayer mode (return to 4-player split-screen)
- [ ] Additional levels/acts
- [ ] Save/load system
- [ ] Statistics tracking
- [ ] Leaderboard (if multiplayer)

---

## 🚀 Release Notes

### How to Play:
1. Launch the game or run Godot and press F5
2. Click "Commencer le Jeu" on the menu
3. Navigate through 3 acts:
   - **Bureau**: Find and click the red exit button
   - **Salle Aventures**: Solve all 6 enigmas (or type "meme" for easter egg!)
   - **Mur des Messages**: Read farewell messages
4. Enjoy the music and celebrate Apoorva! 👑

### Export Instructions:
See `BUILD.md` for complete Windows .exe export process.

### Testing:
See `TEST_PLAN.md` for comprehensive testing procedures.

---

## ❓ FAQ

**Q: Can I play this with multiple players?**
A: Current version is single-player. Multiplayer mode is planned for v2.0.0.

**Q: What happens if I type "meme"?**
A: You get a special easter egg response and the enigma is marked as solved! 👑

**Q: Can I modify the enigmas or messages?**
A: Yes! Edit `assets/data/enigmes.json` and `assets/data/message.json` respectively.

**Q: How do I export the game as .exe?**
A: Follow the detailed instructions in `BUILD.md`.

**Q: Is there a Mac version?**
A: Yes! Export from Mac or use BUILD.md instructions (requires additional setup on Windows).

---

## 🙏 Credits

**Developed in Godot 4.6**
- Game created as a farewell tribute to Apoorva
- Music: "Espresso" by Sabrina Carpenter
- Made with ❤️ by the team

---

**Version 1.1.0 Ready for Deployment! 🎉**
