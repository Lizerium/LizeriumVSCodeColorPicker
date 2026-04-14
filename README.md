<p align="center">✨Dvurechensky✨</p>

<h1 align="center"> Color Picker INI (VSCode Extension) 😈</h1>
<p align="center"> ⭐ Freelancer <b>Lizerium</b> ⭐ </p>

<div align="center" style="margin: 20px 0; padding: 10px; background: #1c1917; border-radius: 10px;">
  <strong>🌐 Language: </strong>
  
  <a href="./README.ru.md" style="color: #F5F752; margin: 0 10px;">
    🇷🇺 Russian
  </a>
  | 
  <span style="color: #0891b2; margin: 0 10px;">
    ✅ 🇺🇸 English (current)
  </span>
</div>

---

> [!NOTE]
> This project is part of the **Lizerium** ecosystem and belongs to:
>
> - [`Lizerium.Tools.Structs`](https://github.com/Lizerium/Lizerium.Tools.Structs)
>
> If you are looking for related engineering and utility tools, start there.

# ✨ Table of Contents

- [✨ Table of Contents](#-table-of-contents)
  - [💦 Description 💦](#-description-)
  - [💦 Build 💦](#-build-)
  - [💦 Debug 💦](#-debug-)
    - [💦 Example 💦](#-example-)

---

## 💦 Description 💦

- Works with [VS Code](https://code.visualstudio.com/)
- This simple extension highlights color values in lines like:

```

color = 255, 255, 255

```

- It also adds a color picker panel to the left of each matching line

_P.S ✌️ I personally used it for `rich_fonts` files and other game files where this format appears frequently_

---

## 💦 Build 💦

> Install all dependencies in the `Terminal` from the project root

```sh
npm install
```

> Build the project (an `Out` folder with compiled plugin `.js` will be created)

```sh
npm run vscode:prepublish
```

> Package the extension

```sh
npm install -g vsce
vsce package
```

---

## 💦 Debug 💦

1. Open the script: [extension.ts](src/extension.ts)
2. Start debugging:
   **Run → Start Debugging → VS Code Extension Development**
3. A clean VS Code instance will open
   Add a test file with lines like `color = 255, 255, 255` and observe the behavior

---

### 💦 Example 💦

---

_`Before`_
![Before](Media/Before.png)

---

_`After`_
![After_1](Media/Afetr_1.png)
![After_2](Media/After_2.png)

---

<p align="center">✨Dvurechensky✨</p>
