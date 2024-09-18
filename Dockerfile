# Utilise l'image de base Debian de Yolks de Pterodactyl
FROM ghcr.io/pterodactyl/yolks:debian

# Définit l'utilisateur root pour installer des paquets
USER root

# Met à jour les paquets et installe Nginx
RUN apt-get update -y && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Crée les répertoires nécessaires pour Pterodactyl
RUN mkdir -p /home/container

# Définit le répertoire de travail
WORKDIR /home/container

# Copie votre configuration Nginx personnalisée si nécessaire
# COPY default.conf /etc/nginx/conf.d/default.conf

# Change les permissions pour l'utilisateur non privilégié
RUN chown -R container:container /home/container

# Repasser à l'utilisateur non privilégié
USER container

# Commande par défaut pour démarrer Nginx (sera remplacée par la commande de démarrage de Pterodactyl)
CMD ["/bin/bash", "-c", "echo 'Container started' && sleep infinity"]
