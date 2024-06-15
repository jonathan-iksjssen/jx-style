#let sadave = datetime.today().display("[day padding:none] [month repr:short] [year repr:full]");
#let daycolours = (
  rgb("#93C5FD50"),
  rgb("#FCA5A550"),
  rgb("#86EFAC50"),
  rgb("#FDE04750"),
  rgb("#67E8F950"),
  rgb("#F0ABFC50"),
  rgb("#D4D4D450"),
)
#let wdn = datetime.today().weekday() - 1;
#let weekdays = ("M", "T", "W", "H", "F", "R", "S");
#let sadaveVerbose = sadave + " " + weekdays.at(wdn);