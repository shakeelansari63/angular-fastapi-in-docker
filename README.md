# Angular Frontend with Python Fastapi Backend inside Docker with Nginx backend

This App uses Angular as frontend and Python's FastAPI as backend.  
Using Nginx as webserver for frontend and Reverse proxy for backend.  
This way, both frontend and backend can be accessed on same webserver.

No need to set the Backend url in frontend for http requests. It can be called as relative path from frontend.

## Routes

`http://localhost/*` - Goes to Frontend app  
`http://localhost/api/*` - Goes to Backend
