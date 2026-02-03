<!-- mtoc-start -->

- [💤 LazyVim](#-lazyvim)
  - [Custom Keymaps](#custom-keymaps)
    - [**Navigation**](#navigation)
    - [**Python**](#python)
    - [**Quarto & Markdown**](#quarto--markdown)
  - [Quarto (Python)](#quarto-python)
  - [Use surround](#use-surround)
- [Documentation](#documentation)

<!-- mtoc-end -->

# 💤 LazyVim

This is a basic LazyVim setup that has been optimised primarily for use as a Python dev environment.

## Custom Keymaps

### **Navigation**

| Keymap       | Description           |
| ------------ | --------------------- |
| `<leader>än` | Open a new tab        |
| `<leader>äc` | Close the current tab |
| `<leader>äd` | Open the Dashboard    |

---

### **Python**

| Keymap       | Description                                                                                                                                       |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `<leader>üp` | Insert a formatted f-string `print(f"{var} : {var}")` for the yanked variable. Automatically detects the variable name and preserves indentation. |

---

### **Quarto & Markdown**

| Keymap       | Description                                         |
| ------------ | --------------------------------------------------- |
| `<leader>öp` | Preview the current Quarto document                 |
| `<leader>öd` | Toggle LSP diagnostics (enable/disable)             |
| `<leader>öt` | Insert a Table of Contents (ToC) for Markdown files |

---

## Quarto (Python)

To use Quarto to work in notebooks and produce neat reports, set up Poetry and add the following packages:

- `poetry add nbformat`
- `poetry add jupyter`

TODO: The Code Diagnostic doesn't work very well in Quarto.

## Use surround

```
| Old Text                  | Command   | New Text              |
| ------------------------- | --------- | --------------------- |
| surr\*ound_words          | ysiw)     | (surround_words)      |
| surr\*ound_words          | ysiw(     | ( surround_words )    |
| \*make strings            | ys$"      | "make strings"        |
| [delete ar*ound me!]      | ds]       | delete around me!     |
| remove <b>HTML t\*ags</b> | dst       | remove HTML tags      |
| 'change quot\*es'         | cs'"      | "change quotes"       |
| <b>or tag\* types</b>     | csth1<CR> | <h1>or tag types</h1> |
| delete(functi\*on calls)  | dsf       | function calls        |
```

# Documentation

- Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
- Great resource [LazyVim for Ambitious Developers](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/)
