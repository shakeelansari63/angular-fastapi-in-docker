# Run Backend App
cd /api && uvicorn app:app --host 0.0.0.0 --port 8081 &
P1=$!

# Start Nginx
nginx -g 'daemon off;' &
P2=$!

# Wait till any process is killed abruptly
while true
do
    if ls /proc/$P1/exe > /dev/null 2>/dev/null && ls /proc/$P2/exe > /dev/null 2>/dev/null
    then
        sleep 10
    else
        exit 1
    fi
done