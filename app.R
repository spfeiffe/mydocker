

# Define UI for miles per gallon app ----
ui <- fluidPage		(
					titlePanel("Miles Per Gallon"),
					sidebarLayout	(
									sidebarPanel(),
									mainPanel	(
												textOutput("myTextOutput"),
												br(),
												textOutput("myTextOutput2")
												)
									),
					theme = bslib::bs_theme(version = "5") 
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
	#i <- installed.packages()
	#session_ID <- reactive({ as.character(floor(runif(1)*1e20)) })
	#output$myTextOutput <- renderPrint({ 
	#									paste0("session_ID = ", session_ID())
	#								 })
	#output$myTextOutput <- renderPrint({ 
	#									list.files()
	#								 })
	#output$myTextOutput <- renderPrint({ 
	#									cat(unname(sort(unique(i[,1]))), sep=" \n") 
	#								 })
	theCommand <- "echo $(pwd)"
	shQuote(theCommand, type="sh")
	output$myTextOutput <- renderPrint	({
										system2('echo $(pwd)', stdout=TRUE, stderr=TRUE) # bash equivalent of getwd() # 'echo $(pwd)"/app"' 
										})
	output$myTextOutput2 <- renderPrint	({
										getwd()
										})
}

shinyApp(ui, server)