#!/data/data/com.termux/files/usr/bin/bash
# netsecurepro_camera_launcher.sh

echo "[NetSecurePro IA] 🔍 Détection du constructeur..."
BRAND=$(getprop ro.product.brand | tr '[:upper:]' '[:lower:]')

echo "🛠️ Appareil détecté : $BRAND"

if [[ "$BRAND" == "samsung" ]]; then
    echo "📷 Lancement de la caméra Samsung..."
    am start -n com.sec.android.app.camera/.Camera
elif [[ "$BRAND" == "motorola" ]]; then
    echo "📷 Lancement de la caméra Motorola..."
    am start -n com.motorola.camera/.Camera
else
    echo "⚠️ Marque non reconnue, utilisation de l’intent générique..."
    am start -a android.media.action.IMAGE_CAPTURE
fi
