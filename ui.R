library(rhandsontable)

textAreaInput = function(
  inputId, label, value = "", placeholder = "", rows = 3) {
  tagList(
    div(strong(label), style = "margin-top: 5px;"),
    tags$style(type = "text/css", "textarea {width:100%; margin-top: 5px;}"),
    tags$textarea(id = inputId, placeholder = placeholder, rows = rows, value)
  )
}

shinyUI(
  fluidPage(
    sidebarLayout(
      sidebarPanel(
        textAreaInput("to", "To"),
        rHandsontableOutput("input_table"),
        numericInput("paid", "Paid", 0, 0, step = 1),
        downloadButton("downloadInvoice")
      ),
      mainPanel(
      )
    )
  )
)
