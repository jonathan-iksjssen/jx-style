# jx-style

**@joniksj**'s personal style package for his `typst` documents. Recommended for use if you are him, or if you want to make your documents look like his.

# Installation
Of course, to use this, you'll need [`typst`](https://github.com/typst/typst).

If you haven't heard, `typst` is a newfangled document typesetting system akin to LaTeX, also exporting directly to `.pdf`, that uses more modern syntax *(thank god)*, familiar programming concepts, and has a powerful styling engine, which makes it perfect for me, **@joniksj**, that wanted an alternative to Google Docs but didn't want to learn LaTeX.


## Dependencies

- An installation of **Typst**, either the binary from the [releases page](https://github.com/typst/typst/releases/) or from **@nvarner**'s `typst-lsp` for VS Code(ium)
- A text editor to actually test this out with (I recommend VS Code(ium) with `typst-lsp`)
- Git CLI *(optional, to make things easier)*

## Installation Instructions

<details>

<summary> With `git clone` </summary>

**You will need to use `git` for this.**
1. Navigate to your `typst` local packages directory, which is:
  - `$XDG_DATA_HOME/typst/packages` or `~/.local/share/typst/packages` on Linux
  - `~/Library/Application Support/typst/packages` on macOS
  - `%APPDATA%/typst/packages` on Windows
2. Make a folder called `local` *(or whatever you want to name your package namespace)*
3. In that `local` folder, open a terminal and run:
    ```bash
    git clone https://github.com/jonathan-iksjssen/jx-style.git
    ```
4. Make a new `.typ` file anywhere
5. Import the package with
   ```c
    #import "@local/jx-style:0.2.0": *
   ```
   Replace `local` with whatever you named your package namespace in step 2.

</details>

<details>

<summary> Without `git clone` </summary>

1. Download the `.zip` file of this repository.
2. Navigate to your `typst` local packages directory, which is:
  - `$XDG_DATA_HOME/typst/packages` or `~/.local/share/typst/packages` on Linux
  - `~/Library/Application Support/typst/packages` on macOS
  - `%APPDATA%/typst/packages` on Windows
3. Make a folder called `local` *(or whatever you want to name your package namespace)* and navigate into it.
4. Extract the contents of `jx-style-main.zip` directly into said folder.
5. If necessary, rename the `jx-style-main` folder to just `jx-style`.
6. Make a new `.typ` file anywhere
7. Import the package with
   ```c
    #import "@local/jx-style:0.2.0": *
   ```
   Replace `local` with whatever you named your package namespace in step 2.

</details>

ㅤ

# Parts

There are four main parts of this package that are important:

| File | Purpose |
|---|---|
`irgot.typ` | *(is `irgot.json` in 0.1.0)* Contains the **colour schemes** that are possible for documents. *‹irgot›* means *‹colours›* in Icsine, my personal conlang.
`jx-style.typ` | The **main style file**, and the entry point to the package itself. Contains all the styles themselves, all that shabang.
`jx-date.typ` | My own **date string formatter**. Accessed by `jx-style.typ` to display dates how I like it.
`typst.toml` | The **manifest** for the package, in accordance with [typst/packages](https://github.com/typst/packages).

## `irgot.typ`

A bit of backstory -- before I moved to making my documents with Typst, 