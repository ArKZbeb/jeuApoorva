# 📦 Guide Build & Export

## ✅ Pré-Export Checklist

Avant d'exporter, vérifier:

- [ ] Godot se lance sans erreur de compilation
- [ ] Tous les fichiers JSON sont présents:
  - `res://assets/data/enigmes.json` ✅
  - `res://assets/data/message.json` ✅
- [ ] Audio est présent:
  - `res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3` ✅
- [ ] Aucune erreur dans la console (F12)
- [ ] Game test réussi: **F5 → Menu → Commencer → Tous les énigmes**

---

## 🚀 Export Windows .exe

### Étapes Complètes:

1. **Ouvrir Godot** depuis le dossier `godot_jeu/`

2. **Project → Export... (Ctrl+Alt+E)**

3. **Ajouter preset Windows Desktop:**
   - Si absent, cliquer "Add Preset"
   - Sélectionner **"Windows Desktop"**
   - Cliquer "Create & Edit"

4. **Configurer l'export:**
   ```
   Export Path: ../Jeu_Adieu_Apoorva.exe
   Scenes to Export: (garder par défaut)
   Resources: (garder par défaut)
   Features: (garder par défaut)
   ```

5. **Options avancées (optionnel):**
   ```
   Debug → unchecked (si vous voulez Release)
   Console Output → unchecked (interface propre)
   Application Icon: (peut changer si désiré)
   ```

6. **Cliquer "Export Project"**

7. **Sélectionner un dossier** où exporter (ex: Desktop)

8. **Attendre 30-60 secondes** pour la compilation

### Résultat d'Export:

```
Desktop/
├── Jeu_Adieu_Apoorva.exe          ← L'exécutable
├── Jeu_Adieu_Apoorva.exe.folder/  ← Les assets (généré auto)
│   ├── ...
│   └── res://...
└── (Optionnel: .pck si emballé)
```

### Tester l'exécutable:

1. **Fermer Godot**
2. **Double-cliquer** sur `Jeu_Adieu_Apoorva.exe`
3. **Vérifier:**
   - [ ] Le jeu se lance
   - [ ] Menu apparaît
   - [ ] Musique joue
   - [ ] Boutons répondent
   - [ ] Pas d'erreur de ressources manquantes

---

## 🍎 Export macOS .app (optionnel)

### Depuis un Mac:

1. **Project → Export...**
2. Sélectionner **"macOS"**
3. Configurer:
   ```
   Export Path: ../Jeu_Adieu_Apoorva.app
   Bundle: com.jeu.adieu
   ```
4. Cliquer **"Export"**

### Depuis Windows:

⚠️ **Non recommandé** - Cela nécessite les SDKs macOS
Mieux vaut exporter depuis un vrai Mac

---

## 📋 Configuration Godot Actuelle

Le fichier `project.godot` est déjà configuré:

```
[application]
config/name="Jeu d'Adieu Apoorva"
run/main_scene="res://scenes/menu.tscn"

[physics]
3d/gravity = 9.8

[input]
ui_up/events=[InputEventKey(keycode=87)]
ui_down/events=[InputEventKey(keycode=83)]
ui_left/events=[InputEventKey(keycode=65)]
ui_right/events=[InputEventKey(keycode=68)]
```

### Pas besoin de modification!

---

## 🎮 Vérifier le Build

### Avant Export:

```bash
# Dans le dossier godot_jeu/
# Vérifier que les fichiers JSON sont valides:
cat assets/data/enigmes.json       # Doit être du JSON
cat assets/data/message.json        # Doit être du JSON
ls -l assets/audio/*.mp3            # Vérifier le fichier audio
```

### Après Export:

```bash
# Tester rapidement l'exécutable:
./Jeu_Adieu_Apoorva.exe

# Vérifications:
# - Menu se lance
# - Musique joue
# - Contrôles clavier (Z/Q/S/D) répondent
# - Énigmes peuvent être jouées
```

---

## 🔗 Distribution

### Partager le Jeu:

1. **Créer un dossier:**
   ```
   Jeu_Adieu_Apoorva/
   ├── Jeu_Adieu_Apoorva.exe
   ├── Jeu_Adieu_Apoorva.exe.folder/  (garder ce dossier!)
   └── README.txt (optionnel)
   ```

2. **Zipper si nécessaire:**
   ```bash
   # Windows: Clic-droit → Envoyer vers → Dossier compressé
   # Ou: 7-Zip → Ajouter à l'archive
   ```

3. **Partager le zip ou le dossier entier**

### Compatibilité:

- ✅ Windows 10/11 (32-bit et 64-bit)
- ✅ Antivirus peuvent bloquer (c'est normal, pas un virus 😄)
- ✅ Aucune installation nécessaire
- ✅ Double-clic pour lancer

### Note Utilisateur:

Si l'antivirus bloque:
```
Windows Defender → Threat History → Isoler → Actions recommandées → Restaurer
OU
Exclure le fichier des analyses en temps réel
```

---

## 📊 Résumé Export

| Étape | Durée | Notes |
|-------|-------|-------|
| Ouvrir Godot | 2-5s | Normal |
| Configurer Export | 1-2m | Une fois) |
| Export Project | 30-60s | Première fois plus long |
| Test .exe | 2-3m | Vérifier essentiels |
| Total | ~5m | Rapide! |

---

## ❌ Dépannage Export

### "Export Failed - Resource not found"
```
→ Vérifier que enigmes.json et message.json existent
→ Vérifier que le fichier MP3 existe
→ Relancer Godot et réessayer
```

### ".exe lance mais no music/JSON"
```
→ Vérifier que le dossier ".folder" est présent
→ Vérifier que les assets sont dedans
→ Rajouter à main scene les fichiers JSON
```

### "Impossible d'ouvrir le .exe"
```
→ Installer Visual C++ Redistributable:
  https://support.microsoft.com/en-us/help/2977003
→ Vérifier que le système est Windows 7+ 
```

### "Antivirus le bloque"
```
→ C'est normal! C'est un faux positif
→ Exclure dans les paramètres antivirus
→ Ou signer le .exe (complexe)
```

---

## 🎉 Prêt à Distribuer!

```
Le jeu est maintenant en .exe standalone!

Vous pouvez:
✅ Envoyer par email
✅ Mettre sur USB
✅ Partager sur Drive/OneDrive
✅ Sauvegarder en sécurité

À Apoorva:
"Télécharge et double-clic sur Jeu_Adieu_Apoorva.exe - C'est un adieu du team! 👑"
```

---

**L'export est prêt! Bonne chance! 🎮**
