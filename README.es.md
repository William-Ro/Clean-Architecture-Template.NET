# Plantilla de Arquitectura Limpia - .NET

Este repositorio proporciona una plantilla básica para comenzar un proyecto en **.NET 8** siguiendo los principios de **Clean Architecture**. Es ideal para quienes desean una estructura modular, escalable y bien organizada desde el inicio.

[Read in English](README.md)

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

```sh
git clone https://github.com/William-Ro/Clean-Architecture-Template.NET
cd Clean-Architecture-Template.NET
```

Luego, puedes modificarlo según tus necesidades.

### 🔨 Crear un nuevo proyecto desde cero

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

## 📜 Licencia

Este proyecto está bajo la licencia **MIT**. Puedes modificarlo y usarlo libremente en tus proyectos.

## 🤝 Contribuciones

Si tienes mejoras o sugerencias, ¡haz un **fork** y envía un **pull request**! 😃
