library(rhandsontable)

function(input, output) {
  invoice_no         = as.integer(Sys.time())
  invoice_file       = paste0("invoice_", invoice_no, ".pdf")
  to                 = reactive({input$to})
  paid               = reactive({input$paid})

  values             = reactiveValues()
  setHot             = function(x) values[["input_table"]] = x

  output$input_table = renderRHandsontable({
    if (!is.null(input$input_table)) {
      DF = hot_to_r(input$input_table)
    } else {
      DF = data.frame(Date = Sys.Date(), Hours = 0, Service = "", Ex_Rate = 0,
                      stringsAsFactors = FALSE)
    }
    setHot(DF)
    hot_table(rhandsontable(DF, width = 410), colWidths = c(100, 45, 150, 65))
  })

  output$downloadInvoice =
    downloadHandler(
      invoice_file,
      function(file) {
        rmarkdown::render(
          "invoice.Rmd",
          output_file = invoice_file,
          params = list(invoice_no  = invoice_no,
                        to          = to(),
                        paid        = paid(),
                        input_table = values[["input_table"]])
        )
        file.copy(invoice_file, file)
      }
    )
}
