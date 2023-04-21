# XFCE desktop environment personal settings

1. [Industrial XFCE](#industrial-xfce)
2. [Night XFCE](#night-xfce)
3. [Default XFCE](#default-xfce)

---

# Terminal view

![](show/terminal.png)

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

> Remove XFCE specific dotted UI artifacts:

```
touch ~/.config/gtk-3.0/gtk.css
```

```
echo "/* Remove dotted lines from GTK 3 applications */
undershoot.top, undershoot.right, undershoot.bottom, undershoot.left { background-image: none; }" >> ~/.config/gtk-3.0/gtk.css
```