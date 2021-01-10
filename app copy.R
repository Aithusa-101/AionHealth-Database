
library(dplyr)
library(leaflet)

library(DT)           
library(shiny)
library(shinydashboard)
library(googlesheets4)
library(googlesheets)

gs4_deauth()

shiny_token <- gs_deauth()
saveRDS(shiny_token, "shiny_app_token.rds")

# Define UI for application that draws a histogram
ui <- dashboardPage(
    dashboardHeader(title = "Aion Health"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Add information ", tabName = "AddInformation", icon = icon("plus"))
        ),
        sidebarMenu(
            menuItem("Maternal Database", tabName = "MaternalDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
            menuItem("Midwife Database", tabName = "MidwifeDatabase", icon = icon("cloud"))
        ),
        sidebarMenu(
            menuItem("Blood Banks", tabName = "MaternalDatabase", icon = icon("bank"))
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "AddInformation",
                    bootstrapPage(
                        
                        div(style="display:inline-block",textInput("Job Title", "Mother's Name", )),
                        div(style="display:inline-block",textInput("Employment Type", label="Employment Type", )),
                        div(style="display:inline-block",textInput("Salary", label="Salary", )),
                        div(style="display:inline-block",textInput("Industry", label="Industry", )),
                        div(style="display:inline-block",textInput("City", label="City", )),
                        div(style="display:inline-block",textInput("Country", label="Country", )),
                        div(style="display:inline-block",textInput("Deadline", label="Deadline", )),
                        div(style="display:inline-block",textInput("Working Hours", label="Working Hours(hr(s)/week)", )),
                        div(style="display:inline-block",textInput("Salary", label="Salary", )),
                        div(style="display:inline-block",textInput("Years of Experience", label="Minnimim year(s) of Experience", )),
                        div(style="display:inline-block",dateInput("Deadline", label="Deadline", )),
                        div(style="display:inline-block", textInput("Organization Name", label = "Organization Name")),
                        div(style="display:inline-block",textAreaInput("Mission ", label="Mission", height = 400,)),
                        div(style="display:inline-block",textAreaInput("About Organization ", label="About Organization",height = 400 )),
                        div(style="display:inline-block",textAreaInput("Job Functions ", label="Job Functions", height = 400,)),
                        div(style="display:inline-block",textAreaInput("Job Summary ", label="Job Summary", height = 400,)),
                        div(style="display:inline-block",textAreaInput("Qualification ", label="Qualification and Experience", height = 400,)),
                        div(style="display:inline-block",textAreaInput("Required Skills ", label="Required Skills",height = 400, )),
                        div(style="display:inline-block",textAreaInput("Optional Notes ", label="Optional Notes", height = 400,)),
                        div(style="display:inline-block",textAreaInput("HowtoApply ", label="How to Apply", height = 400, )),
                        fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            tabItem(tabName = "MaternalDatabase",
                    bootstrapPage(
                        column(12, div(
                            dataTableOutput("dataTable")
                        )),
                        fluidPage(div(style="display:inline-block",  downloadButton('download',"Download")))
                        
                    )),
            tabItem(tabName = "MidwifeDatabase",
                    tabsetPanel(
                        id = "tabs",
                        tabPanel(
                            title = "Main Dashboard",
                            value = "page1",
                            fluidRow(
                                valueBoxOutput("vbox1"),
                                valueBoxOutput("vbox2"),
                                valueBoxOutput("vbox3")
                                
                            ),
                            fluidRow(),
                            fluidRow(
                                column( width = 12, ),
                            )
                        )
                    )
            )
                    )
        )
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$vbox1 <- renderValueBox({ valueBox( "100","# of flights", width = 2, icon = icon("plane"))})
    output$vbox2 <- renderValueBox({ valueBox( "23","# of Request", width = 2, icon = icon("bar-chart-o"))})
    output$vbox3 <- renderValueBox({ valueBox( "40","# of Delivery", width = 2, icon = icon("stethoscope"))})
    
    # load CSV file
    myCSV <-
        read_sheet("https://docs.google.com/spreadsheets/d/18INXNnwHA-ZzZVqAfwjCsW1HvOL7xIJaVqzdWFvDgEw/edit?usp=sharing")
    #-----------------------------------------------------------------------------
    #  render data table
    #-----------------------------------------------------------------------------
    output$download <- downloadHandler(
        filename = function(){"AionHealth.csv"}, 
        content = function(fname){
            write.csv(myCSV, fname)
        }
    )
    output$dataTable <- renderDT(myCSV,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                     pageLength = 10, autoWidth = TRUE
                                 ))
    # cells editable
}

# Run the application 
shinyApp(ui = ui, server = server)
