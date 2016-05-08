shinyServer(
  function(input, output) {
    output$downloadInvoice =
      downloadHandler(
        "invoice.pdf",
        function(file) {
          system(". ~/.bash_profile")
          rmarkdown::render("invoice.Rmd")
          file.copy("invoice.pdf", file)
        }
      )
    }
)
