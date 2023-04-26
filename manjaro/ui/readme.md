# XFCE desktop environment personal settings

1. [Windows XFCE](#windows-xfce)
2. [Night XFCE](#night-xfce)
3. [Default XFCE](#default-xfce)
4. [Stylesheets presets](#stylesheets-presets)
5. [Console color palette and geometry](#console-color-palette-and-geometry)
6. [Keyboard shortcuts](#keyboard-shortcuts)
7. [Patches](#patches)
8. [Application menu](#application-menu)

---

# Terminal view

![](show/console.png)

---

## Windows XFCE
> professoinal

![](minimal/windows/desktop.png)
![](minimal/windows/explorer.png)
![](minimal/windows/menu.png)
![](minimal/windows/menu-find.png)
![](minimal/windows/menu-exit.png)
![](minimal/windows/notification.png)
![](minimal/windows/program.png)
![](minimal/windows/program-switcher.png)
![](minimal/windows/program-settings.png)
![](minimal/windows/program-office-mousepad.png)
![](minimal/windows/program-office-onlyoffice.png)
![](minimal/windows/program-office-onlyoffice-doc.png)
![](minimal/windows/program-freecad.png)
![](minimal/windows/program-freecad-app.png)
![](minimal/windows/program-kicad-connector.png)
![](minimal/windows/program-kicad-oscillator.png)
![](minimal/windows/program-vlc.png)
![](minimal/windows/terminal.png)
![](minimal/windows/terminal-htop.png)
![](minimal/windows/terminal-screenfetch.png)
![](minimal/windows/xfce.png)

---

## Night XFCE

![](show/night/desktop.png)

![](show/night/explorer.png)

![](show/night/menu.png)

![](show/night/menu-dirs.png)

![](show/night/menu-exit.png)

![](show/night/menu-find.png)

![](show/night/notification.png)

![](show/night/program.png)

![](show/night/program-freecad.png)

![](show/night/program-freecad-app.png)

![](show/night/terminal.png)

![](show/night/terminal-htop.png)

![](show/night/terminal-screenfetch.png)

![](show/night/xfce.png)

---

## Default XFCE

![](show/default/desktop.png)

![](show/default/workspace.png)

---

## Stylesheets presets

```
touch ~/.config/gtk-3.0/gtk.css
```

> Remove XFCE specific dotted UI artifacts:

```
echo "/* Remove dotted lines from GTK 3 applications */
undershoot.top, undershoot.right, undershoot.bottom, undershoot.left {
	background-image: none;
}" >> ~/.config/gtk-3.0/gtk.css
```

> Add indentations to console:
```
echo "/* Console stylesheets */
VteTerminal, vte-terminal {
	padding: 7px;
}" >> ~/.config/gtk-3.0/gtk.css
```

## Console color palette and geometry

```
echo "export PS1='\[\033[01;32m\]➞\[\033[00m\] '" >> ~/.bashrc
```

- [x] Source Code Pro Regular, 15px
- [x] 1.05 line spacing
- [x] 65 width
- [x] 17 height

```
- Body colors
  background: "#141A1B"
  foreground: "#B3B1AD"

- Normal colors
  black: "#01060E"
  red: "#EA6C73"
  green: "#00AA00"
  yellow: "#F9AF4F"
  blue: "#53BDFA"
  magenta: "#FF79C6"
  cyan: "#90E1C6"
  white: "#C7C7C7"

- Bright colors
  black: "#686868"
  red: "#F07178"
  green: "#C2D94C"
  yellow: "#FFB454"
  blue: "#59C2FF"
  magenta: "#FF92DF"
  cyan: "#95E6CB"
  white: "#FFFFFF"
```

## Keyboard shortcuts

Show desktop: `Ctrl` + `Alt` + `d`
Resize window: `Alt` + `Right click` + `Move`


## Patches

Add a patch that removes the borders and roundings that prevent the window from filling the workspace in full screen mode:

```
mkdir -p ~/.themes/Matcha-sea/xfwm4
cd .themes/Matcha-sea/xfwm4
cp /usr/share/themes/Matcha-sea/xfwm4/* .
rm left*
rm right*
rm bottom*
rm top*
```

## Application menu

To edit menu layout:

```
mkdir ~/.config/menus
cd ~/.config/menus
cp /etc/xdg/menus/xfce-applications.menu .
ls -a
```