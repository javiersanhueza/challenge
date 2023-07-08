# README

## Instalación

### Instalar dependencias
```
bundle install
```
### Inicializar la base de datos
```
rails db:create db:migrate db:seed
```

### Crear archivo .env en la raíz del proyecto
Para definir las variables de conexión a la base de datos

```
DATABASE_USERNAME=name
DATABASE_PASSWORD=password
DATABASE_HOST=localhost
DATABASE_PORT=port
```

### Levantar el servidor
```
rails server
```
Esto levantará la API en localhost:8080
