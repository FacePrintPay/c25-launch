#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
echo "🚀 Sovereign AI Protocol v1 — Launch Sequence"
echo "   Ensuring clean state..."
# Kill old servers
pkill -f "http.server" 2>/dev/null || true
# Ensure build dir exists
mkdir -p ~/sovereign/build
# Create minimal index.html if missing
if [ ! -f ~/sovereign/build/index.html ]; then
  cat > ~/sovereign/build/index.html << 'HTML'
<!DOCTYPE html>
<html>
<head>
  <title>Sovereign AI Protocol</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>body{background:#000;color:#0f0;font-family:monospace;padding:20px}</style>
</head>
<body>
  <h1>🌌 Sovereign AI Protocol v1</h1>
  <p>✅ Live from Termux • BioAuth Secured • Agent-Driven</p>
  <p>Built by Cygel White (#MrGGTP) • AiMetaverse.cloud</p>
</body>
</html>
HTML
fi
# Start server in background
cd ~/sovereign/build
python -m http.server 8081 > /dev/null 2>&1 &
echo "✅ Local server running on :8081"
# Launch Cloudflare Tunnel
echo "🌐 Launching Cloudflare Tunnel..."
cloudflared tunnel --url http://localhost:8081
