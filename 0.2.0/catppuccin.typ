// https://catppuccin.com/palette
// CONVERTED TO TYPST COLOUR LIBRARY by joniksj

#let ctp-latt = (
  rosewater: rgb("#dc8a78"),
  flamingo: rgb("#dd7878"),
  pink: rgb("#ea76cb"),
  mauve: rgb("#8839ef"),
  red: rgb("#d20f39"),
  maroon: rgb("#e64553"),
  peach: rgb("#fe640b"),
  yellow: rgb("#df8e1d"),
  green: rgb("#40a02b"),
  teal: rgb("#179299"),
  sky: rgb("#04a5e5"),
  sapphire: rgb("#209fb5"),
  blue: rgb("#1e66f5"),
  lavender: rgb("#7287fd"),
  text: rgb("#4c4f69"),
  subtext1: rgb("#5c5f77"),
  subtext0: rgb("#6c6f85"),
  overlay2: rgb("#7c7f93"),
  overlay1: rgb("#8c8fa1"),
  overlay0: rgb("#9ca0b0"),
  surface2: rgb("#acb0be"),
  surface1: rgb("#bcc0cc"),
  surface0: rgb("#ccd0da"),
  base: rgb("#eff1f5"),
  mantle: rgb("#e6e9ef"),
  crust: rgb("#dce0e8"),
)

#let ctp-frap = (
  rosewater: rgb("#f2d5cf"),
  flamingo: rgb("#eebebe"),
  pink: rgb("#f4b8e4"),
  mauve: rgb("#ca9ee6"),
  red: rgb("#e78284"),
  maroon: rgb("#ea999c"),
  peach: rgb("#ef9f76"),
  yellow: rgb("#e5c890"),
  green: rgb("#a6d189"),
  teal: rgb("#81c8be"),
  sky: rgb("#99d1db"),
  sapphire: rgb("#85c1dc"),
  blue: rgb("#8caaee"),
  lavender: rgb("#babbf1"),
  text: rgb("#c6d0f5"),
  subtext1: rgb("#b5bfe2"),
  subtext0: rgb("#a5adce"),
  overlay2: rgb("#949cbb"),
  overlay1: rgb("#838ba7"),
  overlay0: rgb("#737994"),
  surface2: rgb("#626880"),
  surface1: rgb("#51576d"),
  surface0: rgb("#414559"),
  base: rgb("#303446"),
  mantle: rgb("#292c3c"),
  crust: rgb("#232634"),
)

#let ctp-macc = (
  rosewater: rgb("#f4dbd6"),
  flamingo: rgb("#f0c6c6"),
  pink: rgb("#f5bde6"),
  mauve: rgb("#c6a0f6"),
  red: rgb("#ed8796"),
  maroon: rgb("#ee99a0"),
  peach: rgb("#f5a97f"),
  yellow: rgb("#eed49f"),
  green: rgb("#a6da95"),
  teal: rgb("#8bd5ca"),
  sky: rgb("#91d7e3"),
  sapphire: rgb("#7dc4e4"),
  blue: rgb("#8aadf4"),
  lavender: rgb("#b7bdf8"),
  text: rgb("#cad3f5"),
  subtext1: rgb("#b8c0e0"),
  subtext0: rgb("#a5adcb"),
  overlay2: rgb("#939ab7"),
  overlay1: rgb("#8087a2"),
  overlay0: rgb("#6e738d"),
  surface2: rgb("#5b6078"),
  surface1: rgb("#494d64"),
  surface0: rgb("#363a4f"),
  base: rgb("#24273a"),
  mantle: rgb("#1e2030"),
  crust: rgb("#181926"),
)

#let ctp-moch = (
  rosewater: rgb("#f5e0dc"),
  flamingo: rgb("#f2cdcd"),
  pink: rgb("#f5c2e7"),
  mauve: rgb("#cba6f7"),
  red: rgb("#f38ba8"),
  maroon: rgb("#eba0ac"),
  peach: rgb("#fab387"),
  yellow: rgb("#f9e2af"),
  green: rgb("#a6e3a1"),
  teal: rgb("#94e2d5"),
  sky: rgb("#89dceb"),
  sapphire: rgb("#74c7ec"),
  blue: rgb("#89b4fa"),
  lavender: rgb("#b4befe"),
  text: rgb("#cdd6f4"),
  subtext1: rgb("#bac2de"),
  subtext0: rgb("#a6adc8"),
  overlay2: rgb("#9399b2"),
  overlay1: rgb("#7f849c"),
  overlay0: rgb("#6c7086"),
  surface2: rgb("#585b70"),
  surface1: rgb("#45475a"),
  surface0: rgb("#313244"),
  base: rgb("#1e1e2e"),
  mantle: rgb("#181825"),
  crust: rgb("#11111b"),
)

// JUST THE ACCENT COLOURS

#let ctp-latt-comp = (
  rosewater: ctp-latt.rosewater,
  flamingo: ctp-latt.flamingo,
  pink: ctp-latt.pink,
  mauve: ctp-latt.mauve,
  red: ctp-latt.red,
  maroon: ctp-latt.maroon,
  peach: ctp-latt.peach,
  yellow: ctp-latt.yellow,
  green: ctp-latt.green,
  teal: ctp-latt.teal,
  sky: ctp-latt.sky,
  sapphire: ctp-latt.sapphire,
  blue: ctp-latt.blue,
  lavender: ctp-latt.lavender,
)

#let ctp-frap-comp = (
  rosewater: ctp-frap.rosewater,
  flamingo: ctp-frap.flamingo,
  pink: ctp-frap.pink,
  mauve: ctp-frap.mauve,
  red: ctp-frap.red,
  maroon: ctp-frap.maroon,
  peach: ctp-frap.peach,
  yellow: ctp-frap.yellow,
  green: ctp-frap.green,
  teal: ctp-frap.teal,
  sky: ctp-frap.sky,
  sapphire: ctp-frap.sapphire,
  blue: ctp-frap.blue,
  lavender: ctp-frap.lavender,
)

#let ctp-macc-comp = (
  rosewater: ctp-macc.rosewater,
  flamingo: ctp-macc.flamingo,
  pink: ctp-macc.pink,
  mauve: ctp-macc.mauve,
  red: ctp-macc.red,
  maroon: ctp-macc.maroon,
  peach: ctp-macc.peach,
  yellow: ctp-macc.yellow,
  green: ctp-macc.green,
  teal: ctp-macc.teal,
  sky: ctp-macc.sky,
  sapphire: ctp-macc.sapphire,
  blue: ctp-macc.blue,
  lavender: ctp-macc.lavender,
)

#let ctp-moch-comp = (
  rosewater: ctp-moch.rosewater,
  flamingo: ctp-moch.flamingo,
  pink: ctp-moch.pink,
  mauve: ctp-moch.mauve,
  red: ctp-moch.red,
  maroon: ctp-moch.maroon,
  peach: ctp-moch.peach,
  yellow: ctp-moch.yellow,
  green: ctp-moch.green,
  teal: ctp-moch.teal,
  sky: ctp-moch.sky,
  sapphire: ctp-moch.sapphire,
  blue: ctp-moch.blue,
  lavender: ctp-moch.lavender,
)