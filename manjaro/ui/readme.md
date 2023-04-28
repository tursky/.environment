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

![](minimal/win/desktop.png)

**Explorer**
![](minimal/win/explorer.png)

**Start menu**
![](minimal/win/menu.png)

**Application Finder**
![](minimal/win/menu-find.png)

**Programs**
![](minimal/win/programms.png)

**Exit menu**
![](minimal/win/menu-exit.png)

**Terminal**
![](minimal/win/terminal.png)

**Console task manager**
![](minimal/win/terminal-htop.png)

**Start Office**
![](minimal/win/office-start.png)

**Office document**
![](minimal/win/office-document.png)

**FreeCAD (dark theme)**
![](minimal/win/freecad-start.png)

**FreeCAD project**
![](minimal/win/freecad-project.png)

**Multimedia**
![](minimal/win/multimedia.png)

**Charging**
![](minimal/win/charging.png)

**About**
![](minimal/win/terminal-screenfetch.png)

**XFCE Desktop**
![](minimal/win/xfce.png)

---

## Mac XFCE
> industrial

![](minimal/mac/desktop.png)

**Console**
![](minimal/mac/console-ls.png)

**Explorer**
![](minimal/mac/explorer.png)

**Menu**
![](minimal/mac/menu.png)

**Directory menu**
![](minimal/mac/menu-dirs.png)

**Exit menu**
![](minimal/mac/menu-exit.png)

**Application Finder**
![](minimal/mac/menu-find.png)

**Launch FreeCAD**
![](minimal/mac/freecad-start.png)

**FreeCAD dark UI**
![](minimal/mac/freecad-documents.png)

**FreeCAD project**
![](minimal/mac/freecad-pro.png)

**KiCad**
![](minimal/mac/kicad.png)

**KiCad Design**
![](minimal/mac/kicad2.png)

**Office**
![](minimal/mac/office-1.png)

**Office fullscreenf**
![](minimal/mac/office-2.png)

**Application switcher**
![](minimal/mac/alt-tab-switcher.png)

**About**
![](minimal/mac/console.png)

**Multimedia**
![](minimal/mac/multimedia.png)

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

- [x] Source Code Pro Regular, 14px
- [x] 1.05 line spacing
- [x] 66 width
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