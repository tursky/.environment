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

Specify your path to the directory with Manjaro profiles:

```
touch ~/.config/manjaro-tools/iso-profiles.conf
```

```
echo 'run_dir=/home/operator/.environment/manjaro/iso-profiles' >> ~/.config/manjaro-tools/iso-profiles.conf
```

Check if everything is ok. Print some info about it:

```
buildiso -q
```

```
buildiso -qv
```

```
buildiso -qf
```

To specify where to save the iso (if necessary), edit `manjaro-tools.conf`:

```
echo '
cache_dir=/home/operator/Downloads/' >> ~/.config/manjaro-tools/manjaro-tools.conf
```