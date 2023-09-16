# Run Backend App
cd /api && uvicorn app:app --host 0.0.0.0 --port 8081 &
PS1=$!

# Run Frontend App
cd /app && serve -s dist -l 8080 &
PS2=$!

# Start Nginx
nginx -g 'daemon off;' &
PS3=$!

# Wait for all 3 processes
wait $PS1 $PS2 $PS3