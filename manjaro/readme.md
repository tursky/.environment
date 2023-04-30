# Compile UNIX-like OS step by step

> The task is to build a prototype distr based on Manjaro Linux.

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
chroots_dir=/home/operator/Downloads/' >> ~/.config/manjaro-tools/manjaro-tools.conf
```

> You can skip this step

---

Build command:

```
buildiso -p xfce
```

If you did not change the paths in `manjaro-tools.conf` the resulting xfce ISO is stored at `/var/cache/manjaro-tools/iso/community/xfce`

Preparations for creating an ISO image are now complete. Go to `iso-profile`:

```
cd ~/.environment/manjaro/iso-profiles
```

---

Let's continue. We will build with XFCE environment. This is a test project, let's remove the unnecessary from the catalog so as not to distract.

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
cp -r ../ui/.workspace/win/skel manjaro/xfce/desktop-overlay/etc/skel
```

```
echo '
# User settings
autologin="true"
multilib="true"
extra="true"
hostname="unix"
username="operator"
' >> ~/.environment/manjaro/iso-profiles/manjaro/xfce/profile.conf
```

```
echo '
# User settings
target_branch=stable
kernel="linux61"
chroots_dir=/home/operator/Downloads/
' >> ~/.config/manjaro-tools/manjaro-tools.conf
```