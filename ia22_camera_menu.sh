#!/data/data/com.termux/files/usr/bin/bash
# ia22_camera_menu.sh — Menu de contrôle distant IA22 Camera

clear
echo "========================================"
echo "   NetSecurePro IA22 Camera Controller"
echo "========================================"
echo "1) Ouvrir la caméra arrière"
echo "2) Ouvrir la caméra avant"
echo "3) Prendre une photo (IMAGE_CAPTURE)"
echo "4) Lancer l’enregistrement vidéo"
echo "5) Arrêter l’enregistrement vidéo"
echo "6) Quitter"
echo "========================================"
read -p "Choix [1-6] : " CHOICE

case $CHOICE in
  1)
    echo "📷 Ouverture caméra arrière..."
    am start -a android.intent.action.MAIN \
             -c android.intent.category.LAUNCHER \
             -n com.sec.android.app.camera/.Camera
    ;;
  2)
    echo "🤳 Ouverture caméra avant..."
    am start -a android.intent.action.VIEW \
             -d "android.media.action.IMAGE_CAPTURE" \
             --ez android.intent.extra.USE_FRONT_CAMERA true
    ;;
  3)
    echo "📸 Capture photo..."
    am start -a android.media.action.IMAGE_CAPTURE
    ;;
  4)
    echo "🎥 Démarrage enregistrement vidéo..."
    am start -a android.media.action.VIDEO_CAPTURE
    ;;
  5)
    echo "⏹️ Tentative d’arrêt de l’enregistrement (stopService)..."
    PKG="com.sec.android.app.camera"
    PID=$(pidof $PKG)
    if [ -n "$PID" ]; then
      kill -SIGINT $PID && echo "✅ Enregistrement arrêté."
    else
      echo "⚠️ Aucun processus caméra trouvé."
    fi
    ;;
  6)
    echo "🚪 Sortie..."
    exit 0
    ;;
  *)
    echo "❌ Choix invalide."
    ;;
esac
