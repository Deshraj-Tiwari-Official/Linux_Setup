# Powerhouse Distro Setup Guide

Welcome to the **Powerhouse Distro Setup Guide**! 🚀
This guide will help you set up **any Linux distro** with a fully customized development environment. Follow the steps below, and your system will be ready for hardcore development in no time.

> [!NOTE]
> To paste commands in the terminal, use `Ctrl+Shift+V`.

---

## Step 1: Install Your Linux Distro

1. Download the ISO of your preferred distro from its official website:

   * **Fedora Workstation**: [getfedora.org](https://getfedora.org/)
   * **Arch Linux**: [archlinux.org](https://archlinux.org/)
   * Others: check your distro’s official site.
2. Create a bootable USB drive using tools like **Rufus, Etcher, Ventoy** (Ventoy is recommended).
3. Boot from the USB drive and follow the installation instructions.

   > ⚠️ Note: Some distros may require a temporary internet connection during installation (USB tethering works if Wi-Fi drivers aren’t available yet).

---

## Step 2: Optimize Your Package Manager

Make package downloads faster by tweaking your distro’s package manager configuration:

**Examples:**

* **Fedora (DNF)**

```bash
sudo nano /etc/dnf/dnf.conf
```

Add at the end:

```
max_parallel_downloads=7
fastestmirror=True
```

* **Arch (Pacman)**

```bash
sudo nano /etc/pacman.conf
```

Uncomment or add:

```
ParallelDownloads = 5
```

---

## Step 3: Update Your System

After installation, make sure your system has the latest packages:

**Fedora:**

```bash
sudo dnf update -y
```

**Arch:**

```bash
sudo pacman -Syu
```

> ✅ General tip: Always update first before installing other software.

---

## Step 4: Enable Extra Repositories (Optional)

Some packages require additional repos:

**Fedora (RPM Fusion Free & Non-Free):**

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

**Arch (Multilib & AUR helper example):**

```bash
sudo nano /etc/pacman.conf
# Uncomment [multilib] section and update
sudo pacman -Syu
# Optional: Install yay for AUR packages
sudo pacman -S yay
```

---

## Step 5: Set Up Wi-Fi / Network

Some distros don’t include drivers out-of-the-box. Here’s the general approach:

1. **Identify your network hardware:**

```bash
lspci | grep -i network
```

2. **Install the driver** using your package manager:

**Fedora example:**

```bash
sudo dnf install broadcom-wl
sudo modprobe wl
```

**Arch example:**

```bash
sudo pacman -S broadcom-wl-dkms
sudo modprobe wl
```

3. **Connect to Wi-Fi** via your desktop environment’s network menu (GNOME, KDE, etc.).

---

## Step 6: Clone Your Dotfiles Repository

Set up your development environment by cloning your dotfiles:

```bash
git clone https://github.com/Deshraj-Tiwari-Official/Linux_Setup.git ~/dotfiles
```

---

## Step 7: Run the Setup Script

Make all shell scripts executable and run the main setup script:

```bash
find ~/dotfiles -type f -name "*.sh" -exec chmod +x {} +
~/dotfiles/install.sh
```

> 📌 Read the script output carefully and follow any instructions to complete your setup.

---

## Optional Tips for Any Distro

* Install build tools:

```bash
# Fedora
sudo dnf groupinstall "Development Tools" -y
# Arch
sudo pacman -S base-devel
```

* Install Git, curl, wget, and other essentials:

```bash
# Fedora
sudo dnf install git curl wget -y
# Arch
sudo pacman -S git curl wget
```
