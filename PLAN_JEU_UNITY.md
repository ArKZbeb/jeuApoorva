# 🎮 Plan de développement - Jeu Unity Multijoueur FPS

## Projet : Jeu d'adieu pour la rétro Scrum - Départ collègue

**Durée totale dev :** ~12 heures (Samedi + Dimanche)  
**Durée de jeu :** 5-10 minutes  
**Plateforme :** Windows .exe (compilé depuis Linux Fedora)

---

## 📋 Specifications

### Gameplay
- **Format :** Split-screen 2x2 (4 joueurs simultanés, style Mario Kart)
- **Contrôles :** Manettes locales (Xbox/PS4)
- **Type :** FPS explorable + énigmes coopératives
- **Progression :** Linéaire (3 actes)
- **Timing :** Jouable AVANT la rétro (warm-up collectif)

### Contenu
- **Références :** Inde, Colombie, Pays-Bas, Île Maurice, France, Karaoké, Memes
- **Énigmes :** 5-6 simples avec références internes
- **Photos :** En cadres dispersés partout dans les scènes
- **Messages :** JSON avec messages de collègues → affichés sur mur final
- **Musique :** Ambiance à intégrer
- **Visual finale :** Couronne emoji 👑 "MEME QUEEN" 👑

---

## 🎯 Structure du Jeu

### Acte 1 - Le Bureau (Exploration)
**Durée : ~2-3 min**

**Éléments :**
- Drapeaux (Inde 🇮🇳, Colombie 🇨🇴, France 🇫🇷, Pays-Bas 🇳🇱, Île Maurice 🇲🇺)
- Micro karaoké (caché quelque part)
- Cadres photos dispersés
- Post-it "Briser les glaçons"
- Easter egg "Bordel" (écrit discrètement)

**Gameplay :**
- 4 joueurs spawent ensemble
- Explorent librement et cliquent sur objets
- Découvrent indices/easter eggs

**Énigme 1 :**
- Question : "Quel pays manque à sa famille?"
- Réponse : Cliquer sur le drapeau Pays-Bas
- Indice : "Un pays avec des moulins"

---

### Acte 2 - Salle Aventures (Énigmes Coopératives)
**Durée : ~2-3 min**

**Énigmes mix (exploration + aide mutuelle) :**

| # | Question | Type | Réponse |
|---|----------|------|---------|
| 2 | Quel projet majeur a-t-elle mené? (1) | Texte | "One Ad Conducteur" |
| 3 | Quel autre projet important? | Texte | "Le Décrochage" |
| 4 | Passion secrète? | Clic | Cliquer micro karaoké |
| 5 | Phrase culte pour briser... | Recherche | Trouver "Briser les glaçons" |
| 6 | Mot "interdit" qu'on aimait dire? | Easter egg | Découvrir "Bordel" caché |

**Progression :**
- Énigmes doivent être résolues pour progresser
- Tous les joueurs peuvent contribuer
- Indices affichés en popup UI ou panneaux 3D

---

### Acte 3 - Mur des Messages (Fin Émouvante)
**Durée : ~1-2 min**

**Éléments :**
- **Grand mur blanc 3D** avec tous les messages JSON affichés
- Photos finales autour du mur
- **👑 "MEME QUEEN 👑"** (couronne emoji) - tribute
- Crédits + remerciements
- Musique douce/émouvante

**Format :**
```
[Message 1 - Auteur 1]
[Message 2 - Auteur 2]
[Message 3 - Auteur 3]
...
👑 MEME QUEEN 👑
```

---

## 🛠️ Architecture Technique

### Scripts Unity à créer

| Script | Responsabilité |
|--------|-----------------|
| `PlayerController.cs` | Mouvement FPS multijoueur (1 par joueur) |
| `InputManager.cs` | Détection 4 manettes Xbox/PS4 |
| `CameraManager.cs` | Split-screen 2x2 type Mario Kart |
| `InteractionSystem.cs` | Raycast pour cliquer objets |
| `GameManager.cs` | Progression narrative + énigmes |
| `UIManager.cs` | Pop-ups, panneaux 3D, texte |
| `MessageParser.cs` | Parse JSON + génère mur texte |
| `Menu.cs` | Écran titre simple |

### Structure de dossiers

```
Assets/
├── Scenes/
│   ├── Menu.unity
│   ├── Bureau.unity
│   ├── SalleAventures.unity
│   └── MurMessages.unity
├── Scripts/
│   ├── Player/
│   │   ├── PlayerController.cs
│   │   └── InputManager.cs
│   ├── Camera/
│   │   └── CameraManager.cs
│   ├── Interaction/
│   │   ├── InteractionSystem.cs
│   │   └── InteractableObject.cs
│   ├── Game/
│   │   ├── GameManager.cs
│   │   └── UIManager.cs
│   └── Utils/
│       └── MessageParser.cs
├── Prefabs/
│   ├── Player.prefab
│   ├── InteractableObject.prefab
│   ├── UIPanel.prefab
│   └── Message.prefab
├── Materials/
│   └── (textures simples)
├── Audio/
│   └── ambiance.mp3
└── Data/
    ├── messages.json
    └── enigmes.json
```

---

## 📦 Fichiers de données

### messages.json
```json
{
  "messages": [
    {
      "auteur": "Nom Collègue 1",
      "texte": "Message d'adieu personnalisé..."
    },
    {
      "auteur": "Nom Collègue 2",
      "texte": "Autre message mémorable..."
    }
  ]
}
```

### enigmes.json
```json
{
  "enigmes": [
    {
      "id": 1,
      "question": "Quel pays manque à sa famille?",
      "reponse": "netherlands",
      "indice": "Un pays avec des moulins",
      "type": "clic_drapeau"
    },
    {
      "id": 2,
      "question": "Quel projet majeur?",
      "reponse": "One Ad Conducteur",
      "indice": "Premier grand projet",
      "type": "texte"
    }
  ]
}
```

---

## 📅 Timeline de développement

### Samedi

**Matin (3h) :**
- [ ] Setup projet Unity 3D
- [ ] Créer structure dossiers
- [ ] `PlayerController.cs` - mouvement FPS 4 joueurs
- [ ] `InputManager.cs` - détection manettes

**Après-midi (3h) :**
- [ ] `CameraManager.cs` - split-screen 2x2
- [ ] Construire Scène 1 Bureau (primitives)
- [ ] Placer drapeaux, micro, cadres
- [ ] `InteractionSystem.cs` - raycast

### Dimanche

**Matin (3h) :**
- [ ] `GameManager.cs` - progression narrative
- [ ] `UIManager.cs` - pop-ups + panneaux
- [ ] Construire Scène 2 Aventures
- [ ] Intégrer énigmes

**Après-midi (3h) :**
- [ ] `MessageParser.cs` - parse JSON
- [ ] Construire Scène 3 Mur Messages
- [ ] Intégrer photos en cadres
- [ ] Intégrer musique
- [ ] Tests multijoueur 4 manettes
- [ ] Polish + Build Windows .exe

---

## ✅ Checklist Pré-Dev

### Avant samedi matin
- [ ] Unity Hub + Editor Linux Fedora installés
- [ ] 4 manettes branchées et testées
- [ ] Folder photos numérisées prêt
- [ ] Musique d'ambiance téléchargée (.mp3 ou .wav)
- [ ] Messages collectés auprès collègues (en texte ou JSON)
- [ ] Énigmes finalisées + réponses définies
- [ ] Café/snacks ☕

### Pendant le dev
- [ ] Tester avec 4 manettes simultanées (pas 1 ou 2!)
- [ ] Vérifier timing : ~5-10 min total
- [ ] S'assurer que tout est jouable sans admin

### Avant lundi 10h (rétro)
- [ ] Build Windows .exe final
- [ ] Tester sur le PC de la salle rétro
- [ ] Vérifier manettes branchées correctement
- [ ] Musique correctement intégrée

---

## 🎮 Énigmes Détaillées

### Énigme 1 - Géographie
```
Question : "Quel pays manque à sa famille?"
Contexte : Inde (parents), Colombie (mari), Pays-Bas (soeur), 
           Île Maurice (parents), France (elle)
Réponse : Cliquer sur drapeau Pays-Bas
Indice : "Un pays avec des moulins"
Feedback : "C'est ça! Sa soeur vit aux Pays-Bas!"
```

### Énigme 2 - Projet 1
```
Question : "Premier grand projet qu'elle a mené?"
Réponse : Taper "One Ad Conducteur"
Indice : "Publicité + Conducteur..."
Feedback : "Exact! One Ad Conducteur, un projet clé!"
```

### Énigme 3 - Projet 2
```
Question : "Autre projet majeur?"
Réponse : Taper "Le Décrochage"
Indice : "L'autre grand projet..."
Feedback : "Oui! Le Décrochage!"
```

### Énigme 4 - Karaoké
```
Question : "Sa passion secrète?"
Réponse : Cliquer sur le micro karaoké
Indice : "Elle adore chanter!"
Feedback : "Elle adore le karaoké!"
```

### Énigme 5 - Phrase
```
Question : "Phrase culte pour... des choses?"
Réponse : Trouver post-it "Briser les glaçons"
Indice : "Regardez les post-its!"
Feedback : "Briser les glaçons! La phrase parfaite!"
```

### Énigme 6 - Easter Egg
```
Question : "Mot 'interdit' qu'on adorait dire?"
Réponse : Découvrir "Bordel" écrit discrètement
Indice : "C'était 'interdit' en entreprise..."
Feedback : "BORDEL! 😄 Le mot qu'on n'était pas censé dire!"
```

---

## 💡 Tips de Développement

### Performance
- Utiliser **primitives Unity** (cubes, plans, sphères)
- **Pas d'animations complexes**, juste des clics
- Split-screen : utiliser des viewports cameras, pas des canvas séparés

### Multijoueur Local
```csharp
// Pseudo-code structure
for (int i = 0; i < 4; i++) {
    player[i].camera.rect = GetViewportForPlayer(i); // 2x2 split
    player[i].inputDevice = Gamepad.all[i];
}
```

### Énigmes
- Stocker état résolution dans `GameManager`
- Débloquer énigme suivante quand énigme actuelle = résolue
- Afficher feedback immédiat (textuel)

### Mur de Messages
- Parser JSON au démarrage Scène 3
- Générer dynamiquement TextMesh au spawn
- Layout : messages affichés en grille/colonnes sur le mur

---

## 🚀 Export Windows depuis Linux

```bash
# Dans Unity Editor (Fedora)
File → Build Settings
Platform: Windows
Architecture: x86_64
Scene: Bureau.unity (start scene)
Build → Créer .exe

# Result: jeu_adieu.exe (standalone, 0 dépendances)
```

**Aucun besoin d'admin sur le PC de la rétro!**

---

## 📝 Notes importantes

1. **Split-screen Mario Kart :** Chaque joueur voit son propre quart d'écran (caméra FPS indépendante)
2. **Coopératif :** Les 4 joueurs explorent ENSEMBLE, résolvent énigmes ensemble
3. **Énigmes simples :** Focus sur les références internes, pas sur la complexité
4. **Photos partout :** Crée une ambiance de "galerie de souvenirs"
5. **Mur final :** Le moment émouvant avec messages + couronne emoji
6. **Durée 5-10 min :** Icebreaker rapide avant la rétro, pas un jeu complet
7. **Timing lundi matin :** Avoir le .exe prêt + tester sur la salle

---

## 🎯 Objectif Final

**Un jeu mémorable que votre collègue gardera comme souvenir, jouable en multijoueur local sans aucune installation, avec:**
- ✅ Ses références personnelles intégrées
- ✅ Ses photos dans le décor
- ✅ Les messages de toute l'équipe
- ✅ Un moment émouvant
- ✅ Du fun + du cœur
- ✅ Jouable lundi en rétro

**Bonne chance! 🚀**
