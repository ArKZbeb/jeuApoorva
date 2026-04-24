#!/bin/bash
# Checklist pré-lancement - Vérifier que tout est OK

echo "🔍 CHECKLIST PRÉ-LANCEMENT - JEU GODOT"
echo "========================================"
echo ""

# Vérifier les fichiers principaux
echo "1️⃣ Vérification des fichiers..."
files=(
    "project.godot"
    "scenes/menu.tscn"
    "scenes/bureau.tscn"
    "scenes/salle_aventures.tscn"
    "scenes/mur_messages.tscn"
    "assets/data/message.json"
    "assets/data/enigmes.json"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ MANQUANT: $file"
    fi
done

echo ""
echo "2️⃣ Vérification des scripts..."
scripts=(
    "scripts/input_manager.gd"
    "scripts/player_controller.gd"
    "scripts/camera_manager.gd"
    "scripts/game_manager.gd"
    "scripts/ui_manager.gd"
    "scripts/message_parser.gd"
    "scripts/menu.gd"
    "scripts/bureau.gd"
    "scripts/salle_aventures.gd"
    "scripts/mur_messages.gd"
)

for script in "${scripts[@]}"; do
    if [ -f "$script" ]; then
        echo "  ✅ $script"
    else
        echo "  ❌ MANQUANT: $script"
    fi
done

echo ""
echo "3️⃣ Vérification des assets..."
# Compter les images
image_count=$(find "assets/images" -type f 2>/dev/null | wc -l)
echo "  📷 Images: $image_count fichiers trouvés"

# Vérifier la musique
if [ -f "assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3" ]; then
    echo "  🎵 Musique: ✅ OK"
else
    echo "  🎵 Musique: ❌ NON TROUVÉE"
fi

echo ""
echo "4️⃣ Vérification JSON..."
# Vérifier message.json
if grep -q '"messages"' "assets/data/message.json"; then
    echo "  ✅ message.json: Structure OK"
else
    echo "  ❌ message.json: Structure invalide"
fi

# Vérifier enigmes.json
if grep -q '"enigmes"' "assets/data/enigmes.json"; then
    echo "  ✅ enigmes.json: Structure OK"
else
    echo "  ❌ enigmes.json: Structure invalide"
fi

echo ""
echo "========================================"
echo "✨ CHECKLIST COMPLÈTE!"
echo "🚀 Prêt à lancer le jeu?"
echo ""
echo "Commandes:"
echo "  - F5 pour lancer depuis Godot"
echo "  - Ou appuyer le bouton 'Play' en haut"
echo ""
