#import "irgot.typ": coll
#import "catppuccin.typ": *
#import "jx-date.typ": *
#let irgo(cs, val) = coll.at(cs, default: "default").at(val)

#let shl(body) = strong[#[#body]<t-ac>]
#let img(body) = [#[#body]<img>]
#let q-bg(body) = [#[#body]<t-bg>]
#let q-bgla(body) = [#[#body]<t-bgla>]
#let q-la(body) = [#[#body]<t-la>]
#let q-laac(body) = [#[#body]<t-laac>]
#let q-ac(body) = [#[#body]<t-ac>]
#let q-acda(body) = [#[#body]<t-acda>]
#let q-da(body) = [#[#body]<t-da>]
#let q-datx(body) = [#[#body]<t-datx>]
#let q-tx(body) = [#[#body]<t-tx>]
#let hl-bg(body) = [#[#body]<hl-bg>]
#let hl-bgla(body) = [#[#body]<hl-bgla>]
#let hl-la(body) = [#[#body]<hl-la>]
#let hl-laac(body) = [#[#body]<hl-laac>]
#let hl-ac(body) = [#[#body]<hl-ac>]
#let hl-acda(body) = [#[#body]<hl-acda>]
#let hl-da(body) = [#[#body]<hl-da>]
#let hl-datx(body) = [#[#body]<hl-datx>]
#let hl-tx(body) = [#[#body]<hl-tx>]
#let qhl-bg(body) = [#[#body]<qhl-bg>]
#let qhl-bgla(body) = [#[#body]<qhl-bgla>]
#let qhl-la(body) = [#[#body]<qhl-la>]
#let qhl-laac(body) = [#[#body]<qhl-laac>]
#let qhl-ac(body) = [#[#body]<qhl-ac>]
#let qhl-acda(body) = [#[#body]<qhl-acda>]
#let qhl-da(body) = [#[#body]<qhl-da>]
#let qhl-datx(body) = [#[#body]<qhl-datx>]
#let qhl-tx(body) = [#[#body]<qhl-tx>]
#let colsel(colsc: "default", value: "ac", body) = {
  let colselections = (
    bg: irgo(colsc, bg),
    bgla: irgo(colsc, bg).mix(irgo(colsc, la)),
    la: irgo(colsc, la),
    laac: irgo(colsc, la).mix(irgo(colsc, ac)),
    ac: irgo(colsc, ac),
    acda: irgo(colsc, ac).mix(irgo(colsc, da)),
    da: irgo(colsc, da),
    datx: irgo(colsc, da).mix(irgo(colsc, tx)),
    tx: irgo(colsc, tx),
  )
  set text(fill: colselections.at(value))
  body
}
#let triangle = polygon.regular.with(vertices: 3)
#let pentagon = polygon.regular.with(vertices: 5)
#let hexagon = polygon.regular.with(vertices: 6)
#let heptagon = polygon.regular.with(vertices: 7)
#let octagon = polygon.regular.with(vertices: 8)
#let freaky = "𝓯𝓻𝓮𝓪𝓴𝔂";
#let cock = text(font: "Noto Sans EgyptHiero", weight: 900)[𓂸];
#let lenny = text("( ͡° ͜ʖ ͡°)");
#let amogus = "ඞ";
#let ex = text([*Examples:*])
#let ns = text([*Number Sentence:*])
#let th = super("th")
#show "« ": "«" + sym.space.nobreak;
#show " »": sym.space.nobreak + "»";
#show "‹ ": "‹" + sym.space.nobreak;
#show " ›": sym.space.nobreak + "›";
#let signature(n) = {set text(font: "JX-Symbols", size: 5em * n); box[J]}
#let big(n: 2, body) = [ #text(size: 1em * calc.pow(1.2, n))[#body] ]
#let sml(n: 2, body) = [ #text(size: 1em / calc.pow(1.2, n))[#body] ]
#let al-left(body) = [ #align(left)[#body] ]
#let al-centre(body) = [ #align(center)[#body] ]
#let al-right(body) = [ #align(right)[#body] ]
#let centre = center
#let cpf(label) = cite(label, form: "prose")
#let hr = block(line(length: 100%))
#let twinfantasy = box(image("twinfantasy.jpg", height: 1.5em, width: 1.5em))
#let solidStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "solid")
#let dottedStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "dotted")
#let dashedStroke(th: 1pt, c) = (paint: c, thickness: th, dash: "dashed")

#let linehl(body) = [
#[#body]<linehl>
]

#let hl(back, body) = [
  #box(
    inset: (x: 0pt),
    outset: (y: 0.45em),
    stroke: (y: solidStroke(back)),
    fill: none,
  )[
    #box(
      inset: (x: 0.33em),
      outset: (y: 0.3em),
      fill: back,
    )[#text()[#strong[#body]]]
  ]
]
#let squarehl(back, body) = [
  #box(
    inset: (x: 0.15em),
    outset: (y: 0.45em),
    stroke: (solidStroke(back)),
    fill: none,
  )[
    #box(
      inset: (x: 0.33em),
      outset: (y: 0.35em, x: 0.05em),
      fill: back,
    )[#text()[#strong[#body]]]
  ]
]
#let callout(
  title: "",
  body: "",
  width: 200% / 3,
  alignment: center,
) = [
  #align(alignment)[#block(width: width)[
      #stack(
        dir: ttb,
        spacing: 0in,
        if (title != "") {
          [#[#title]<cct-tx>]
        },
        if (body != "") {
          [#[#body]<ccb-bgla>]
        },
      )
    ]]
]
#let docu(
  docutype: "blankhead", // DETERMINES WHAT KIND OF DOCUMENT IT WILL BE. CHECK THE VARIABLE validDocTypes A BIT BELOW.
  author: "", // AUTHOR. CAN EITHER BE A STRING OR AN ARRAY. NOT USED FOR PAPERS.
      // // ALL FIELDS BEGINNING WITH rp- ARE ONLY USED IN PAPERS (i.e. docutypes "paper" and "businessPlan")
      rp-title: "", // PAPER TITLE.
      rp-authors: (), // PAPER AUTHORS. IS AN ARRAY.
      rp-authors-limit: 6,
      rp-school: "", // PAPER SCHOOL.
      rp-submittedTo: "", // PAPER SUBMITTED TO THIS PERSON.
      rp-keywords: (), // PAPER KEYWORDS. FOR FUTURE USE. STILL GONNA USE THIS STYLEFILE IN COLLEGE.
      rp-subtitle: [], // EXTRA PAPER SUBTITLES SHOULD THE FORMAT DEMAND IT.
      rp-supplement: [],
      rp-supplement2: [],
      rp-header: [], // PAPER HEADER.
      rp-subject: [], // PAPER SUBJECT.
      // // FIELDS EXCLUSIVE TO "schooldoc" OR "notes" DOCUTYPES
      section: "", // SECTION. HIDDEN BY DEFAULT UNLESS FLAG "showsection" is set
      subject: "", // SUBJECT THE DOCUMENT IS FOR. ONLY SHOWS UP IN DOCUTYPES "notes" AND "schooldoc".
      cod: "", // JXC-10 ASSIGNMENT OR DOCUMENT CODE.
      // // FIELDS EXCLUSIVE TO "writing" and "writingVerbose" DOCUTYPES
      rating: "", // RATING OF DOCUMENT OR ARTICLE.
      tags: (), // TAGS OF ARTICLE.
  title: "", // TITLE OF DOCUMENT.
  subtitle: "", // SUBTITLE OF DOCUMENT.
  description: "", // DOCUMENT DESCRIPTION.
  // // DOCUMENT SETTINGS
  colsc: "default", // COLOUR SCHEME OF THE DOCUMENT. SEE irgot.typ
  bgtint: none, // TINT ON BACKGROUND COLOUR. SEE DECLARATION OF VARIABLE bg IN SECTION « COLOUR DEFS »
  size: "print", // PAGE SIZE PRESET. SEE SECTION « PAGE ».
  date: datetime.today().display("[day padding:none] [month repr:short]. [year repr:full]"), // DATE TO DISPLAY IN THE DOCUMENNT. DEFAULTS TO THE CURRENT DAY.
  doc-columns: 1, // NUMBER OF COLUMNS FOR THE DOCUMENT CONTENT.
  outcols: 1, // NUMBER OF COLUMNS FOR THE TABLE OF CONTENTS.
  imagewidth: 2/3, // WIDTH OF IMAGES.
  // //  HEADINGS
  headingstyle: "block", // HEADING STYLE. ONE OF ("book", "block", "lines", "simple", "old").
  headingnum: "1.1.1", // HEADING NUMBERING STYLE. SEE TYPST'S NUMBERING FUNCTION.
  headingprefix: "", // TEXT TO PREPEND ALL HEADINGS WITH.
  headingsup: "Section", // NAME FOR EACH HEADING.
  refsup: "§", // SUPPLEMENT FOR REFERENCES. ONLY APPLIES WHEN FLAG "refsups" IS SET
  // // TEXT AND FONT
  font: "Iosevka SS14", // FONT FOR THE DOCUMENT.
  font2: "", // SECONDARY FONT FOR HEADINGS. NOT YET IMPLEMENTED
  fw: "regular", // FONT WEIGHT FOR THE DOCUMENT.
  fz: 12pt, // FONT SIZE FOR THE DOCUMENT
  rawsize: 0.9, // SIZE MULTIPLIER FOR raw() TEXT.
  mathscale: 1, // SCALE OF MATH TEXT.
  linespacing: 1, // SPACING BETWEEN EACH LINE.
  parspacing: 1, // SPACING BETWEEN EACH PARAGRAPH.
  flags: (), // FLAGS. SEE flags-documentation.md FOR DETAILS.
  table-settings: (), // TABLE SETTINGS.
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
  if (type(docutype) not in (str, int) and doctype not in validDoctypes) {
    panic("Invalid doctype!")
  }
  if (type(author) != str and type(author) != array) {
    panic("Field `author` must be a string or an array!")
  }
  if (docutype == "notes") {
    title = subject + ": Notes"
    headingstyle = "book"
    flags.push("ampersand")
    flags.push("separate-outline")
    flags.push("separate-bib")
    flags.push("hl-outlined-h1")
  }
  // COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS --- COLOUR DEFS ---
  let bg = if (bgtint == "pine") {
    color.mix((coll.at(colsc, default: "default").at("bg"), 33%), (rgb("#EFEBE9"), 67%))
  } else if (bgtint == "grey") {
    coll.at(colsc, default: "default").at("bg").desaturate(100%)
  } else {
    coll.at(colsc, default: "default").at("bg")
  } // BG; 50
  let la = coll.at(colsc, default: "default").at("la") // lightAccent; 200
  let ac = coll.at(colsc, default: "default").at("ac") // Accent; 600
  let da = coll.at(colsc, default: "default").at("da") // darkAccent; 800
  let tx = coll.at(colsc, default: "default").at("tx") // Text; 950
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
    } else if (font.contains("Andika")) {(
      "ss01": 1,
      "cv04": 1,
      "cv10": 1,
      "cv31": 1,
      "cv35": 1,
      "cv39": 1,
      "cv43": 2,
      "cv51": 1,
      "cv52": 1,
      "cv67": 1,
      )
    } else if (font == "Iosevka") {(
      "ss14": 1,
      "cv03": 3,
      "cv04": 5,
      "cv06": 1,
      "cv09": 1, 
      "cv10": 4,
      "cv14": 4,
      "cv19": 2,
      "cv20": 2,
      "cv21": 11,
      "cv23": 4,
      "cv26": 4,
      "cv27": 9,
      "cv41": 18,
      "cv44": 8,
      "cv45": 2,
    )} else {
      ()
    },
    tracking: if (font.contains("Iosevka Aile") or font.contains("Iosevka Etoile")) {
      -0.5pt
    } else {
      0pt
    },
    spacing: if (font.contains("Iosevka Aile") or font.contains("Iosevka Etoile")) {
      400% / 5
    } else {
      100%
    },
    costs: ( hyphenation: 200%, runt: 200%, widow: 200%, orphan: 200%, )
  )
  show raw: set text(font: "Iosevka SS14", size: 1.25em)
  show raw.where(block: false): b => box(
    fill: la.transparentize(80%),
    radius: 0.25em,
    inset: (x: 0.25em),
    outset: (y: 0.3em),
    stroke: solidStroke(laac.transparentize(50%)),
  )[#text(size: 1em * rawsize)[#b]]
  show raw.where(block: true): it => {
    set text(size: 1em * rawsize)
    show raw.line: it => {
      let color = if calc.odd(it.number) {
        color.mix(bg, bgla)
      } else {
        bg
      }
      let body = if it.body == [] {
        sym.space
      } else {
        it.body
      }
      let num = it.number
      box(
        fill: color,
        width: 100%,
        outset: par.leading / 2,
        grid(
          columns: (2em, 1fr),
          align: (horizon + right, left),
          inset: (y: 0em, x: 0.5em),
          sml(n: 1.25, q-laac(str(num))), body,
        ),
      )
    }
    block(breakable: true)[#it #place(top + right)[#q-ac[[#it.lang]]]]
  }
  show raw.where(block: true): hi => al-centre(
    block(
      stroke: dottedStroke(th: 1pt, ac),
      outset: (par.leading / 2) + 0.5pt,
      radius: 0.25em,
      spacing: 2em,
      width: if (flags.contains("reduced-codeblocks")) {
        200% / 3
      } else {
        95%
      },
      hi,
    ),
  )
  set par(justify: true, leading: linespacing * 0.9em, spacing: 1em * 2 *  parspacing)
  
  show math.equation: m => if (font.contains("Fira")) {
    text(font: "Fira Math")[#m]
  } else {  
    text(font: "TeX Gyre Schola Math")[#m]
  }
  show math.equation.where(block: false): set text(size: 1em)
  show math.equation.where(block: true): me => [#set text(size: 1.5em * mathscale); #set block(breakable:true); #align(center)[#me]]
  show link: set text(..fill-ac)
  // OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES --- OUTLINES ---
  let headingPrefixDisplay = if (headingprefix == "") {
    none
  } else {
    headingprefix + sym.space
  }
  set outline(
    depth: 3,
    indent: 2em,
    title: if (doctype in ("businessPlan", "paper")) {
      none
    } else {
      "Table of Contents"
    },
    fill: if (flags.contains("narrow-outline-fills")) {
      repeat[.#sym.space#sym.zwnj]
    } else {
      repeat[#sym.space#sym.zwnj.#sym.space#sym.zwnj]
    },
  )
  show outline.entry.where(level: 1): ol => if (flags.contains("hl-outlined-h1")) {
    box(outset: par.leading / 2, fill: bgla, strong(ol))
  } else {
    strong[#headingPrefixDisplay#ol]
  }
  show outline.entry.where(level: 2): ol => q-da(headingPrefixDisplay + ol)
  show outline.entry.where(level: 3): ol => q-ac(headingPrefixDisplay + ol)

  show outline.entry: a => {
    a
  }

  show outline: a => if (doctype in ("businessPlan", "paper")) {
    show heading: he => {
      h(1fr) + hl-tx[#he.body] + h(1fr)
      v(-0.5em)
    }
    [#page(columns: outcols)[ #align(horizon + center)[#block(width: 100%, a)]~] ]
  } else {
    show heading: he => text(1em / 1.167)[#al-centre[#[#he.body]<cct-datx>]]
    if (flags.contains("separate-outline")) {
      align(horizon + center, columns(outcols)[#a])
      pagebreak(weak: true)
    } else {
      a
    }
  }
  // BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES --- BLOCKQUOTES ---
  set quote(block: true)
  show quote: q => [
    #pad(1em)[
      #block(breakable: false, fill: color.mix(bg, bgla), inset: (x: 2em, y: 2.5em))[
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
  set list(
    tight: false,
    marker: ([#sym.circle.filled.tiny], [#sym.circle.stroked.small], [#sym.triangle.filled.small.r], [#sym.triangle.stroked.small.r]),
  )
  set terms(tight: false)
  show terms.item: k => block(inset: (y: 0.167em))[- #[#k.term]<hl-la> #sym.arrow.r.double.long #k.description]
  // PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE --- PAGE ---
  set document(
    title: if (title == "") { } else {
      if (cod != "") {
        code
        sym.space
        "-"
        sym.space
      }
      title
    },
    author: if (type(author) == str) {
      author
    } else if type(author) == array {
      (..author,).join("; ")
    },
    date: datetime.today(),
    keywords: (repr(title), repr(subtitle), ..rp-keywords),
  )
  set page(
    fill: bg,
    //DEFAULT PAGE SIZE: 8.5in x 11in, 0.5in margin on all sides
    width: if (size == "longbond") { 8.5in
    } else if (size == "longbond-l") { 13in
    } else if (size == "print-l") { 11in
    } else if (size == "phone") { 7in
    } else if (size == "notebook") { 5.5in
    } else if (size == "tablet") { 10in
    } else if (size == "pc") { 12in
    } else if (size == "a4") { 210mm
    } else if (size == "longlong") { 14in
    } else if (size == "book-a") { 5.75in
    } else if (size == "book-b") { 7.5in
    } else if (size == "square") { 8in
    } else if (size == "auto") { 7in
    } else { 8.5in },
    height: if (size == "longbond") { 13in
    } else if (size == "longbond-l") { 8.5in
    } else if (size == "print-l") { 8.5in
    } else if (size == "phone") { 14in
    } else if (size == "notebook") { 7.5in
    } else if (size == "tablet") { 6in
    } else if (size == "pc") { 7.5in
    } else if (size == "a4" ) { 297mm
    } else if (size == "longlong") { 8in
    } else if (size == "book-a") { 9in
    } else if (size == "book-b") { 10.25in
    } else if (size == "square") { 8in
    } else if (size == "auto") { auto
    } else { 11in },
    margin: (
      y: 0.75in,
      rest: if(flags.contains("shineformat")){1in}else{0.5in},
      bottom: if (flags.contains("nofoot")) { 0.75in } else { 1in },
      top: if (rp-header == []) { 0.75in } else { 1in },
    ),
    
    header: [
    #if(rp-header != []){[ #rp-header #h(1fr) #rp-subject #v(-0.5em * parspacing)]};
    #if(not flags.contains("noheadline")) {
      line(length: 100%, stroke: dashedStroke(tx.transparentize(50%)))
    }
    ],
    footer: [
      #stack(dir: ttb, spacing: 1em)[
        #if(not flags.contains("nofootline")){line(length: 100%, stroke: dashedStroke(tx.transparentize(50%)))};
      ][
        #if (flags.contains("nofoot")) {} else [
        #if(flags.contains("blankfoot")) {} else [
          #if (cod != "") { code } else {}
        #if (rp-title != "" and not flags.contains("centrefoot")) { emph[#rp-title] } else if (title != "" and not flags.contains("centrefoot")) { emph[#title] }
      ] #h(1fr) #strong[#context counter(page).display()]#if(flags.contains("centrefoot")){h(1fr)}
      ]
      ]
    ],
    columns: doc-columns,
  )
  // #region HEADINGS
  // HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS --- HEADINGS ---

  show heading.where(level: 1): hy => if (flags.contains("centre-h1")) {
    align(center, hy)
  } else {
    hy
  }

  let headingPrefixDisplay = if (headingprefix == "") {
    none
  } else {
    headingprefix + sym.space
  }
  set heading(numbering: (..nums) => if (doctype == "businessPlan") {
    let format = ("I.", "A.", "1.", "I.", "A.", "1.").at(nums.pos().len() - 1)
    numbering(format, nums.pos().last())
  } else {
    numbering(headingnum, ..nums)
  })
  set heading(supplement: headingsup)
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
          grid.cell(fill: tx, align: left)[#set text(weight: "black");#headingPrefixDisplay#counter(heading).display()],
          grid.cell(fill: gradient.linear(datx, tx))[#set text(weight: "black");#hy.body],
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
        stroke: (bottom: solidStroke(th: 2pt, tx)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(align: left)[#headingPrefixDisplay#counter(heading).display()],
          grid.cell()[#hy.body],
        )
      ]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H1 OLD STYLE
      #set text(size: 1.25em, fill: bg, weight: "bold")
      #block(width: 100%, fill: gradient.linear(datx, tx), inset: 0.5em, radius: 0.5em)[ #align(center)[#hy] ]
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
      #pagebreak(weak: true)
      #set block(breakable: false)
      #block(
        width: 100%,
        height: auto,
        inset: (top: 0em),
      )[
        #set par(leading: 0.5em)
        #align(top)[
          #block(
            stroke: (y: solidStroke(th: 2pt, ac)),
            width: 100%,
            inset: (y: 4pt),
            height: auto,
          )[#block(
              stroke: (y: solidStroke(th: 2pt, datx)),
              width: 100%,
              inset: (
                y: 0.66em,
                x: if (flags.contains("no-h1-indent")) {
                  0em
                } else {
                  0.25em
                },
              ),
              height: auto,
            )[
              #grid(columns: (auto, 1fr), inset: (x: 0.5em), align: (horizon + center, if(flags.contains("centre-h1-body")){horizon+center}else{horizon+left}),
                grid.cell(inset: (right: 1em, left: 0.75em), stroke: (right: dottedStroke(th: 2pt, ac)))[
                  #stack(
                    dir: ttb,
                    spacing: 0.125in * linespacing,
                    text(size: 1em, weight: "bold")[#hy.supplement],
                    text(size: 2em, weight: 900)[#headingPrefixDisplay#counter(heading).display()],
                  )
                ],
                grid.cell(inset: (left: 1em))[
                    #set par(justify: false)
                    #text(size: 1.75em, fill: tx, weight: 700)[#hy.body]
                ]
              )
              // #text(size: 2em, weight: "bold")[#headingsup #counter(heading).display()]
              // #v(-3.25em)
              // #text(size: 1.25em, fill: ac, weight: "regular", style: "italic")[#hy.body]
            ]
          ]]
      ]
    ]
  } else {
    set text(1.25em)
    [#hy]
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
          grid.cell(fill: acda, align: left)[#headingPrefixDisplay#counter(heading).display()],
          grid.cell(fill: gradient.linear(ac,acda))[#hy.body],
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
        stroke: (bottom: solidStroke(th: 2pt, ac)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(align: left)[#headingPrefixDisplay#counter(heading).display()],
          grid.cell()[#hy.body],
        )
      ]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H2 OLD STYLE
      #set text(size: 1.167em, fill: bg, weight: "bold")
      #block(width: 100%, fill: gradient.linear(ac, acda), inset: 0.5em, radius: 0.5em)[ #align(left)[#hy] ]
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
  } else {
    set text(1.167em)
    [#hy]
  }
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
          grid.cell(fill: color.mix(laac, la), align: left)[#headingPrefixDisplay#counter(heading).display()],
          grid.cell(fill: gradient.linear(la,laac))[#hy.body],
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
        stroke: (bottom: solidStroke(th: 2pt, la)),
        inset: (y: 3pt),
      )[
        #grid(
          columns: (auto, 1fr),
          inset: (x: 0.5em, y: 0.33em),
          grid.cell(align: left)[#headingPrefixDisplay#counter(heading).display()],
          grid.cell()[#hy.body],
        )
      ]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H3 OLD STYLE
      #set text(size: 1.083em, fill: tx, weight: "bold")
      #block(width: 100%, fill: gradient.linear(la, laac), inset: 0.5em, radius: 0.5em)[ #align(left)[#hy] ]
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
  } else {
    set text(1.083em)
    [#hy]
  }
  // -- HEADING 4 -- HEADING 4 -- HEADING 4 -- HEADING 4 --
  show heading.where(level: 4): hy => if (headingstyle in ("block", "book")) {
    parbreak()
    box[
      // -- H4 BLOCK STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (right: 0.15em),
        outset: (y: 0.4em),
        stroke: (left: none, rest: solidStroke(da)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: datx,
          )[#[#[#headingPrefixDisplay#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: da)[#[#[#hy.body]]],
        )
      ]
    ]
    h(0.5em)
  } else if (headingstyle == "simple") {
    [
      // -- H4 SIMPLE STYLE
      #set text(size: 1em, fill: tx, weight: "bold")
      #box(
        inset: (y: 0.33em),
        stroke: (bottom: solidStroke(tx)),
      )[#headingPrefixDisplay#counter(heading).display() #h(0.5em) #hy.body]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H4 OLD STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(fill: gradient.linear(datx, tx), inset: (x: 0.33em), outset: (y: 0.33em), radius: 0.33em)[
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
  } else {
    [#hy]
  }
  // -- HEADING 5 -- HEADING 5 -- HEADING 5 -- HEADING 5 --
  show heading.where(level: 5): hy => if (headingstyle in ("block", "book")) {
    parbreak()
    box[
      // -- H5 BLOCK STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(
        inset: (right: 0.15em),
        outset: (y: 0.4em),
        stroke: (left: none, rest: solidStroke(acda)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: acda,
          )[#[#[#headingPrefixDisplay#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: ac)[#[#[#hy.body]]],
        )
      ]
    ]
    h(0.5em)
  } else if (headingstyle == "simple") {
    [
      // -- H5 SIMPLE STYLE
      #set text(size: 1em, fill: da, weight: "bold")
      #box(
        inset: (y: 0.33em),
        stroke: (bottom: solidStroke(da)),
      )[#headingPrefixDisplay#counter(heading).display() #h(0.5em) #hy.body]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H5 OLD STYLE
      #set text(size: 1em, fill: bg, weight: "bold")
      #box(fill: gradient.linear(ac, acda), inset: (x: 0.33em), outset: (y: 0.33em), radius: 0.33em)[
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
  } else {
    [#hy]
  }
  // -- HEADING 6 -- HEADING 6 -- HEADING 6 -- HEADING 6 --
  show heading.where(level: 6): hy => if (headingstyle in ("block", "book")) {
    parbreak()
    box[
      // -- H6 BLOCK STYLE
      #set text(size: 1em, fill: tx, weight: "bold")
      #box(
        inset: (right: 0.15em),
        outset: (y: 0.4em),
        stroke: (left: none, rest: solidStroke(laac)),
        fill: none,
      )[
        #stack(
          dir: ltr,
          spacing: 0in,
          box(
            inset: (x: 0.5em),
            outset: (y: 0.25em),
            fill: color.mix(laac, la),
          )[#[#[#headingPrefixDisplay#counter(heading).display()]]],
          box(inset: (x: 0.5em), outset: (y: 0.25em), fill: la)[#[#[#hy.body]]],
        )
      ]
    ]
    h(0.5em)
  } else if (headingstyle == "simple") {
    [
      // -- H6 SIMPLE STYLE
      #set text(size: 1em, fill: ac, weight: "bold")
      #box(
        inset: (y: 0.33em),
        stroke: (bottom: solidStroke(acda)),
      )[#headingPrefixDisplay#counter(heading).display() #h(0.5em) #hy.body]
    ]
  } else if (headingstyle == "old") {
    [
      // -- H6 OLD STYLE
      #set text(size: 1em, fill: da, weight: "bold")
      #box(fill: gradient.linear(la, laac), inset: (x: 0.33em), outset: (y: 0.33em), radius: 0.33em)[
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
  } else {
    [#hy]
  }
  show heading: set block(spacing: 1em)
  show heading.where(level: 1): hy => if (font2 != "") {
    set text(font: font2)
    hy
  } else {
    hy
  }
  show heading: h => if(flags.contains("bodysizeheads")) {
    set text(fz); h
  } else { h }
  // #endregion
  // BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHY AND CITATIONS --- BIBLIOGRAPHYcite AND CITATIONS ---
  set ref(supplement: if (flags.contains("refsups")) {
    refsup
  })
  set cite(style: if ((doctype in ("businessPlan", "paper")) or flags.contains("use-apa")) {
    "apa"
  } else {
    "ieee"
  })
  show cite: set text(..fill-ac)
  show cite: a => {
    if (flags.contains("use-apa") or not flags.contains("super-refs")) {
      a
    } else {
      super(a)
    }
  }
  set super(typographic: false, size: 0.7em)
  set sub(typographic: false, size: 0.7em)
  set bibliography(
    style: if ((doctype in ("businessPlan", "paper")) or flags.contains("use-apa")) {
      "apa"
    } else {
      "ieee"
    },
    title: "References",
    full: true,
  )
  show bibliography: a => {
    if (flags.contains("separate-bib")) {
      pagebreak(weak: true)
    }
    show heading: h => if (headingstyle != "book") {
      text(1em / 1.167)[#al-centre[#[#h.body]<cct-datx>]]
    } else {
      [
        #pagebreak(weak: true)
        #set block(breakable: false)
        #block(
          width: 100%,
          height: auto,
          inset: (top: 0em),
        )[
          #set par(leading: 0.5em)
          #align(top)[
            #block(
              stroke: (y: solidStroke(th: 2pt, ac)),
              width: 100%,
              inset: (y: 4pt),
              height: auto,
            )[#block(
                stroke: (y: solidStroke(th: 2pt, datx)),
                width: 100%,
                inset: (
                  y: 0.66em,
                  left: if (flags.contains("no-h1-indent")) {
                    0em
                  } else {
                    0.25em
                  },
                ),
                height: auto,
              )[
                #grid(columns: (auto, auto), inset: (x: 0.5em), align: (horizon + center, horizon + left),
                  grid.cell(inset: (right: 1em), stroke: (right: dottedStroke(th: 2pt, ac)))[
                    #stack(
                      dir: ttb,
                      spacing: 0.125in * linespacing,
                      text(size: 2em, weight: "bold")[#sym.section],
                    )
                  ],
                  grid.cell(inset: (left: 1em))[
                    #set par(justify: false)
                    #text(size: 1.75em, fill: tx, weight: 700)[#h.body]
                  ]
                )
                // #text(size: 2em, weight: "bold")[#headingsup #counter(heading).display()]
                // #v(-3.25em)
                // #text(size: 1.25em, fill: ac, weight: "regular", style: "italic")[#hy.body]
              ]
            ]]
        ]
      ]
    }
    a
  }
  let amper = if (flags.contains("ampersand")) {
    " & "
  } else {
    " and "
  }
  let thornUpper = if (flags.contains("thorn")) {
    "Þ"
  } else {
    "TH"
  }
  let thornMixed = if (flags.contains("thorn")) {
    "Þ"
  } else {
    "Th"
  }
  let thornLower = if (flags.contains("thorn")) {
    "þ"
  } else {
    "th"
  }
  show "th": thornLower
  show "Th": thornMixed
  show "TH": thornUpper
  show " and ": amper
  // IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES --- IMAGES ---
  set image(fit: "contain", width: if(not flags.contains("no-image-resize")){100%}else{auto})
  show <img>: h => align(center)[
    #block(stroke: dottedStroke(th: 2pt, ac), fill: none, h)
    ]
  // TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES --- TABLES AND FIGURES ---
  show figure: set block(spacing: 1em)
  show figure.caption: emph
  set figure(numbering: "1.1.1", gap: 1em)
  show table: set par(justify: false)
  show table: tab => if(table-settings.contains("bordered")){rect(inset: 0em, stroke: 1pt + tx, tab)}else{tab}
  set table(
    fill: (x, y) => if (table-settings.contains("checker")) {
      if (y == 0) { tx }
      else if(calc.rem(x + y, 2) == 0) { bgla.mix(bg) } else { bg }
    } else if (table-settings.contains("matrix")) {
      if (y == 0 or x == 0) {
        if(calc.rem(x + y, 2) == 1) { datx.mix(tx) } else { tx }
      }
      else if(calc.rem(x + y, 2) == 0) { bgla.mix(bg) } else { bg }
    } else if (table-settings.contains("cols")) {
      if (y == 0) { if (calc.rem(x, 2) == 0) {tx}else{datx.mix(tx)} }
      else if (calc.rem(x, 2) == 0) { bgla.mix(bg) }
      else { bg }
    } else if (table-settings.contains("coltype")) {
      if (x == 0) { if (calc.rem(y, 2) == 0) {tx}else{datx.mix(tx)} }
      else if (calc.rem(y, 2) == 0) { bgla.mix(bg) }
      else { bg }
    } else if(not table-settings.contains("blank")){
      if (y == 0) { if (calc.rem(x, 2) == 0) {tx}else{datx.mix(tx)} }
      else if (calc.rem(y, 2) == 0) { bgla.mix(bg) }
      else { bg }
    },
    stroke: {
      if (table-settings.contains("h-stroke")) { (y: 1pt + tx, rest: none) }
      else if (table-settings.contains("v-stroke")) { (x: 1pt + tx, rest: none) }
      else if (table-settings.contains("hv-stroke")) { (1pt + tx) }
    },
    align: (x, y) => if (table-settings.contains("centre") or flags.contains("table-cen")) {
      horizon + center
    } else {
      if(table-settings.contains("coltype")) {
        if (x == 0) {horizon+centre} else {horizon + left}
      } else {
        if (y == 0) {horizon+centre} else {horizon + left}
      }
      
    },
    inset: 0.5em,
  )
  set grid(
    inset: 0.33em,
    align: if (table-settings.contains("centre") or flags.contains("grid-cen")) {
      horizon + center
    } else {
      horizon + left
    },
  )
  show table.cell.where(y: 0): k => if(not table-settings.contains("blank")){strong(text(..fill-bg)[#[#k]])}else{k}
  show table.cell.where(x: 0): k => if(table-settings.contains("matrix") or table-settings.contains("coltype")){strong(text(..fill-bg)[#[#k]])}else{k}
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
      outset: (y: 0.45em),
      stroke: (y: solidStroke(back)),
      fill: none,
    )[
      #box(
        inset: (x: 0.33em),
        outset: (y: 0.3em),
        fill: back,
      )[#text(fill: fore)[#strong[#body]]]
    ]
  ]
  let squarehl(back, fore, body) = [
    #box(
      inset: (x: 0.15em),
      outset: (y: 0.45em),
      stroke: (solidStroke(back)),
      fill: none,
    )[
      #box(
        inset: (x: 0.33em),
        outset: (y: 0.35em, x: 0.05em),
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
  show <qhl-tx>: body => squarehl(tx, bg, body)
  show <qhl-datx>: body => squarehl(datx, bg, body)
  show <qhl-da>: body => squarehl(da, bg, body)
  show <qhl-da2>: body => squarehl(da, la, body)
  show <qhl-acda>: body => squarehl(acda, bg, body)
  show <qhl-ac>: body => squarehl(ac, bg, body)
  show <qhl-laac>: body => squarehl(laac, tx, body)
  show <qhl-la>: body => squarehl(la, tx, body)
  show <qhl-la2>: body => squarehl(la, da, body)
  show <qhl-bgla>: body => squarehl(bgla, tx, body)
  show <qhl-bg>: body => squarehl(bg, tx, body)
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
  // COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS --- COMPLEX CALLOUTS ---
  let compCallTitle(back, fore, wid: 100%, body) = [
    #block(inset: (y: 2pt), fill: none, stroke: (y: solidStroke(back)))[
      #block(width: wid, inset: 0.67em, fill: back)[
        #set text(fill: fore, size: 1.167em, weight: "bold")
        #body
      ]
    ]
  ]
  let compCallBody(back, fore, wid: 100%, body) = [
    #block(inset: (2pt), fill: none, stroke: (solidStroke(back)))[
      #block(width: wid, inset: 0.67em, fill: back)[
        #set text(fill: fore)
        #body
      ]
    ]
  ]
  show <cct-tx>: body => compCallTitle(tx, bg, body)
  show <cct-datx>: body => compCallTitle(datx, bg, body)
  show <cct-da>: body => compCallTitle(da, bg, body)
  show <cct-da2>: body => compCallTitle(da, la, body)
  show <cct-acda>: body => compCallTitle(acda, bg, body)
  show <cct-ac>: body => compCallTitle(ac, bg, body)
  show <cct-laac>: body => compCallTitle(laac, tx, body)
  show <cct-la>: body => compCallTitle(la, tx, body)
  show <cct-la2>: body => compCallTitle(la, da, body)
  show <cct-bgla>: body => compCallTitle(bgla, tx, body)
  show <cct-bg>: body => compCallTitle(bg, tx, body)
  show <ccb-tx>: body => compCallBody(tx, bg, body)
  show <ccb-datx>: body => compCallBody(datx, bg, body)
  show <ccb-da>: body => compCallBody(da, bg, body)
  show <ccb-da2>: body => compCallBody(da, la, body)
  show <ccb-acda>: body => compCallBody(acda, bg, body)
  show <ccb-ac>: body => compCallBody(ac, bg, body)
  show <ccb-laac>: body => compCallBody(laac, tx, body)
  show <ccb-la>: body => compCallBody(la, tx, body)
  show <ccb-la2>: body => compCallBody(la, da, body)
  show <ccb-bgla>: body => compCallBody(bgla, tx, body)
  show <ccb-bg>: body => compCallBody(bg, tx, body)

  show <linehl>: body => block(
    width: 100%, outset: (x: 0.5em, y: 0.5em), inset: (y: 0em), fill: la, body
  )

  show regex("=\s*(.*?)\s*="): a => {show "=": none; q-ac(a)}
  show regex("==\s*(.*?)\s*=="): a => {show "==": none; shl(a)}
  show regex("===\s*(.*?)\s*==="): a => {show "===": none; hl-la(a)}

  show raw: h => {
    show regex("=\s*(.*?)\s*="): a => {show "=": "="; a}
    show regex("==\s*(.*?)\s*=="): a => {show "==": "==";a}
    show regex("===\s*(.*?)\s*==="): a => {show "===": "==="; a}
    h
  }

  // TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS --- TEXT FILLS ---
  show <t-tx>: t => text(fill: tx)[#t]
  show <t-datx>: t => text(fill: datx)[#t]
  show <t-da>: t => text(fill: da)[#t]
  show <t-acda>: t => text(fill: acda)[#t]
  show <t-ac>: t => text(fill: ac)[#t]
  show <t-laac>: t => text(fill: laac)[#t]
  show <t-la>: t => text(fill: la)[#t]
  show <t-bgla>: t => text(fill: bgla)[#t]
  show <t-bg>: t => text(fill: bg)[#t]
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
    #align(center + horizon)[ #rp-supplement2 ]
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
    margin: if(not flags.contains("shineformat")){0.5in}else{(x:1in, rest: 0.5in)},
    header: none,
    footer: none,
    columns: 1,
  )[
    #place(center + top)[#align(center + top)[
        #strong[#rp-school] \
        #emph[#rp-subject] \
        #section
      ]]
    #place(center + horizon)[#align(center + horizon)[
        #if (rp-title != "") {
          block(spacing: 3em)[#text(size: 3em, weight: 900)[#par(justify: false)[#strong[#rp-title]]]]
        }
        #if (rp-subtitle != "") {
          block(spacing: 3em)[#text(size: 2em)[#rp-subtitle]]
        }
        #if (rp-supplement != "") {
          block(spacing: 3em, width: 200% / 3)[#text(size: 1.5em)[#rp-supplement]]
        }
        #if (rp-supplement2 != "") {
          [#block(spacing: 3em, width: 200% / 3)[#text(size: 1.5em)[#rp-supplement2]]]
        }
      ]]
    #place(center + bottom)[#align(center + bottom)[
        _Submitted by:_ #linebreak()
        #if (rp-authors != "") {
          [
            #if (rp-authors.len() < rp-authors-limit) {
              for aut in rp-authors {
              let h = aut.split(", ")
              strong(h.at(0))
              ", "
              h.at(1)
              linebreak()
            }
            } else {
              show: columns.with(calc.floor(rp-authors.len()/rp-authors-limit))
              let ci = 0;
              for aut in rp-authors {
                let h = aut.split(", ");
                strong(h.at(0));
                ", ";
                h.at(1);
                ci += 1;
                if(calc.rem(ci,(rp-authors-limit+1)) != 0){linebreak();}else{colbreak()}
              }
            }
            
          ]
        }
        #linebreak()
        _Submitted to:_ #linebreak()
        #strong[#rp-submittedTo] #linebreak()
        #date
      ]]
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
  let authordisplay = if (type(author) == str) {
    author
  } else if (type(author) == array) {
    author.join("; ")
  }
  let sectiondisplay = if (flags.contains("showsection")) {
    emph(" — " + section)
  } else {
    none
  }
  let codedisplay = if (code != "") {
    set text(size: fz / rawsize)
    code
  } else {
    none
  }
  let dividerdisplay = if (flags.contains("nodivider")) { } else {
    box[
      #line(length: 100%, stroke: solidStroke(tx))]
  }
  let schooldocTitleDisplay = if (title != "") {
    [#[#emph[#title]]<hl-ac>]
  } else {
    none
  }
  let subjectdisplay = if (subject != "") {
    [#[#subject]<hl-da>]
  }
  // SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT --- SCHOOLDOC OR NOTES FORMAT ---
  let sdheader() = if (not flags.contains("centrehead")) {
    [
      #stack(
        dir: ttb,
        spacing: linespacing * 1em,
        {
          strong(authordisplay) + sectiondisplay + h(1fr) + codedisplay
        },
        {
          box(stack(dir: ltr, subjectdisplay, schooldocTitleDisplay)) + h(1fr) + daterepr
        },
        block(inset: (top: linespacing * 0.25em), dividerdisplay),
      )
    ]
  } else {
    align(
      center,
      stack(
        dir: ttb,
        spacing: linespacing * 1em,
        {
          strong(authordisplay) + sectiondisplay
        },
        {
          box(stack(dir: ltr, subjectdisplay, schooldocTitleDisplay))
        },
        {
          codedisplay + "·" + daterepr
        },
        block(inset: (top: linespacing * 0.25em), dividerdisplay),
      ),
    )
  }
  let notesheader() = {
    align(
      center,
      stack(
        dir: ttb,
        spacing: linespacing * 1em,
        {
          strong(authordisplay) + sectiondisplay
        },
        {
          big(n: 1, box(stack(dir: ltr, subjectdisplay, hl-ac("Notes"))))
        },
        {
          codedisplay + "·" + daterepr
        },
        block(inset: (top: linespacing * 0.25em), dividerdisplay),
      ),
    )
  }
  if (doctype == "schooldoc") {
    sdheader()
  }
  if (doctype == "notes") {
    notesheader()
    outline()
  }
  // ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT --- ARTICLE FORMAT ---
  let articleheader(verbose: false) = align(if (flags.contains("centrehead")) {
    center
  } else {
    left
  })[
    #[#text(weight: 900)[#title]]<b1> #linebreak()
    #if (subtitle != "") {
      [#strong[#[#subtitle]<b3> ] #linebreak()]
    }
    #if (description != "") {
      [#emph[#description] #linebreak()]
    }
    #if (verbose == true) {
      [
        *Tags:* #for i in tags{
          set underline(stroke: (dash: "dashed"))
          underline(i) + ","
        }
      ]
    }
    #dividerdisplay
  ]
  if (doctype == "article") {
    articleheader()
  }
  if (doctype == "articleVerbose") {
    articleheader(verbose: true)
  }
  // WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT --- WRITING FORMAT ---
  let writingheader(verbose: false) = align(if (flags.contains("centrehead")) {
    center
  } else {
    left
  })[
    #[#text(weight: 900)[#title]]<b1> #linebreak()
    #strong[Description: ] #emph[#description] #linebreak()
    #if (verbose == true) {
      [
        *Rating:* #rating #linebreak()
        *Tags:* #for i in tags{
          set underline(stroke: (dash: "dashed"))
          underline(i) + ", "
        }
      ]
    }
    #dividerdisplay
  ]
  if (doctype == "writing") {
    writingheader()
  }
  if (doctype == "writingVerbose") {
    writingheader(verbose: true)
  }
  // DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT --- DIARY ENTRY FORMAT ---
  let diaryheader() = [
    #align(if (flags.contains("centrehead")) {
      center
    } else {
      left
    })[ #daterepr ]<b1>
  ]
  if (doctype == "diaryEntry") {
    flags.push("centrefoot")
    diaryheader()
  }
  // DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG --- DEBUG ---
  if (debug) {
    {
      heading(outlined: false, numbering: none)[DEBUG MODE]
      heading(outlined: false, numbering: none, level: 2)[Parameters]
      align(center)[
        #table(
          columns: (auto, auto, auto),
          stroke: (y: dottedStroke(th: 1pt, laac)),
          "Parameter", "Value", "Type",
          `docutype`, repr(docutype), repr(type(docutype)),
          `author`, repr(author), repr(type(author)),
          `rp-title`, repr(rp-title), repr(type(rp-title)),
          `rp-authors`, repr(rp-authors), repr(type(rp-authors)),
          `rp-school`, repr(rp-school), repr(type(rp-school)),
          `rp-submittedTo`, repr(rp-submittedTo), repr(type(rp-submittedTo)),
          `rp-keywords`, repr(rp-keywords), repr(type(rp-keywords)),
          `rp-subtitle`, repr(rp-subtitle), repr(type(rp-subtitle)),
          `rp-supplement`, repr(rp-supplement), repr(type(rp-supplement)),
          `rp-supplement2`, repr(rp-supplement2), repr(type(rp-supplement2)),
          `rp-header`, repr(rp-header), repr(type(rp-header)),
          `rp-subject`, repr(rp-subject), repr(type(rp-subject)),
          `section`, repr(section), repr(type(section)),
          `subject`, repr(subject), repr(type(subject)),
          `cod`, repr(cod), repr(type(cod)),
          `rating`, repr(rating), repr(type(rating)),
          `tags`, repr(tags), repr(type(tags)),
          `title`, repr(title), repr(type(title)),
          `subtitle`, repr(subtitle), repr(type(subtitle)),
          `description`, repr(description), repr(type(description)),
          `colsc`, repr(colsc), repr(type(colsc)),
          `bgtint`, repr(bgtint), repr(type(bgtint)),
          `size`, repr(size), repr(type(size)),
          `date`, repr(date), repr(type(date)),
          `doc-columns`, repr(doc-columns), repr(type(doc-columns)),
          `outcols`, repr(outcols), repr(type(outcols)),
          `imagewidth`, repr(imagewidth), repr(type(imagewidth)),
          `headingstyle`, repr(headingstyle), repr(type(headingstyle)),
          `headingnum`, repr(headingnum), repr(type(headingnum)),
          `headingprefix`, repr(headingprefix), repr(type(headingprefix)),
          `headingsup`, repr(headingsup), repr(type(headingsup)),
          `refsup`, repr(refsup), repr(type(refsup)),
          `font`, repr(font), repr(type(font)),
          `font2`, repr(font2), repr(type(font2)),
          `fw`, repr(fw), repr(type(fw)),
          `fz`, repr(fz), repr(type(fz)),
          `rawsize`, repr(rawsize), repr(type(rawsize)),
          `mathscale`, repr(mathscale), repr(type(mathscale)),
          `linespacing`, repr(linespacing), repr(type(linespacing)),
          `flags`, repr(flags), repr(type(flags)),
          `debug`, repr(debug), repr(type(debug)),
        )
      ]
      let sqdebug(a) = [#square(width: 2in, ..a, stroke: 2pt + tx)]
      align(
        center,
        block(
          grid(
            grid(
              columns: 3,
              row-gutter: 1em,
              sqdebug(fill-bg), sqdebug(fill-bgla), sqdebug(fill-la),
              repr(bg), repr(bgla), repr(la),
              sqdebug(fill-laac), sqdebug(fill-ac), sqdebug(fill-acda),
              repr(laac), repr(ac), repr(acda),
              sqdebug(fill-da), sqdebug(fill-datx), sqdebug(fill-tx),
              repr(da), repr(datx), repr(tx),
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
        senator. `PINGAS`
        $ f(a,b,c,d) = a\x^3 + b\x^2 + c\x + d $
        $ {x in #emoji.pizza | x <= 50#emoji.fries} $
        ```cs
        namespace joniksj;
        public class EntryPoint() {
          public static void Main() {
            console.log("snooPINGAS usual, I see.")
          }
        }
        ```
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
        #[Apple]<qhl-tx> PINGAS
        #[Apple]<qhl-datx> PINGAS
        #[Apple]<qhl-da> PINGAS
        #[Apple]<qhl-da2> PINGAS
        #[Apple]<qhl-acda> PINGAS
        #[Apple]<qhl-ac> PINGAS
        #[Apple]<qhl-laac> PINGAS
        #[Apple]<qhl-la> PINGAS
        #[Apple]<qhl-la2> PINGAS
        #[Apple]<qhl-bgla> PINGAS
        #[Apple]<qhl-bg> PINGAS
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
    }
  } else {
    body
  }
}