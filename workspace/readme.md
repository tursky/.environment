# Workspace environment

- Windows XFCE Professional
- Mac XFCE Industrial

## Usage

1. Put the `.workspace` catalog to the `User` home directory your `UNIX`-like OS with `xfce` GUI.
2. Add the `make.sh` script to the global scope:

```
echo "
# Environment presets
alias workspace='~/.workspace/make.sh'" >> ~/.bashrc
```

3. Enter `workspace` in the terminal to initiate a dialogue with the machine. Follow the instructions.

> Be careful because this directive will delete your current configuration files. Please see the contents of the executable file.

4. The computer will restart. After that, call the console again and ask your computing machine for the name of the installed env:

```
echo $ui
```

---

Tested on a machine with **Manjaro OS**. The entire responsibility lies with the **UNIX** operator.

## Note
Config file has been removed from `git` watch:

```
git update-index --assume-unchanged workspace/config
```

```
git update-index --no-assume-unchanged workspace/config
```