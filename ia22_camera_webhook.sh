#!/data/data/com.termux/files/usr/bin/bash
# ia22_camera_webhook.sh — Webhook distant IA22 Camera Controller

PORT=8080
echo "📡 Démarrage du serveur webhook sur le port $PORT..."
while true; do
  REQ=$(nc -l -p $PORT)
  case "$REQ" in
    *action=photo*)   am start -a android.media.action.IMAGE_CAPTURE ;;
    *action=video*)   am start -a android.media.action.VIDEO_CAPTURE ;;
    *action=rear*)    am start -n com.sec.android.app.camera/.Camera ;;
    *action=front*)   am start -a android.media.action.IMAGE_CAPTURE --ez android.intent.extra.USE_FRONT_CAMERA true ;;
    *) echo "❓ Action non reconnue : $REQ" ;;
  esac
done
