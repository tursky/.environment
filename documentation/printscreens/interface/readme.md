# XFCE custom presets

1. [Windows XFCE](#windows-xfce)
2. [Mac XFCE](#mac-xfce)
3. [Default XFCE](#default-xfce)
4. [Stylesheets presets](#stylesheets-presets)
5. [Console color palette and geometry](#console-color-palette-and-geometry)
6. [Keyboard shortcuts](#keyboard-shortcuts)
7. [Application menu](#application-menu)

---

# Terminal view

![](./xfce/console.png)

---

## Windows XFCE
> professional

![](./xfce/win/desktop.png)

**Explorer**

![](./xfce/win/explorer.png)

**Start menu**

![](./xfce/win/menu.png)

**Search program**

![](./xfce/win/menu-find.png)

**Workspace**

![](./xfce/win/programs.png)

**Exit menu**

![](./xfce/win/menu-exit.png)

**Terminal**

![](./xfce/win/terminal.png)

**Console Task Manager**

![](./xfce/win/terminal-htop.png)

**Start Office**

![](./xfce/win/office-start.png)

**Office Document**

![](./xfce/win/office-document.png)

**FreeCAD**

![](./xfce/win/freecad-start.png)

**FreeCAD Project**

![](./xfce/win/freecad-project.png)

**Multimedia**

![](./xfce/win/multimedia.png)

**Charging**

![](./xfce/win/charging.png)

**About**

![](./xfce/win/terminal-screenfetch.png)

**XFCE Desktop**

![](./xfce/win/xfce.png)

---

## Mac XFCE
> industrial

![](./xfce/mac/desktop.png)

**Console**

![](./xfce/mac/console-ls.png)

**Explorer**

![](./xfce/mac/explorer.png)

**Menu**

![](./xfce/mac/menu.png)

**Directory menu**

![](./xfce/mac/menu-dirs.png)

**Exit menu**

![](./xfce/mac/menu-exit.png)

**Application Finder**

![](./xfce/mac/menu-find.png)

**Launch FreeCAD**

![](./xfce/mac/freecad-start.png)

**FreeCAD night UI**

![](./xfce/mac/freecad-documents.png)

**FreeCAD Project**

![](./xfce/mac/freecad-pro.png)

**KiCad**

![](./xfce/mac/kicad.png)

**KiCad Design**

![](./xfce/mac/kicad2.png)

**Office**

![](./xfce/mac/office-1.png)

**Office full screen**

![](./xfce/mac/office-2.png)

**Window switcher**

![](./xfce/mac/alt-tab-switcher.png)

**About**

![](./xfce/mac/console.png)

**Multimedia**

![](./xfce/mac/multimedia.png)

---

## Default XFCE

![](./xfce/default/desktop.png)

![](./xfce/default/workspace.png)

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

## Application menu

To edit menu layout:

```
mkdir ~/.config/menus
cd ~/.config/menus
cp /etc/xdg/menus/xfce-applications.menu .
ls -a
```