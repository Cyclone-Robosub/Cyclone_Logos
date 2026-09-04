  #let report(
    title: "", 
    subtitle: "", 
    date: none,
    org: "Cyclone RoboSub @ UC Davis", 
    logo: "Cyclone Propeller Logo CWRK.svg", 
    body
  ) = {

    if date == none {date = datetime.today().display("[month]/[day]/[year]")}
    
    set document(
      author: org, 
      title: title, 
      keywords: if org == "Cyclone RoboSub @ UC Davis" {"robotics, robot submarine, RoboSub, engineering"} else {""},
    )

    set text(
      font: "Montserrat",
      weight: "regular",
    )

    set par(
      justify: true
    )

    set page(
      paper: "us-letter", 
      height: auto,
      margin: (bottom: 1.2in),
      background: 
          place(
          bottom, 
          dy: 1pt,
          image("background.svg", width: 101%)
          ),
            header: context{
        set text(weight: "light", .8em)
        date
        h(1fr)
        counter(page).display("1")
      },
      footer: {
        set text(white, .8em, )
        set par(justify: false)
        align(right, block(width: 1.20in, align(right, org)))
        place(bottom + right, 
          dx: .75in, 
          dy: -.24in, 
          image(logo, width: .5in)
        )
      },
      footer-descent: 45%,
      
    )

    show heading: set text(1.2em)

    show heading: set text(font: "Prompt")
    show link: it => underline(text(blue, it))

    // Code Blocks
    show raw.where(block: false): box.with(
      fill: luma(240),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 3pt),
      radius: 2pt,
    )

    show raw.where(block: true): block.with(
      fill: luma(240),
      inset: 10pt,
      radius: 4pt,
    )

    set grid(gutter: .2in)



    // Title 
    text(font: "Righteous", weight: 700, 2.5em, title)
    v(-1.75em)
    text(weight: "light", 1.5em, subtitle)

    {
      show image: it => block(radius: .25em, clip: true, it)
      body

    }
    
  }