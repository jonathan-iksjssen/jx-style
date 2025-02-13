#let dateformat = "[day padding:none] [month repr:short]. [year repr:full]"
#let sadave = datetime.today().display(dateformat);
#let daycolours = (
  rgb("#3574ef50"),
  rgb("#d8364d50"),
  rgb("#00984d50"),
  rgb("#edb70050"),
  rgb("#00d5dd50"),
  rgb("#d457c050"),
  rgb("#90909050"),
)
#let wdn = datetime.today().weekday() - 1;
#let weekdays = ("M", "T", "W", "H", "F", "R", "S");
#let sadaveVerbose = sadave + " " + weekdays.at(wdn);
#let render-date(y,m,d) = {
  let f = datetime(year: y, month: m, day: d)
  return f.display(dateformat) + " " + weekdays.at(f.weekday() - 1);
}