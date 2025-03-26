# Clean Architecture Template - .NET

Este repositorio proporciona una plantilla básica para comenzar un proyecto en **.NET 8** siguiendo los principios de **Clean Architecture**. Es ideal para quienes desean una estructura modular, escalable y bien organizada desde el inicio.

## 📌 Características

- **Estructura basada en Clean Architecture**
- **Separación de capas** para mantener el código modular y mantenible:
  - `Domain`: Entidades y lógica de negocio.
  - `Application`: Casos de uso y reglas de negocio.
  - `Infrastructure`: Implementaciones externas como bases de datos y servicios.
  - `Presentation`: API Web con ASP.NET Core.
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

### 🔨 Crear un nuevo proyecto desde cero (alternativa a clonar el repo)

Si prefieres configurar el proyecto manualmente, sigue estos pasos:

```sh
mkdir MiNuevoProyecto
cd MiNuevoProyecto
mkdir src

dotnet new sln -n MiNuevoProyecto

cd src

dotnet new classlib -n Application
dotnet new classlib -n Domain
dotnet new classlib -n Infrastructure
dotnet new webapi -n Presentation --use-controllers

cd ..
dotnet sln add ./src/Application ./src/Domain ./src/Infrastructure ./src/Presentation

cd src
dotnet add Application reference Domain
dotnet add Infrastructure reference Application
dotnet add Presentation reference Application
dotnet add Presentation reference Infrastructure
```

Esto generará una estructura idéntica a la del repositorio.

## 📂 Estructura del proyecto

```
MiNuevoProyecto/
│── src/
│   ├── Application/          # Casos de uso y lógica de aplicación
│   ├── Domain/               # Entidades y lógica de dominio
│   ├── Infrastructure/       # Persistencia, servicios externos, etc.
│   ├── Presentation/         # API Web con ASP.NET Core
│── .gitignore
│── LICENSE
│── README.md
│── flake.nix                 # Configuración de DevShell con Nix
```

## 🛠️ Entorno de Desarrollo con Nix

Este proyecto incluye un **`flake.nix`** para gestionar dependencias de desarrollo de forma reproducible.

### 📦 Requisitos

- [Nix](https://nixos.org/download.html) instalado en tu sistema.

### 🔧 Activar el entorno de desarrollo

Ejecuta el siguiente comando:

```sh
nix develop
```

Esto instalará automáticamente:

- **.NET SDK 8**
- **Entity Framework (`dotnet-ef`)**
- **JetBrains Rider** (si está descomentado en `flake.nix` y tienes `allowUnfree = true` habilitado)

## 🏁 Ejecutar la API

Para correr el servidor localmente, usa:

```sh
cd src/Presentation
DOTNET_ENVIRONMENT=Development dotnet run
```

Por defecto, la API estará disponible en: **`http://localhost:5000/swagger/index.html`**

## 🏗️ Construcción y publicación

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

Si tienes mejoras o sugerencias, ¡siéntete libre de hacer un **fork** y enviar un **pull request**! 😃
