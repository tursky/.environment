# XFCE desktop environment personal settings

1. [Industrial XFCE](#industrial-xfce)
2. [Night XFCE](#night-xfce)
3. [Default XFCE](#default-xfce)
4. [Stylesheets presets](#stylesheets-presets)
5. [Console color palette, geometry](#console-color-palette-geometry)

---

# Terminal view

![](show/console.png)

---

## Industrial XFCE

![](show/industrial/desktop.png)

![](show/industrial/explorer.png)

![](show/industrial/htop.png)

![](show/industrial/menu.png)

![](show/industrial/menu-apps.png)

![](show/industrial/notification.png)

![](show/industrial/program.png)

![](show/industrial/screenfetch.png)

![](show/industrial/xfce.png)

---

## Night XFCE

![](show/night/desktop.png)

![](show/night/explorer.png)

![](show/night/htop.png)

![](show/night/menu.png)

![](show/night/menu-apps.png)

![](show/night/notification.png)

![](show/night/program.png)

![](show/night/screenfetch.png)

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
	padding: 5px;
}" >> ~/.config/gtk-3.0/gtk.css
```

## Console color palette, geometry

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

- [x] Source Code Pro Regular, 15px
- [x] 1.05 line spacing
- [x] 74 width
- [x] 20 height