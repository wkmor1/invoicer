library(shiny)

shinyUI(
  fluidPage(
    title = "InvoiceR",
    sidebarLayout(
      sidebarPanel(
        downloadButton("downloadInvoice")
      ),
      mainPanel()
    )
  )
)
