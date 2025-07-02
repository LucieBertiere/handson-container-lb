FROM nginx:alpine

# port à exposer pour accéder à l'application
EXPOSE 80

# on installe les outils nécessaire à la construction et à l'exécution
RUN apk add nodejs npm

# on se place dans un dossier de travail et on y copie tout le code de l'application
WORKDIR /app
COPY frontend/ .

# On construit l'application et on la déplace dans le bon dossier pour nginx
RUN npm install && \
    npm run build
RUN cp -r dist/* /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
