# Dockerfile para TaskMaster (solo backend Django)
FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app

# Instalar dependencias del sistema
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev gcc curl && \
    rm -rf /var/lib/apt/lists/*

# Copiar y preparar el backend
COPY requirements.txt ./requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . .

# Copiar el build del frontend al directorio estático de Django
# (Asegúrate de construir el frontend antes de construir esta imagen)
COPY ../frontend/build ./static/

# Variables de entorno para Django
ENV DJANGO_SETTINGS_MODULE=config.settings

# Exponer el puerto
EXPOSE 8000

# Comando por defecto: usar Gunicorn para producción
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
