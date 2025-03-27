# Clean Architecture Template - .NET

This repository provides a basic template to start a project in **.NET 8** following **Clean Architecture** principles. It is ideal for those who want a modular, scalable, and well-organized structure from the beginning.

[Leer en Español](README.es.md)

## 📌 Features

- **Clean Architecture-based structure**
- **Layer separation** to keep the code modular and maintainable:
  - `Domain`: Entities and business logic.
  - `Application`: Use cases and business rules.
  - `Infrastructure`: External implementations such as databases and services.
  - `Presentation`: Web API with ASP.NET Core.
- **Includes a `flake.nix`** for a reproducible development environment with Nix.
- **Easy to extend and adapt to different projects.**

## 🚀 How to use this template

### 📥 Clone the repository

The easiest way to start is by cloning this repository:

```sh
git clone https://github.com/William-Ro/clean-architecture-template
cd clean-architecture-template
```

Then, you can modify it according to your needs.

### 🔨 Create a new project from scratch (alternative to cloning the repo)

If you prefer to set up the project manually, follow these steps:

```sh
mkdir MyNewProject
cd MyNewProject
mkdir src

dotnet new sln -n MyNewProject

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

This will generate an identical structure to the repository.

## 📂 Project Structure

```
MyNewProject/
│── src/
│   ├── Application/          # Use cases and application logic
│   ├── Domain/               # Entities and domain logic
│   ├── Infrastructure/       # Persistence, external services, etc.
│   ├── Presentation/         # Web API with ASP.NET Core
│── .gitignore
│── LICENSE
│── README.md
│── flake.nix                 # DevShell configuration with Nix
```

## 🛠️ Development Environment with Nix

This project includes a **`flake.nix`** to manage development dependencies reproducibly.

### 📦 Requirements

- [Nix](https://nixos.org/download.html) installed on your system.

### 🔧 Activate the development environment

Run the following command:

```sh
nix develop
```

This will automatically install:

- **.NET SDK 8**
- **Entity Framework (`dotnet-ef`)**
- **JetBrains Rider** (if uncommented in `flake.nix` and `allowUnfree = true` is enabled)

## 🏁 Run the API

To run the local server, use:

```sh
cd src/Presentation
DOTNET_ENVIRONMENT=Development dotnet run
```

By default, the API will be available at: **`http://localhost:5000/swagger/index.html`**

## 🏗️ Build and Publish

To compile the project:

```sh
dotnet build
```

To publish the application:

```sh
dotnet publish -c Release -o ./publish
```

## 📜 License

This project is under the **MIT** license. You can modify and use it freely in your projects.

## 🤝 Contributions

If you have improvements or suggestions, feel free to **fork** and submit a **pull request**! 😃
