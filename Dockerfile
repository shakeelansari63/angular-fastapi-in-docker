FROM nginx:1.25-alpine-slim

# Install Python and Node
RUN apk add --no-cache python3 py3-pip nodejs npm parallel

# Create App Folder for Frontend
RUN mkdir -p /app

# Create Api Folder for Backend
RUN mkdir -p /api

# Copy Frontend Code
COPY frontend/ /app/

# Copy Backend Code
COPY backend/ /api/

# Install dependencies and build Frontend App
WORKDIR /app
RUN npm ci --silent
RUN npm run prodBuild
RUN npm install -g serve

# Install dependencies for Backend App
RUN pip install --no-cache-dir --upgrade -r /api/requirements.txt

# Copy NginX Config File
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the Run App Script
COPY run-app.sh /
RUN chmod a+x /run-app.sh

# Run Script
CMD ["/run-app.sh"]