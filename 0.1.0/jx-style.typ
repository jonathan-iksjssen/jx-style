#let coll = json("irgot.json");
#import "jx-date.typ": *

#let docu(
  // DETERMINES WHAT KIND OF DOCUMENT IT WILL BE. CHECK THE VARIABLE validDocTypes A BIT BELOW.
  docutype: "blankhead",

  // AUTHOR. CAN EITHER BE A STRING OR AN ARRAY. NOT USED FOR PAPERS.
  author: "",

  // SECTION.
  section: "",

  // // ALL FIELDS BEGINNING WITH rp- and bp- ARE ONLY USED IN PAPERS (i.e. research papers, business plans)

  // PAPER TITLE.
  rp-title: "",

  // PAPER AUTHORS. IS AN ARRAY IN THE FORMAT OF ( (lastname: string), (firstname: string) )
  rp-authors: (),

  // PAPER SCHOOL.
  rp-school: "",

  // PAPER SUBMITTED TO THIS PERSON.
  rp-submittedTo: "",

  // PAPER KEYWORDS. FOR FUTURE USE. STILL GONNA USE THIS STYLEFILE IN COLLEGE.
  rp-keywords: (),

  // EXTRA PAPER SUBTITLES SHOULD THE FORMAT DEMAND IT.
  rp-subtitle: [],
  
  rp-supplement: [],
  bp-supplement2: [],
  rp-header: [],

  // PAPER SUBJECT.
  rp-subject: [],

  // //  END OF RESEARCH PAPER SECTION.

  // SUBJECT.
  subject: "",

  // TITLE OF DOCUMENT.
  title: "",

  // SUBTITLE OF DOCUMENT. NOT USED IN ASSIGNMENT DOCS.
  subtitle: "",

  // DOCUMENT DESCRIPTION.
  description: "",
  rating: "",
  tags: (),
  cod: "",
  colsc: "default",
  bgtint: none,
  headingstyle: "block",
  headingnum: "1.1.1",
  headingsup: "Section",
  size: "print",
  font: "Iosevka SS14",
  fw: "regular",
  date: datetime.today().display("[day padding:none] [month repr:short] [year repr:full]"),
  columns: 1,
  outcols: 1,
  fz: 12pt,
  flags: (),
  debug: false,
  body,
) = {
  // TYPE CHECKING --- TYPE CHECKING --- TYPE CHECKING --- TYPE CHECKING --- TYPE CHECKING --- TYPE CHECKING --- TYPE CHECKING ---
  let doctype = docutype
  let code = raw(cod)
  let validDoctypes = (
    "blankhead", // 0
    "schooldoc", // 1
    "notes", // 2
    "paper", // 3
    "article", // 4
    "articleVerbose", // 5
    "writing", // 6
    "writingVerbose", // 7
    "diaryEntry", // 8
    "businessPlan", // 9
  )
  if (type(docutype) == int) {
    doctype = validDoctypes.at(docutype)
  }

  if (type(docutype) not in (str, int)) {
    panic("Field `docutype` must be a string or an integer!")
  }

  if (type(docutype) not in (str, int) and docutype not in validDoctypes) {
    panic("Invalid doctype!")
  }
  if (type(author) != str and type(author) != array) {
    panic("Field `author` must be a string or an array!")
  }

  // COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS ---

  let bg = rgb("#F8F4F1") // BG; 50
  let la = rgb("#b4bdf2") // lightAccent; 200
  let ac = rgb("#5c6ed3") // Accent; 600
  let da = rgb("#38378F") // darkAccent; 800
  let tx = rgb("#0E0E25") // Text; 950

  if (coll.at(colsc, default: "nane") != "nane") {
    bg = if(bgtint == "pine") {
      color.mix((rgb(eval("coll." + colsc, scope: (coll: coll)).bg), 33%), (rgb("#EFEBE9"), 67%))
    } else if (bgtint == "grey") {
      rgb(eval("coll." + colsc, scope: (coll: coll)).bg).desaturate(100%)
    } else {
      rgb(eval("coll." + colsc, scope: (coll: coll)).bg)
    }
    tx = rgb(eval("coll." + colsc, scope: (coll: coll)).tx)
    ac = rgb(eval("coll." + colsc, scope: (coll: coll)).ac)
    la = rgb(eval("coll." + colsc, scope: (coll: coll)).la)
    da = rgb(eval("coll." + colsc, scope: (coll: coll)).da)
  }
  let solidStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "solid")
  let dottedStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "dotted")
  let dashedStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "dashed")

  let bgla = color.mix(bg, la)
  let laac = color.mix(la, ac)
  let acda = color.mix(ac, da)
  let datx = color.mix(da, tx)

  let fill-bg = arguments(fill: bg)
  let fill-bgla = arguments(fill: bgla)
  let fill-la = arguments(fill: la)
  let fill-laac = arguments(fill: laac)
  let fill-ac = arguments(fill: ac)
  let fill-acda = arguments(fill: acda)
  let fill-da = arguments(fill: da)
  let fill-datx = arguments(fill: datx)
  let fill-tx = arguments(fill: tx)

  // TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT --- TEXT ---

  set text(
    font: font,
    size: fz,
    weight: fw,
    fill: tx,
    hyphenate: false,
    lang: "en",
    region: "ph",
    number-width: "tabular",
    number-type: if (flags.contains("oldnum")) {
      "old-style"
    } else {
      auto
    },
    slashed-zero: if (flags.contains("zero")) {
      true
    } else {
      false
    },
    features: if (font.contains("Inter")) {
      ("case", "tnum", "zero", "cv01", "cv02", "cv05", "cv08", "cv12", "cv13", "cpsp")
    } else if(font.contains("Andika")) {
      ("ss01",)
    } else {
      ()
    },
    tracking: if (font.contains("Iosevka Aile") or font.contains("Iosevka Etoile")) {-0.5pt} else {0pt},
    spacing: if (font.contains("Iosevka Aile") or font.contains("Iosevka Etoile")) {300%/5} else {100%}
  )


  show raw: set text(font: "Iosevka SS14", size: fz)

  set par(justify: true, leading: 0.8em)
  show par: set block(spacing: 2em)

  show math.equation: m => if (font.contains("Fira")) {
    text(font: "Fira Math")[#m]
  } else if (font.contains("Noto Sans") or font.contains("Noto Mono")) {
    text(font: "Noto Sans Math")[#m]
  } else {
    text(font: "STIX Two Math")[#m]
  }
  show math.equation.where(block: false): set text(size: 1.2em)
  show math.equation.where(block: true): me => [#set text(size: 1.5em); #align(center)[#me]]

  show link: set text(..fill-ac)

  // OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES ---

  set outline(depth: 3, indent: 2em, title: if(doctype in ("businessPlan", "paper")) {none} else {"Table of Contents"})
  show outline.entry.where(level: 1): strong
  show outline: a => if(doctype in ("businessPlan", "paper")) {
    [#page(columns: outcols)[ #align(horizon + center)[#block(width: 200%/3,a)]~] ]
  } else {
    a
  }


  // BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES ---

  set quote(block: true)
  show quote: q => [
    #pad(1em)[
      #block(fill: color.mix(bg, bgla), inset: (x: 2em, y: 2.5em))[
        #place(
          top + left,
          dx: -1.5em,
          dy: -2em,
        )[#text(fill: laac, size: 2em, weight: 1000, style: "italic")[«]]
        #place(
          bottom + right,
          dx: 1.5em,
          dy: 2em,
        )[#text(fill: laac, size: 2em, weight: 1000, style: "italic")[»]]
        #[#emph[#q.body]] #linebreak()
        #h(1fr) — #q.attribution
      ]
    ]
  ]

  // LISTS AND ENUMS --- LISTS AND ENUMS --- LISTS AND ENUMS --- LISTS AND ENUMS --- LISTS AND ENUMS --- LISTS AND ENUMS --- LISTS AND ENUMS ---

  set enum(
    numbering: (..nums) => [#strong[#numbering("1.1.1.", ..nums)]],
    full: if (flags.contains("fullenums")) {
      true
    } else {
      false
    },
    tight: false,
  )
  set list(tight: false, marker: ([#sym.circle.filled], [#sym.circle.stroked], [#sym.triangle.filled.r], [#sym.triangle.stroked.r]))
  set terms(tight: false)

  show enum.item: a => block(inset: (y: 0.083em))[#a]
  show list.item: a => block(inset: (y: 0.083em))[#a]
  show terms.item: k => block(inset: (y: 0.083em))[- #[#k.term]<hl-la> #emph(k.description) #linebreak()]

  // PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE ---

  set document(
    title: if (title == "") { } else {
      title
    },
    author: if (type(author) == str) {
      author
    } else if type(author) == array {
      (..author,).join(", ")
    },
    date: datetime.today(),
    keywords: rp-keywords,
  )

  set page(
    fill: bg,
    //DEFAULT PAGE SIZE: 8.5in x 11in, 0.5in margin on all sides
    width: if (size == "longbond") { 8.5in 
    } else if (size == "longbond-l") { 13in 
    } else if (size == "print-l") { 11in 
    } else if (size == "phone") { 6in 
    } else if (size == "notebook") { 5.5in 
    } else if (size == "tablet") { 10in 
    } else if (size == "pc") { 12in 
    } else if (size == "a4") { 210mm
    } else if (size == "longlong") { 14in
    } else if (size == "book-a") { 5.75in 
    } else if (size == "book-b") { 7.5in
    } else { 8.5in },
    height: if (size == "longbond") { 13in 
    } else if (size == "longbond-l") { 8.5in 
    } else if (size == "print-l") { 8.5in 
    } else if (size == "phone") { 12in 
    } else if (size == "notebook") { 7.5in 
    } else if (size == "tablet") { 6in 
    } else if (size == "pc") { 7.5in 
    } else if (size == "a4" ) { 297mm 
    } else if (size == "longlong") { 8in
    } else if (size == "book-a") { 9in 
    } else if (size == "book-b") { 10.25in
    } else { 11in },
    margin: (
      y: 0.75in,
      rest: if(flags.contains("shineformat")){1in}else{0.5in},
      bottom: if (flags.contains("nofoot")) { 0.75in } else { 1in },
      top: if (rp-header == []) { 0.75in } else { 1in },
    ),
    header: [
    #if(rp-header != []){[ #rp-header #h(1fr) #rp-subject #v(-1em)]};
    #line(length: 100%, stroke: dashedStroke(tx.transparentize(50%)))
    ],
    footer: [
      #line(length: 100%, stroke: dashedStroke(tx.transparentize(50%)));
      #if (flags.contains("nofoot")) {} else [

        #if(flags.contains("blankfoot")) {} else [
          #if (cod != "") { [ [#code] ] } else {}
        #if (rp-title != "") { emph[#rp-title] } else if (title != "") { emph[#title] }
      ] #h(1fr) #strong[#counter(page).display()]
      ]

    ],
    columns: columns,
  )

  // #region HEADINGS
  // HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS ---

  set heading(numbering: (..nums) => if (doctype == "businessPlan") {
    let format = ("I.", "A.", "1.", "I.", "A.", "1.").at(nums.pos().len() - 1)
    numbering(format, nums.pos().last())
  } else {
    numbering(headingnum, ..nums)
  })

  // -- HEADING 1 -- HEADING 1 -- HEADING 1 -- HEADING 1 --
  show heading.where(level: 1): hy => if (headingstyle == "block") {
    [

      // -- H1 BLOCK STYLE
      #set text(size: 1.25em, fill: bg, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, tx)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: tx, align: left)[#counter(heading).display()],
          grid.cell(fill: datx)[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H1 SIMPLE STYLE
      #set text(size: 1.25em, fill: tx, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, tx)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: color.mix(bg, bgla), align: left)[#counter(heading).display()],
          grid.cell(fill: color.mix(bg, bgla))[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H1 OLD STYLE
      #set text(size: 1.25em, fill: bg, weight: "bold")
      #block(width: 100%, fill: tx, inset: 0.33em)[ #align(center)[#hy] ]

    ]
  } else if (headingstyle == "lines") {
    [

      #set text(size: 1.25em, fill: bg, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, tx)),
        inset: (y: 3pt),
      )[
        #block(..fill-tx, inset: (y: 0.33em), width: 100%)[
          #align(center)[#hy]
        ]
      ]

    ]
  } else if (headingstyle == "book") {
    [
      #pagebreak(weak:true)
      #set block(breakable: false)
    #block(
    width: 100%,
    height: 8em,
    inset: (top: 1em)
)[
    #set par(leading: 0.5em)
    #align(top)[
      #block(
        stroke: (y: solidStroke(th: 2pt, ac)),
        width: 100%,
        inset: (y: 4pt),
        height: auto
      )[#block(
        stroke: (y: solidStroke(th: 2pt, da)),
        width: 100%,
        inset: (y: 1em, left: 0.25em),
        height: auto
      )[
      #text(size: 2em, weight: "bold")[#headingsup #counter(heading).display()]
      #v(-3.25em)
      #text(size: 1.25em, fill: ac, weight: "regular", style: "italic")[#hy.body]
    ]
    ]]
]
    ]
  } else {
    set text(1.25em); hy
  }

  // -- HEADING 2 -- HEADING 2 -- HEADING 2 -- HEADING 2 --
  show heading.where(level: 2): hy => if (headingstyle in ("block", "book")) {
    [

      // -- H2 BLOCK STYLE
      #set text(size: 1.167em, fill: bg, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, acda)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: acda, align: left)[#counter(heading).display()],
          grid.cell(fill: ac)[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H2 SIMPLE STYLE
      #set text(size: 1.167em, fill: da, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, ac)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: color.mix(bg, bgla), align: left)[#counter(heading).display()],
          grid.cell(fill: color.mix(bg, bgla))[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H2 OLD STYLE
      #set text(size: 1.167em, fill: bg, weight: "bold")
      #block(width: 100%, fill: ac, inset: 0.33em)[ #align(left)[#hy] ]

    ]
  } else if (headingstyle == "lines") {
    [

      // -- H2 DEFAULT STYLE
      #set text(size: 1.167em, fill: bg, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, acda)),
        inset: (y: 3pt),
      )[
        #block(..fill-ac, inset: 0.33em, width: 100%)[
          #align(left)[#hy]
        ]
      ]

    ]
  } else { set text(1.167em); hy }

  // -- HEADING 3 -- HEADING 3 -- HEADING 3 -- HEADING 3 --
  show heading.where(level: 3): hy => if (headingstyle in ("block", "book")) {
    [

      // -- H3 BLOCK STYLE
      #set text(size: 1.083em, fill: tx, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, laac)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: color.mix(laac, la), align: left)[#counter(heading).display()],
          grid.cell(fill: la)[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H3 SIMPLE STYLE
      #set text(size: 1.083em, fill: da, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, la)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(fill: color.mix(bg, bgla), align: left)[#counter(heading).display()],
          grid.cell(fill: color.mix(bg, bgla))[#hy.body],
        )
      ]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H3 OLD STYLE
      #set text(size: 1.083em, fill: tx, weight: "bold")
      #block(width: 100%, fill: la, inset: 0.33em)[ #align(left)[#hy] ]

    ]
  } else if (headingstyle == "lines") {
    [

      // -- H3 DEFAULT STYLE
      #set text(size: 1.083em, fill: tx, weight: "bold")
      #block(
        width: 100%,
        fill: none,
        stroke: (y: solidStroke(th: 2pt, laac)),
        inset: (y: 3pt),
      )[
        #block(..fill-la, inset: 0.33em, width: 100%)[
          #align(left)[#hy]
        ]
      ]

    ]
  } else { set text(1.083em); hy }

  // -- HEADING 4 -- HEADING 4 -- HEADING 4 -- HEADING 4 --
  show heading.where(level: 4): hy => if (headingstyle in ("block", "book")) {
    [
      // -- H4 BLOCK STYLE
      #parbreak()
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(da)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: datx,
          )[#[#[#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: da)[#[#[#hy.body]]],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H4 SIMPLE STYLE
      #set text(size: 1em, fill: tx, weight: "bold")
      #box(
        inset: (x: 0.5em, y: 0.33em),
        stroke: (y: solidStroke(tx)),
      )[#counter(heading).display() #h(0.5em) #hy.body]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H4 OLD STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(..fill-da, inset: (x: 0.33em), outset: (y: 0.33em))[
        #[#hy]
      ]

    ]
  } else if (headingstyle == "lines") {
    [

      // -- H4 LINES STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(da)),
        fill: none,
      )[
        #box(inset: (x: 0.5em), outset: (y: 0.25em), fill: da)[#[#[#hy]]]
      ]

    ]
  } else { hy }

  // -- HEADING 5 -- HEADING 5 -- HEADING 5 -- HEADING 5 --
  show heading.where(level: 5): hy => if (headingstyle in ("block", "book")) {
    [
      // -- H5 BLOCK STYLE
      #parbreak()
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(acda)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: acda,
          )[#[#[#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: ac)[#[#[#hy.body]]],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H5 SIMPLE STYLE
      #set text(size: 1em, fill: da, weight: "bold")
      #box(
        inset: (x: 0.5em, y: 0.33em),
        stroke: (y: solidStroke(da)),
      )[#counter(heading).display() #h(0.5em) #hy.body]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H5 OLD STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(..fill-ac, inset: (x: 0.33em), outset: (y: 0.33em))[
        #[#hy]
      ]

    ]
  } else if (headingstyle == "lines") {
    [

      // -- H5 LINES STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(ac)),
        fill: none,
      )[
        #box(inset: (x: 0.5em), outset: (y: 0.25em), fill: ac)[#[#[#hy]]]
      ]

    ]
  } else { hy }

  // -- HEADING 6 -- HEADING 6 -- HEADING 6 -- HEADING 6 --
  show heading.where(level: 6): hy => if (headingstyle in ("block", "book")) {
    [
      // -- H6 BLOCK STYLE
      #parbreak()
      #set text(size: 1em, fill: tx, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(laac)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: color.mix(laac, la),
          )[#[#[#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: la)[#[#[#hy.body]]],
        )
      ]

    ]
  } else if (headingstyle == "simple") {
    [

      // -- H6 SIMPLE STYLE
      #set text(size: 1em, fill: ac, weight: "bold")
      #box(
        inset: (x: 0.5em, y: 0.33em),
        stroke: (y: solidStroke(acda)),
      )[#counter(heading).display() #h(0.5em) #hy.body]

    ]
  } else if (headingstyle == "old") {
    [

      // -- H6 OLD STYLE
      #set text(size: 1em, fill: da, weight: "bold")
      #box(..fill-la, inset: (x: 0.33em), outset: (y: 0.33em))[
        #[#hy]
      ]

    ]
  } else if (headingstyle == "lines") {
    [

      // -- H6 LINES STYLE
      #set text(size: 1em, fill: da, weight: "bold")
      #box(
        inset: (x: 0pt),
        outset: (y: 0.4em),
        stroke: (y: solidStroke(laac)),
        fill: none,
      )[
        #box(inset: (x: 0.5em), outset: (y: 0.25em), fill: la)[#[#[#hy]]]
      ]

    ]
  } else { hy }
  show heading: set block(spacing: 1em)

  // #endregion

  // BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHY AND CITATIONS ---

  set cite(style: if (doctype in ("businessPlan", "paper")) {"apa"} else {"ieee"})
  show cite: set text(..fill-ac)
  set bibliography(style: if (doctype in ("businessPlan", "paper")) {"apa"} else {"ieee"}, title: "References", full: true)
  show bibliography: a => {
    counter(heading).update(3)
    set heading(numbering: numbering("*", 1))
    a
  }


  // IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES ---

  set image(fit: "contain", width: 40%)
  show image: h => align(center)[#rect(stroke: solidStroke(th: 3pt, tx), inset: 0in, outset: 0in, fill: none)[#h]]

  // TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES ---

  show figure: set block(spacing: 1em)
  show figure.caption: emph
  set figure(numbering: "1.1.1", gap: 1em)

  set table(
    fill: (_, y) => if (y == 0) {
      tx
    } else if (calc.rem(y, 2) == 0) {
      bgla
    } else {
      bg
    },
    stroke: none,
    align: if (flags.contains("table-cen")) {
      horizon + center
    } else {
      horizon + left
    },
    inset: 0.5em,
  )

  set grid(inset: 0.33em)

  show table.cell.where(y: 0): k => strong(text(..fill-bg)[#[#k]])

  set grid.hline(stroke: solidStroke(tx))
  set table.hline(stroke: solidStroke(tx))
  set grid.vline(stroke: solidStroke(tx))
  set table.vline(stroke: solidStroke(tx))

  set rect(stroke: solidStroke(tx))
  set circle(stroke: solidStroke(tx))
  set ellipse(stroke: solidStroke(tx))
  set square(stroke: solidStroke(tx))
  set polygon(stroke: solidStroke(tx))
  set path(stroke: solidStroke(tx))
  set line(stroke: solidStroke(tx))

  // CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS --- CUSTOM HIGHLIGHTS ---

  let customhl(back, fore, body) = [
    #box(
      inset: (x: 0pt),
      outset: (y: 0.4em),
      stroke: (y: solidStroke(back)),
      fill: none,
    )[
      #box(
        inset: (x: 0.33em),
        outset: (y: 0.25em),
        fill: back,
      )[#text(fill: fore)[#strong[#body]]]
    ]
  ]

  show <hl-tx>: body => customhl(tx, bg, body)
  show <hl-datx>: body => customhl(datx, bg, body)
  show <hl-da>: body => customhl(da, bg, body)
  show <hl-da2>: body => customhl(da, la, body)
  show <hl-acda>: body => customhl(acda, bg, body)
  show <hl-ac>: body => customhl(ac, bg, body)
  show <hl-laac>: body => customhl(laac, tx, body)
  show <hl-la>: body => customhl(la, tx, body)
  show <hl-la2>: body => customhl(la, da, body)
  show <hl-bgla>: body => customhl(bgla, tx, body)
  show <hl-bg>: body => customhl(bg, tx, body)

  // CALLOUTS --- CALLOUTS --- CALLOUTS --- CALLOUTS --- CALLOUTS --- CALLOUTS --- CALLOUTS --- CALLOUTS ---

  let call(back, fore, body) = [
    #align(center)[
      #block(inset: (y: 2pt), stroke: (y: solidStroke(back)))[
        #block(inset: 0.5em, fill: back)[
        #text(fill: fore)[#body]
      ]
      ]
    ]
  ]
  show <call-tx>: body => call(tx, bg, body)
  show <call-datx>: body => call(datx, bg, body)
  show <call-da>: body => call(da, bg, body)
  show <call-da2>: body => call(da, la, body)
  show <call-acda>: body => call(acda, bg, body)
  show <call-ac>: body => call(ac, bg, body)
  show <call-laac>: body => call(laac, tx, body)
  show <call-la>: body => call(la, tx, body)
  show <call-la2>: body => call(la, da, body)
  show <call-bgla>: body => call(bgla, tx, body)
  show <call-bg>: body => call(bg, tx, body)

  // TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS ---

  show <t-tx>: t => text(fill: tx)
  show <t-datx>: t => text(fill: datx)
  show <t-da>: t => text(fill: da)
  show <t-acda>: t => text(fill: acda)
  show <t-ac>: t => text(fill: ac)
  show <t-laac>: t => text(fill: laac)
  show <t-la>: t => text(fill: la)
  show <t-bgla>: t => text(fill: bgla)
  show <t-bg>: t => text(fill: bg)

  // OTHER HIGHLIGHTS --- OTHER HIGHLIGHTS --- OTHER HIGHLIGHTS --- OTHER HIGHLIGHTS ---

  show <b1>: t => text(size: 1em * calc.pow(1.3, 2))[#t]
  show <b2>: t => text(size: 1em * calc.pow(1.2, 2))[#t]
  show <b3>: t => text(size: 1em * calc.pow(1.1, 2))[#t]
  show <s1>: t => text(size: 1em / 1.083)[#t]
  show <s2>: t => text(size: 1em / 1.167)[#t]
  show <s3>: t => text(size: 1em / 1.25)[#t]

  // BUSINESS PLAN FORMAT --- BUSINESS PLAN FORMAT --- BUSINESS PLAN FORMAT --- BUSINESS PLAN FORMAT --- BUSINESS PLAN FORMAT --- BUSINESS PLAN FORMAT ---

  let bpcoverpage() = page(
    margin: 0.5in,
    header: none,
    footer: none,
  )[

    #align(center + top)[
      #block(spacing: 3em)[#text(size: 2em, weight: 900)[#strong[#rp-title]]]
      #block(spacing: 3em)[#text(size: 1.5em)[#strong[#rp-subtitle]]]
      #block(spacing: 3em, width: 200% / 3)[#text(size: 1.5em)[#rp-supplement]]
    ]

    #align(center + horizon)[ #bp-supplement2 ]

    #align(center + bottom)[
      _Submitted by:_ #linebreak()
      #if (rp-authors != "") {
        [
          #for aut in rp-authors [
            #strong[#aut.lastname], #[#aut.firstname] \
          ]
        ]
      }
      #linebreak()
      _Submitted to:_ #linebreak()
      #strong[#rp-submittedTo] #linebreak()
      #date
    ]

  ]

  if (doctype == "businessPlan") {
    bpcoverpage()
  }

  // RESEARCH PAPER `rp` FORMAT --- RESEARCH PAPER `rp` FORMAT --- RESEARCH PAPER `rp` FORMAT --- RESEARCH PAPER `rp` FORMAT ---

  let rpcoverpage() = page(
    margin: 0.5in,
    header: none,
    footer: none,
    columns: 1,
  )[

    #align(center + top)[
      #strong[#rp-school] \
      #emph[#rp-subject] \
      #section
    ]

    #align(center + horizon)[
      #block(spacing: 3em)[#text(size: 3em, weight: 900)[#par(justify:false)[#strong[#rp-title]]]]
      #block(spacing: 3em)[#text(size: 2em)[#rp-subtitle]]
      #block(spacing: 3em, width: 200% / 3)[#text(size: 1.5em)[#rp-supplement]]
    ]

    #align(center + bottom)[
      _Submitted by:_ #linebreak()
      #if (rp-authors != "") {
        [
          #for aut in rp-authors [
            #strong[#aut.lastname], #[#aut.firstname] \
          ]
        ]
      }
      #linebreak()
      _Submitted to:_ #linebreak()
      #strong[#rp-submittedTo] #linebreak()
      #date
    ]

  ]

  if (doctype == "paper") {
    // FORMATTING FOR RESEARCH PAPER
    set cite(style: "apa")
    set bibliography(style: "apa", full: true)
    set outline(title: none)
    rpcoverpage()
    
  }

  let daterepr = [
    #customhl(daycolours.at(wdn), tx, sadaveVerbose)
  ]

  // SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT ---

  let sdheader() = [
    #strong[#author] #h(1fr) #if (code != "") {
      [#[#code]<hl-la>]
    }
    #linebreak()
    #box[#stack(
        dir: ltr,
        spacing: 0em,
        if (subject != "") {
          [#[#subject]<hl-da>]
        },
        [#[#emph[#title]]<hl-ac>],
      )] #h(1fr) #daterepr
    #line(length: 100%, stroke: solidStroke(tx))

  ]

  let notesheader() = [
    #align(center)[#strong[#author]
      ·
      #box[#stack(
          dir: ltr,
          spacing: 0em,
          if (subject != "") {
            [#[#subject]<hl-da>]
          },
          [#[#emph[Notes]]<hl-ac>],
        )]
      ·
      #if (code != "") {
        [#[#code]<hl-la>]
      }
      ·
      #daterepr
      #line(length: 100%, stroke: solidStroke(tx))]
  ]

  if (doctype == "schooldoc") {
    sdheader()
  }
  if (doctype == "notes") {
    notesheader()
  }

  // ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT ---

  let articleheader(verbose: false) = [
    #[#text(weight: 900)[#title]]<b1> #linebreak()
    #if (subtitle != "") {
      [#strong[#[#subtitle]<b3> ] #linebreak()]
    }
    #if (description != "") {
      [#emph[#description] #linebreak()]
    }
    #if (verbose == true) {
      [
        *Tags:* #(..tags).join(", ")
      ]
    }
    #line(length: 100%, stroke: solidStroke(tx))
  ]

  if (doctype == "article") {
    articleheader()
  }
  if (doctype == "articleVerbose") {
    articleheader(verbose: true)
  }

  // WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT ---

  let writingheader(verbose: false) = [
    #[#text(weight: 900)[#title]]<b1> #linebreak()
    #strong[Description: ] #emph[#description] #linebreak()
    #if (verbose == true) {
      [
        *Rating:* #rating #linebreak()
        *Tags:* #(..tags).join(", ")
      ]
    }
    #line(length: 100%, stroke: solidStroke(tx))
  ]

  if (doctype == "writing") {
    writingheader()
  }
  if (doctype == "writingVerbose") {
    writingheader(verbose: true)
  }

  // DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT ---

  let diaryheader() = [
    #[ #daterepr ]<b1>
  ]

  if (doctype == "diaryEntry") {
    flags.push("blankfoot")
    diaryheader()
  }

  // DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG ---

  if (debug) {
    heading(outlined: false, numbering: none)[DEBUG MODE]
    raw(repr(doctype))
    [\ ]
    raw(repr(author))
    [\ ]
    raw(repr(subject))
    [\ ]
    raw(repr(title))
    [\ ]
    raw(repr(subtitle))
    [\ ]
    raw(repr(description))
    [\ ]
    raw(repr(rating))
    [\ ]
    raw(repr(tags))
    [\ ]
    raw(repr(rp-keywords))
    [\ ]
    raw(repr(code))
    [\ ]
    raw(repr(colsc))
    [\ ]
    raw(repr(size))
    [\ ]
    raw(repr(font))
    [\ ]
    raw(repr(headingstyle))
    [\ ]
    raw(repr(headingnum))
    [\ ]
    raw(repr(fw))
    [\ ]
    raw(repr(date))
    [\ ]
    raw(repr(columns))
    [\ ]
    raw(repr(fz))
    [\ ]
    raw(repr(flags))
    [\ ]
    

    let sqdebug(a) = [#square(width: 2in, ..a, stroke: 2pt + tx)]

    align(
      center,
      block(
        grid(
          grid(
            columns: 3,
            row-gutter: 1em,
            sqdebug(fill-bg),
            sqdebug(fill-bgla),
            sqdebug(fill-la),
            repr(bg),
            repr(bgla),
            repr(la),
            sqdebug(fill-laac),
            sqdebug(fill-ac),
            sqdebug(fill-acda),
            repr(laac),
            repr(ac),
            repr(acda),
            sqdebug(fill-da),
            sqdebug(fill-datx),
            sqdebug(fill-tx),
            repr(da),
            repr(datx),
            repr(tx),
          ),
        ),
      ),
    )

    grid(
      columns: (1fr,) * 3,
      gutter: 0.5in,
      align: left,
      text(fill: bg)[#lorem(20)],
      text(fill: bgla)[#lorem(20)],
      text(fill: la)[#lorem(20)],
      text(fill: laac)[#lorem(20)],
      text(fill: ac)[#lorem(20)],
      text(fill: acda)[#lorem(20)],
      text(fill: da)[#lorem(20)],
      text(fill: datx)[#lorem(20)],
      text(fill: tx)[#lorem(20)],
    )

    [
      = Heading 1
      #lorem(50)
      == Heading 2
      #lorem(50)
      === Heading 3
      #lorem(50)
      ==== Heading 4
      #lorem(50)
      ===== Heading 5
      #lorem(50)
      ====== Heading 6
      #lorem(50)

      - Unordered List
        - Indent :3333
          - MOAR Indent
      - PINGAS

      + Ordered List
        + Indent :3333
          + #[MOAR Indent]<hl-tx>
      + PINGAS

      The quadratic equation is $x = (-b +- sqrt(b^2 -4\a\c))/(2a)$. Euler's identity
      is $e^(pi\i) + 1 = 0$, and the idea that $e = m\c^2+p\c$ does your mom and your
      senator.
      $ f(a,b,c,d,x) = a\x^3 + b\x^2 + c\x + d $

      #figure(
        table(
          columns: (1fr, 1fr, 1fr),
          [#[Apple]<hl-tx>],
          [#[Apple]<hl-datx>],
          [#[Apple]<hl-da>],
          [#[Apple]<hl-da2>],
          [#[Apple]<hl-acda>],
          [#[Apple]<hl-ac>],
          [#[Apple]<hl-laac>],
          [#[Apple]<hl-la>],
          [#[Apple]<hl-la2>],
          [#[Apple]<hl-bgla>],
          [#[Apple]<hl-bg>],
          table.cell()[FAGGOT],
        ),
        caption: [PINGAS],
      )

      #[Apple]<hl-tx> PINGAS
      #[Apple]<hl-datx> PINGAS
      #[Apple]<hl-da> PINGAS
      #[Apple]<hl-da2> PINGAS
      #[Apple]<hl-acda> PINGAS
      #[Apple]<hl-ac> PINGAS
      #[Apple]<hl-laac> PINGAS
      #[Apple]<hl-la> PINGAS
      #[Apple]<hl-la2> PINGAS
      #[Apple]<hl-bgla> PINGAS
      #[Apple]<hl-bg> PINGAS

      #quote(attribution: "Your Mom")[
        #lorem(100)
      ]

      / Penis: Penis
      / Penis: Penis
      / Penis: Penis
      / Penis: Penis

      #image("example.jpeg")

    ]

    [\ 0123456789]
    counter(heading).update(0)
    heading(outlined: false, numbering: "1")[END OF DEBUG CONTENT]

    rpcoverpage()
  } else {
    body
  }
}

// TEXT COLOUR FUNCTIONS --- TEXT COLOUR FUNCTIONS --- TEXT COLOUR FUNCTIONS --- TEXT COLOUR FUNCTIONS ---

#let bg(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = rgb(eval("coll." + cs, scope: (coll: coll)).bg)
  } #set text(fill: dum); #body ]

#let bgla(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = color.mix(
      rgb(eval("coll." + cs, scope: (coll: coll)).bg),
      rgb(eval("coll." + cs, scope: (coll: coll)).la),
    )
  } #set text(fill: dum); #body ]

#let la(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = rgb(eval("coll." + cs, scope: (coll: coll)).la)
  } #set text(fill: dum); #body ]

#let laac(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = color.mix(
      rgb(eval("coll." + cs, scope: (coll: coll)).la),
      rgb(eval("coll." + cs, scope: (coll: coll)).ac),
    )
  } #set text(fill: dum); #body ]

#let ac(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = rgb(eval("coll." + cs, scope: (coll: coll)).ac)
  } #set text(fill: dum); #body ]

#let acda(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = color.mix(
      rgb(eval("coll." + cs, scope: (coll: coll)).ac),
      rgb(eval("coll." + cs, scope: (coll: coll)).da),
    )
  } #set text(fill: dum); #body ]

#let da(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = rgb(eval("coll." + cs, scope: (coll: coll)).da)
  } #set text(fill: dum); #body ]

#let datx(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = color.mix(
      rgb(eval("coll." + cs, scope: (coll: coll)).da),
      rgb(eval("coll." + cs, scope: (coll: coll)).tx),
    )
  } #set text(fill: dum); #body ]

#let tx(cs, body) = [ #let dum = black; #if (coll.at(cs, default: "nane") != "nane") {
    dum = rgb(eval("coll." + cs, scope: (coll: coll)).tx)
  } #set text(fill: dum); #body ]

#let freaky = "𝓯𝓻𝓮𝓪𝓴𝔂";
#let cock = text(font:"Noto Sans EgyptHiero", weight: 900)[𓂸];
#let lenny = text(font: "Segoe UI", "( ͡° ͜ʖ ͡°)");

#let big(n, body) = [ #text(size: 1em + (0.167em * n))[#body] ]
#let sml(n, body) = [ #text(size: 1em - (0.167em * n))[#body] ]
#let al-left(body) = [ #align(left)[#body] ]
#let al-centre(body) = [ #align(center)[#body] ]
#let al-right(body) = [ #align(right)[#body] ]

#let cpf(label) = cite(label, form: "prose")