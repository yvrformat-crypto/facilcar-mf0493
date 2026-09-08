# ===============================================
# ETAPA 1: Construcción (Multi-stage build)
# Usamos una imagen ligera para instalar dependencias
# ===============================================
FROM php:8.2-cli-alpine AS builder

# Instalar herramientas necesarias para Composer (git, zip)
RUN apk add --no-cache git unzip libzip-dev

# Instalar extensión zip de PHP (requerida por Composer)
RUN docker-php-ext-install zip

# Instalar Composer globalmente copiándolo de su imagen oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Establecer directorio de trabajo para esta etapa
WORKDIR /app

# Copiar PRIMERO composer.json (y lock si existe)
# Esto optimiza la caché de Docker: solo se reinstalan
# dependencias si cambian estos archivos.
COPY composer.* ./

# Instalar dependencias de producción
# --no-dev: Excluye herramientas de testing/desarrollo
# --optimize-autoloader: Optimiza la clase autoloader para rendimiento
# --no-scripts: No ejecuta scripts automáticos por seguridad
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-scripts

# ===============================================
# ETAPA 2: Producción
# Imagen final optimizada para servir la web
# ===============================================
FROM php:8.3-apache

# 1. Instalar extensiones de sistema necesarias para PHP/MySQL
# apt-get es para Debian (bullseye). alpine usaría apk.
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. Instalar extensiones de PHP para MySQL
# pdo_mysql es la forma moderna y recomendada.
RUN docker-php-ext-install pdo pdo_mysql

# 3. Configurar Apache (Opcional pero recomendado)
# Habilitar mod_rewrite si usas URLs amigables (ej: frameworks)
RUN a2enmod rewrite

# 4. Establecer el directorio de trabajo predeterminado de Apache
WORKDIR /var/www/html

# 5. Copiar el código fuente de tu aplicación al contenedor
# Copiamos la carpeta src al directorio actual (.) que es /var/www/html
COPY . .

# 6. Copiar las dependencias instaladas en la Etapa 1
# Traemos la carpeta 'vendor' generada en el paso anterior.
COPY --from=builder /app/vendor ./vendor

# 7. Ajustar permisos
# Asegurar que Apache (usuario www-data) es dueño de los archivos
RUN chown -R www-data:www-data /var/www/html

# 8. Exponer el puerto 80
EXPOSE 80

# Apache se inicia automáticamente en esta imagen base, 
# no necesitamos un CMD explícito.