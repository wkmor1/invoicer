shinyServer(
  function(input, output) {
    output$downloadInvoice =
      downloadHandler(
        "invoice.pdf",
        function(file) {
          rmarkdown::render("invoice.Rmd")
          file.copy("invoice.pdf", file)
        }
      )
    }
)
