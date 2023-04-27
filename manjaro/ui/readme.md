# XFCE desktop environment personal settings

1. [Windows XFCE](#windows-xfce)
2. [Mac XFCE](#mac-xfce)
3. [Default XFCE](#default-xfce)
4. [Stylesheets presets](#stylesheets-presets)
5. [Console color palette and geometry](#console-color-palette-and-geometry)
6. [Keyboard shortcuts](#keyboard-shortcuts)
7. [Patches](#patches)
8. [Application menu](#application-menu)

---

# Terminal view

![](minimal/console.png)

---

## Windows XFCE
> professional

![](minimal/windows/desktop.png)

**Explorer**
![](minimal/windows/explorer.png)

**Menu**
![](minimal/windows/menu.png)

**App finder**
![](minimal/windows/menu-find.png)

**Exit menu**
![](minimal/windows/menu-exit.png)

**Notifications**
![](minimal/windows/notification.png)

**Programms**
![](minimal/windows/program.png)

**Window switcher**
![](minimal/windows/program-switcher.png)

**System settings**
![](minimal/windows/program-settings.png)

**Notes**
![](minimal/windows/program-office-mousepad.png)

**Start Office**
![](minimal/windows/program-office-onlyoffice.png)

**Office document**
![](minimal/windows/program-office-onlyoffice-doc.png)

**Start FreeCAD (dark theme)**
![](minimal/windows/program-freecad.png)

**FreeCAD project**
![](minimal/windows/program-freecad-app.png)

**KiCad - connector**
![](minimal/windows/program-kicad-connector.png)

**KiCad - oscillator**
![](minimal/windows/program-kicad-oscillator.png)

**Multimedia**
![](minimal/windows/program-vlc.png)

**Terminal**
![](minimal/windows/terminal.png)

**Console task manager**
![](minimal/windows/terminal-htop.png)

**About**
![](minimal/windows/terminal-screenfetch.png) 

**XFCE Desktop**
![](minimal/windows/xfce.png)

---

## Mac XFCE
> industrial

![](minimal/mac/xfce.png)

**Explorer**
![](minimal/mac/explorer.png)

**Menu**
![](minimal/mac/menu.png)

**Directory menu**
![](minimal/mac/menu-dirs.png)

**Exit menu**
![](minimal/mac/menu-exit.png)

**App finder**
![](minimal/mac/menu-find.png)

**Launch FreeCAD**
![](minimal/mac/app-freecad-start.png)

**FreeCAD with dark UI**
![](minimal/mac/app-freecad-dark.png)

**FreeCAD project**
![](minimal/mac/app-freecad-project.png)

**Office**
![](minimal/mac/app-office.png)

**Console**
![](minimal/mac/terminal.png)

**Notifications**
![](minimal/mac/notifications.png)

---

## Default XFCE

![](minimal/default/desktop.png)

![](minimal/default/workspace.png)

---

## Stylesheets presets

```
touch ~/.config/gtk-3.0/gtk.css
```

Remove XFCE specific dotted UI artifacts:

```
echo "/* Remove dotted lines from GTK 3 applications */
undershoot.top, undershoot.right, undershoot.bottom, undershoot.left {
	background-image: none;
}" >> ~/.config/gtk-3.0/gtk.css
```

Add indentations to console:

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
- [x] 20 height

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