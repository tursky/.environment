# Compile UNIX-like OS step by step

> The task is to build a prototype distr based on Manjaro Linux.

1. Install Manjaro Tools

```
pamac install manjaro-tools-iso
```

Copy `manjaro-tools` settings to your home `.config`:

```
cp -R /etc/manjaro-tools  ~/.config
```

Download the latest ISO profiles anywhere in your `home` catalog:

```
git clone https://gitlab.manjaro.org/profiles-and-settings/iso-profiles.git ~/.environment/manjaro/iso-profiles
```