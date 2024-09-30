#import "@jx/jx-style:0.2.0": *
#show: docu.with(
  docutype: "paper",
  rp-authors: (
    rp-author("Clarkson", "Jeremy Charles Robert"),
    rp-author("Hammond", "Richard Mark"),
    rp-author("May", "James Daniel"),
  ),
  rp-title: "Strange Bugs and Where To Find Them",
  rp-subtitle: [A Sample of `jx-style`'s research paper format],
  rp-supplement: lorem(10),
  rp-supplement2: lorem(6),
  rp-school: "Squidward Community College",
  rp-subject: "Inquiries, Investigation, and Immersion",
  section: "BSIT-1A",

  rp-submittedTo: "The BBC",
  font: "tex gyre heros"
)

#show "ae": "æ"
#show "oe": "œ"

= Pingas Blast
#let lorems = lorem(50)
#lorem(50) `pingas` #lorem(20)

```cs 
namespace yourMom;
public class PINGAS {
  public static void Main() {
    Console.WriteLine("SnooPINGAS usual, I see?")
  }
}
```