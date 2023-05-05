# Compile OS ISO image step by step

Link: [Build Manjaro ISOs with buildiso](https://wiki.manjaro.org/index.php/Build_Manjaro_ISOs_with_buildiso#Adding_AUR_packages)

> The task is to build prototype distr based on Manjaro Linux.

Install Manjaro Tools

```
pamac install manjaro-tools-iso
```

Copy `manjaro-tools` settings to your home `.config`:

```
cp -R /etc/manjaro-tools  ~/.config
```

Download the latest ISO profiles anywhere in your `home` catalog:

```
git clone https://gitlab.manjaro.org/profiles-and-settings/iso-profiles.git ~/.environment/application/iso-profiles
```

Specify your path to the directory with Manjaro profiles:

```
touch ~/.config/manjaro-tools/iso-profiles.conf
echo 'run_dir=/home/operator/.environment/application/iso-profiles' >> ~/.config/manjaro-tools/iso-profiles.conf
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

---

Build command:

```
buildiso -p xfce
```

If you did not change the paths in `manjaro-tools.conf` the resulting xfce ISO is stored at `/var/cache/manjaro-tools/iso/community/xfce`

Preparations for creating an ISO image are now complete. Go to `iso-profile`:

```
cd ~/.environment/application/iso-profiles
```

---

Let's continue building the environment with XFCE. This is a test project, let's remove the unnecessary from the catalog so as not to distract.

```
rm -rf .gitignore README.md oem community
cd manjaro && rm -rf !(*xfce) && cd ..
```

The next step is to create a `skel` directory with personal data and configuration files. All files and folders in the `skel` directory will be copied to the user's home catalog.

```
mkdir manjaro/xfce/desktop-overlay/etc/skel
```

After creating the `skel` dir, copy all the necessary settings files into it:

```
cp -r ../../workspace/skel/global manjaro/xfce/desktop-overlay/etc/skel
cp -r ../../workspace/skel/glocal/unix manjaro/xfce/desktop-overlay/etc/skel
```

```
echo '
# User settings
autologin="true"
multilib="true"
extra="true"
hostname="unix"
username="operator"
' >> ~/.environment/application/iso-profiles/manjaro/xfce/profile.conf
```

```
echo '
# User settings
target_branch=stable
kernel="linux61"
chroots_dir=/home/operator/Downloads/
' >> ~/.config/manjaro-tools/manjaro-tools.conf
```

Define what software is needed and edit `Packages-Desktop`. Editing already present packages is risky:

- `extra` packages will be installed in the `full` build, others in a `minimal` build
- `-f` use if you want to compile `full` image
- `-b` specify a branch, for example `stable`
- `-k` specify the version of the Linux `kernel`
- `-t` specify where to save `iso`

Building the `Manjaro ISO` image can be run with the `buildiso -p` command, specifying the working environment, in our case `xfce`:

Minimal build:

```
buildiso -p xfce -k linux61 -b stable
```

Full build:

```
buildiso -f -p xfce -k linux61 -b stable -t /home/operator/Downloads
```

The build process will take some time. It depends on the computer configuration and internet speed.

When rebuilding, but with different parameters, it will be need to remove some files from the previous build:

```
sudo rm -r /var/lib/manjaro-tools/buildiso/
sudo rm -r /var/cache/manjaro-tools/
```

```
sudo rm -r ~/.config/manjaro-tools
```

## Inject AUR packets into build

Link: [Buildiso with AUR packages](https://wiki.manjaro.org/index.php/Buildiso_with_AUR_packages:_Using_buildpkg)

```
# Create directory for online repo
mkdir pkg && cd pkg && mkdir -p aur-repo/x86_64

# Create a catalog to build the packets 
mkdir pkgbuild && cd pkgbuild

# Clone packet from AUR 
git clone https://aur.archlinux.org/vscodium-bin.git

# Set prerequisites
sudo pacman -S manjaro-tools-pkg-git

# Building with buildpkg
buildpkg -p vscodium-bin

# Copy packet to repo catalog
cd .. && cd aur-repo
sudo mv /var/cache/manjaro-tools/pkg/stable/x86_64 .

# Generate package database
cd x86_64
repo-add aur-repo.db.tar.gz *.pkg.tar.* 
```

Upload the AUR repo to GitHub, for example:

```
https://tursky.github.io/aur-repo/x86_64/
```

Implement an online repository with recompiled packages:

`user-repos.conf` at `iso-profiles/manjaro/xfce`:

```
[aur-repo]
SigLevel = Never
Server = https://tursky.github.io/$repo/$arch
```

Add packet to `Packages-Desktop`:

```
echo '
## AUR packets
vscodium-bin' >> ~/.environment/application/iso-profiles/manjaro/xfce/Packages-Desktop
```

Cleaning build environment:

```
 sudo rm -r /var/lib/manjaro-tools/buildpkg 
```

---

If to rename the `xfce` directory to `prototype`, for example, then this must be specified during compilation:

```
buildiso -f -p prototype -k linux61 -b stable -t /home/operator/Downloads
```

Or change default settings in `manjaro-tools`:

```
cd ~/.config/manjaro-tools/iso.list.d && ls -a
```

---

To create a bootable USB flash drive, there are built-in tools:


Find where the flash driver is mounted:
```
sudo fdisk -l
```

`/sdc` or `/sdb` is the target flash drive:

```
sudo dd bs=4M if=/home/operator/Downloads/manjaro/xfce/22.1.0/manjaro-prototype-22.1.0-230501-linux61.iso of=/dev/sdb status=progress oflag=sync
```