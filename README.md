# 🚀 My Nix Packages For Themeing(Mono Repo)

Welcome to my personal **Nix flake mono repository**!  
This repo contains multiple custom Nix packages & derivations that I maintain and use across my systems.

## ⚠️ Disclaimer about `hyprscroller`

> **Important:**  
> The `hyprscroller` package in this repo currently **does not work properly**.  
> Please use the original maintained version here instead:  
> [https://github.com/cpiber/hyprscroller](https://github.com/cpiber/hyprscroller)

---

## 🔧 Included Packages

| Package                   | Description                                          | Status                                            | Repo / Docs                                        |
|---------------------------|------------------------------------------------------|---------------------------------------------------|---------------------------------------------------|
| 🎨 **catppuccin-icons**        | Beautiful Catppuccin icon theme                       | ![Stable](https://img.shields.io/badge/status-stable-brightgreen) | [GitHub](https://github.com/maotseantonio/catppuccin-icons)       |
| 🖱️ **kureiji-ollie-cursors**  | Custom Kureiji Ollie cursor theme                     | ![Stable](https://img.shields.io/badge/status-stable-brightgreen) | [GitHub](https://github.com/maotseantonio/Kureiji-Ollie-Cursors)  |
| 💻 **hyprscroller**            | Hyprland layout plugin — smooth scrolling layouts     | ![Beta](https://img.shields.io/badge/status-beta-yellow)         | [GitHub](https://github.com/maotseantonio/hyprscroller)           |
| 🔥 **sddm-stray**              | SDDM tray and theme helper                           | ![Alpha](https://img.shields.io/badge/status-alpha-red)          | [GitHub](https://github.com/maotseantonio/sddm-stray-flakes)      |
| 📟 **rxfetch**                 | Fast, minimal system fetch with style                | ![Beta](https://img.shields.io/badge/status-beta-yellow)         | [GitHub](https://github.com/mngshm/rxfetch.git)                |
| 🌿 **nitch**                   | Minimal Nix-based system information fetch tool      | ![Stable](https://img.shields.io/badge/status-stable-brightgreen) | [GitHub](https://github.com/ssleert/nitch.git)                  |

---
## 🖼️ Showcase (Rice Photos)

### Catppuccin Icons  
![Catppuccin Icons Rice](./assets/main.svg)

### Kureiji Ollie Cursors  
![Kureiji Ollie Cursor Rice](./assets/preview3.gif)

### sddm-stray-theme  
![sddm stray theme](./assets/preview.gif)

### nitch 
![nitch](./assets/nitch.png)

### rxfetch
![rxfetch](./assets/rxfetch.png)

---

## 📦 Usage

Add this mono repo as a flake input to your own `flake.nix` and packages as `config.nix`:

```nix
inputs.shizuruPkgs.url = "github:maotseantonio/shizuruPkgs";

{
  environment.systemPackages = with pkgs; [
    inputs.shizuruPkgs.packages.${pkgs.system}.catppuccin-icons
    inputs.shizuruPkgs.packages.${pkgs.system}.kureiji-ollie-cursors
    inputs.shizuruPkgs.packages.${pkgs.system}.sddm-stray
  ];
}
```
---

## 🎖️ Credits

Thanks to these amazing projects and contributors for inspiration and code. The kofi link is not mine for the original creator:

- **Catppuccin Icons** by [ljmill](https://github.com/ljmill/catppuccin-icons)  
- **sddm-stray** by [Bqrry4](https://github.com/Bqrry4/sddm-stray)  
- **Kureiji Ollie Cursor** supported via [Ko-fi](https://ko-fi.com/s/0f16e071d4)  
