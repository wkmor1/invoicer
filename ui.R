library(rhandsontable)
fluidPage(
  fluidRow(
    column(
      width = 4,
      tagList(
        div(strong("To"), style = "margin-top:20%;"),
        tags$style(type = "text/css", "textarea {width:410px}"),
        tags$textarea(id = "to", placeholder = "", rows = 3, "")
      ),
      rHandsontableOutput("input_table"),
      numericInput("paid", "Paid", 0, 0, step = 1, width = "149px"),
      downloadButton("downloadInvoice", "Generate Invoice"),
      offset = 4
    )
  )
)
