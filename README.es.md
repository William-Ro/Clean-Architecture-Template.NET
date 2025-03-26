# Plantilla de Arquitectura Limpia - .NET

Este repositorio proporciona una plantilla básica para iniciar un proyecto en **.NET 8** siguiendo los principios de **Arquitectura Limpia**. Es ideal para quienes buscan una estructura modular, escalable y bien organizada desde el principio.

[🇬🇧 Read in English](README.md)

## 📌 Características

- **Estructura basada en Arquitectura Limpia**
- **Separación por capas** para mantener el código modular y fácil de mantener:
  - `Dominio`: Entidades y lógica de negocio.
  - `Aplicación`: Casos de uso y reglas de negocio.
  - `Infraestructura`: Implementaciones externas como bases de datos y servicios.
  - `Presentación`: API Web con ASP.NET Core.
- **Incluye un `flake.nix`** para un entorno de desarrollo reproducible con Nix.
- **Fácil de extender y adaptar a diferentes proyectos.**

## 🚀 Cómo usar esta plantilla

### 📥 Clonar el repositorio

La forma más sencilla de comenzar es clonando este repositorio:

```sh
git clone https://github.com/William-Ro/Clean-Architecture-Template.NET
cd Clean-Architecture-Template.NET
```

Luego, puedes modificarlo según tus necesidades.

### 🔨 Crear un nuevo proyecto desde cero (alternativa a clonar el repositorio)

Si prefieres configurar el proyecto manualmente, sigue estos pasos:

```sh
mkdir MiNuevoProyecto
cd MiNuevoProyecto
mkdir src

dotnet new sln -n MiNuevoProyecto

cd src

dotnet new classlib -n Aplicacion
dotnet new classlib -n Dominio
dotnet new classlib -n Infraestructura
dotnet new webapi -n Presentacion --use-controllers

cd ..
dotnet sln add ./src/Aplicacion ./src/Dominio ./src/Infraestructura ./src/Presentacion

cd src
dotnet add Aplicacion reference Dominio
dotnet add Infraestructura reference Aplicacion
dotnet add Presentacion reference Aplicacion
dotnet add Presentacion reference Infraestructura
```

Esto generará una estructura idéntica a la del repositorio.

## 📂 Estructura del Proyecto

```
MiNuevoProyecto/
│── src/
│   ├── Aplicacion/          # Casos de uso y lógica de aplicación
│   ├── Dominio/             # Entidades y lógica de dominio
│   ├── Infraestructura/     # Persistencia, servicios externos, etc.
│   ├── Presentacion/        # API Web con ASP.NET Core
│── .gitignore
│── LICENSE
│── README.md
│── flake.nix                 # Configuración de DevShell con Nix
```

## 🛠️ Entorno de Desarrollo con Nix

Este proyecto incluye un **`flake.nix`** para gestionar las dependencias de desarrollo de forma reproducible.

### 📦 Requisitos

- Tener [Nix](https://nixos.org/download.html) instalado en tu sistema.

### 🔧 Activar el entorno de desarrollo

Ejecuta el siguiente comando:

```sh
nix develop
```

Esto instalará automáticamente:

- **.NET SDK 8**
- **Entity Framework (`dotnet-ef`)**
- **JetBrains Rider** (si está descomentado en `flake.nix` y `allowUnfree = true` está habilitado)

## 🏁 Ejecutar la API

Para ejecutar el servidor local, usa:

```sh
cd src/Presentacion
DOTNET_ENVIRONMENT=Development dotnet run
```

Por defecto, la API estará disponible en: **`http://localhost:5000/swagger/index.html`**

## 🏗️ Compilar y Publicar

Para compilar el proyecto:

```sh
dotnet build
```

Para publicar la aplicación:

```sh
dotnet publish -c Release -o ./publish
```

## 📜 Licencia

Este proyecto está bajo la licencia **MIT**. Puedes modificarlo y usarlo libremente en tus proyectos.

## 🤝 Contribuciones

Si tienes mejoras o sugerencias, ¡siéntete libre de **hacer un fork** y enviar un **pull request**! 😃
