
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
            menuItem("Flight Summary", tabName = "MidwifeDatabase", icon = icon("home"))
        ),
        sidebarMenu(
            menuItem("Maternal Mortality Summary", tabName = "MaternalMortalitySummary", icon = icon("dashboard"))
        ),
        sidebarMenu(
            menuItem("Register Pregnancy ", tabName = "Registerpregnancy", icon = icon("female"))
        ),
        sidebarMenu(
            menuItem("Register Midwives ", tabName = "Registermidwives", icon = icon("stethoscope"))
        ),
        sidebarMenu(
            menuItem("Register Healthcare Personnel", tabName = "Registerhealthpersonnel", icon = icon("users"))
        ),
        sidebarMenu(
            menuItem("Register Health Facilities", tabName = "Registerhealthfacilities", icon = icon("bar-chart-o"))
        ),
        sidebarMenu(
            menuItem("Patient's Vitals ", tabName = "Patientvital", icon = icon("plus"))
        ),
        sidebarMenu(
            menuItem("Request Blood ", tabName = "RequestBlood ", icon = icon("ambulance"))
        ),
        sidebarMenu(
            menuItem("Report Maternal Deaths ", tabName = "Reportmaternaldeath", icon = icon("star"))
        ),
        sidebarMenu(
            menuItem("Report Successful Delivery ", tabName = "Reportsuccessfuldelivery", icon = icon("star"))
        ),
        sidebarMenu(
          menuItem("Pregnancy Database", tabName = "PregnancyDatabase", icon = icon("table"))
        ),
        sidebarMenu(
          menuItem("Midwives Database", tabName = "MidwivesDatabase", icon = icon("th"))
        ),
       
        sidebarMenu(
            menuItem("Health Personnel Database", tabName = "HealthPersonnelDatabase", icon = icon("menu-hamburger",lib='glyphicon'))
        ),
        
        sidebarMenu(
            menuItem("Healthcare Facilities Database", tabName = "HealthcarelDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
          menuItem("Patient's Vital Database", tabName = "PatientvitalsDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
          menuItem("Blood Bank Database", tabName = "RequestBloodDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
          menuItem("Maternal Deaths Database", tabName = "MaternaldeathsDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
          menuItem("Successful Delivery Database", tabName = "SuccessfulDeliveryDatabase", icon = icon("hospital"))
        ),
        sidebarMenu(
            menuItem("Aion Health's Finance", tabName = "AionFinancialSummary", icon = icon("money"))
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "MaternalMortalitySummary",
                    tabsetPanel(
                        id = "tabs",
                        tabPanel(
                            title = "Health Dashboard",
                            value = "page1",
                            fluidRow(
                                valueBoxOutput("vbox4"),
                                valueBoxOutput("vbox5"),
                                valueBoxOutput("vbox6"),
                                valueBoxOutput("vbox7")
                                
                                
                            ),
                            fluidRow(),
                            fluidRow(
                                column( width = 12, ),
                            )
                        )
                    )
            ),
            tabItem(tabName = "Registerpregnancy",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("PFname", "Patient's First Name", )),
                      div(style="display:inline-block",textInput("PLname", label="Patient's Last Name", )),
                      div(style="display:inline-block",textInput("RName", label="Reporter's Name", )),
                      div(style="display:inline-block",textInput("HWName", label="Health Worker's Name", )),
                      div(style="display:inline-block",textInput("date", label="Date of Pregnancy", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("Phone", label="Phone Number", )),
                      div(style="display:inline-block",textInput("City1", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit12", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "Registermidwives",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("MFname", "Midwife's First Name", )),
                      div(style="display:inline-block",textInput("MLname", label="Midwife's Last Name", )),
                      div(style="display:inline-block",textInput("MPhone", label="Midwife's Phone Number", )),
                      div(style="display:inline-block",textInput("Availability", label="Availability", )),
                      div(style="display:inline-block",textInput("Skills", label="Skills", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("City", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "Registerhealthpersonnel",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("HPFname", "HealthPersonnel's First Name", )),
                      div(style="display:inline-block",textInput("HPLname", label="HealthPersonnel's Last Name", )),
                      div(style="display:inline-block",textInput("HPPhone", label="HealthPersonnel's Phone Number", )),
                      div(style="display:inline-block",textInput("Availability", label="Availability", )),
                      div(style="display:inline-block",textInput("Skills", label="Skills", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("City", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            tabItem(tabName = "Registerhealthfacilities",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("HFFname", "HealthFacility's Name", )),
                      div(style="display:inline-block",textInput("HFPhone", label="HealthFacility's Phone Number", )),
                      div(style="display:inline-block",textInput("Availability", label="Availability", )),
                      div(style="display:inline-block",textInput("Services", label="Services", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("City", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "Patientvital",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("PVFname", "Patient's First Name", )),
                      div(style="display:inline-block",textInput("PVPhone", label="Patient's Phone Number", )),
                      div(style="display:inline-block",textInput("Haemoglobin level", label="Haemoglobin level", )),
                      div(style="display:inline-block",textInput("Spesis", label="Sepsis", )),
                      div(style="display:inline-block",textInput("Temperature", label="Temperature", )),
                      div(style="display:inline-block",textInput("Oxygenlevel", label="Oxygen level", )),
                      div(style="display:inline-block",textInput("Infectionlevel", label="Infection level", )),
                      div(style="display:inline-block",textInput("Eatinglast24hours", label="Eating last 24 hours", )),
                      div(style="display:inline-block",textInput("Headache", label="Head Ache", )),
                      div(style="display:inline-block",textInput("EKG", label="EKG", )),
                      div(style="display:inline-block",textInput("Pain", label="Pain", )),
                      div(style="display:inline-block",textInput("Dizziness", label="Dizziness", )),
                      div(style="display:inline-block",textInput("Bleeding", label="Bleeding", )),
                      div(style="display:inline-block",textInput("Malaria", label="Malaria", )),
                      div(style="display:inline-block",textInput("Illegalabortions", label="Illegal abortions", )),
                      
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "RequestBlood",
                    bootstrapPage(
                      div(style="display:inline-block",textInput("Job Title", "Patient's First Name", )),
                      div(style="display:inline-block",textInput("Employment Type", label="Patient's Last Name", )),
                      div(style="display:inline-block",textInput("Salary", label="Reporter's Name", )),
                      div(style="display:inline-block",textInput("Industry", label="Health Worker's Name", )),
                      div(style="display:inline-block",textInput("City", label="Blood Type", )),
                      div(style="display:inline-block",textInput("City", label="Quanity", )),
                      div(style="display:inline-block",textInput("City", label="Address", )),
                      div(style="display:inline-block",textInput("City", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "Reportmaternaldeath",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("PFname", "Patient's First Name", )),
                      div(style="display:inline-block",textInput("PLname", label="Patient's Last Name", )),
                      div(style="display:inline-block",textInput("RName", label="Reporter's Name", )),
                      div(style="display:inline-block",textInput("HWName", label="Health Worker's Name", )),
                      div(style="display:inline-block",textInput("date", label="Date of Death", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("City1", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
            tabItem(tabName = "Reportsuccessfuldelivery",
                    bootstrapPage(
                      
                      div(style="display:inline-block",textInput("PFname", "Patient's First Name", )),
                      div(style="display:inline-block",textInput("PLname", label="Patient's Last Name", )),
                      div(style="display:inline-block",textInput("RName", label="Reporter's Name", )),
                      div(style="display:inline-block",textInput("HWName", label="Health Worker's Name", )),
                      div(style="display:inline-block",textInput("date", label="Date of Delivery", )),
                      div(style="display:inline-block",textInput("Address", label="Address", )),
                      div(style="display:inline-block",textInput("City1", label="City", )),
                      fluidPage(div(style="display:inline-block",actionButton("Submit", "Submit", width = 100,icon = icon("submit"))))
                    )
                    
            ),
            
           
       
            
         
            tabItem(tabName = "PregnancyDatabase",
                    bootstrapPage(
                        column(12, div(
                            dataTableOutput("registerpregnancy")
                        )),
                        fluidPage(div(style="display:inline-block",  downloadButton('downloadrp',"Download")))
                        
                    )),
            
            tabItem(tabName = "MidwivesDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("registermidwives")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrm',"Download")))
                      
                    )),
            
            tabItem(tabName = "HealthPersonnelDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("registerhealthpersonnel")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrhp',"Download")))
                      
                    )),
            
            tabItem(tabName = "HealthFacilitiesDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("registerhealthfacilities")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrhf',"Download")))
                      
                    )),
            
            tabItem(tabName = "PatientVitalsDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("patientvitals")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadpv',"Download")))
                      
                    )),
            
            tabItem(tabName = "RequestBloodDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("requestblood")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrb',"Download")))
                      
                    )),
            
            tabItem(tabName = "MaternalDeathsDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("requestmaternaldeaths")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrmd',"Download")))
                      
                    )),
            
            tabItem(tabName = "SuccessfulDeliveryDatabase",
                    bootstrapPage(
                      column(12, div(
                        dataTableOutput("reportsuccessfuldelivery")
                      )),
                      fluidPage(div(style="display:inline-block",  downloadButton('downloadrsd',"Download")))
                      
                    )),
            tabItem(tabName = "AionFinancialSummary",
                    bootstrapPage(
                        column(12, div(
                            dataTableOutput("AionFinancialSummary")
                        )),
                        fluidPage(div(style="display:inline-block",  downloadButton('downloadfs',"Download")))
                        
                    )), 
            tabItem(tabName = "MidwifeDatabase",
                    tabsetPanel(
                        id = "tabs",
                        tabPanel(
                            title = "Flight Dashboard",
                            value = "page1",
                            fluidRow(
                                valueBoxOutput("vbox1"),
                                valueBoxOutput("vbox2"),
                                valueBoxOutput("vbox3")
                                
                                
                            ),
                            fluidRow(),
                            fluidPage(
                                h2("Aion Health: This is a demo of Aion's progress on social innovation project. We are still collecting data. But this demo shows what we envision. (Do not use the data or any information. #Testing)"),
                                p("Sierra Leone has one of the highest maternal mortal rate due to delay in decision making, delay in arriving at health facilities and delay in providing quality care. Our mission is to eradicate maternal and infant mortality in Sierra Leone by using drones to deliver affordable and eco-friendly maternal delivery kits using autonomous drones. ", style = "font-family: 'times'; font-si16pt"),
                                
                                h4("#Delay in Decision Making     #Delay in arriving at health facilities    #Delay in providing quality care")
                            ),
                            fluidPage(
                                h4("Aion Health Ole Cup Presentation"),
                                
                                tags$video(id="video2", type = "video/mp4",src = "AionOleCup.mp4", controls = "controls",)
                            )
                      
                    )
            )
         
                    )
        )))
    


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$vbox1 <- renderValueBox({ valueBox( "0","Flights per Day", width = 2, icon = icon("plane"))})
    output$vbox2 <- renderValueBox({ valueBox( "40","Total Request", width = 2, icon = icon("bar-chart-o"))})
    output$vbox3 <- renderValueBox({ valueBox( "0","Total Flights", width = 2, icon = icon("stethoscope"))})
    output$vbox4 <- renderValueBox({ valueBox( "1,165","Sierra Leone Maternal Mortality", width = 2, icon = icon("stethoscope"))})
    output$vbox5 <- renderValueBox({ valueBox( "2","Poland Maternal Mortality (Ideal Goal)", width = 2, icon = icon("stethoscope"))})
    output$vbox6 <- renderValueBox({ valueBox( "3000","Registered Midwives in Sierra Leone", width = 2, icon = icon("stethoscope"))})
    output$vbox7 <- renderValueBox({ valueBox( "22,000","Registered Midwives in Poland", width = 2, icon = icon("stethoscope"))})
    
    # load CSV file
    RegisterPregnancy1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1H3Jv2__9Q9-DXY9yywF3GcllzBfvmXxMYXrhuqZhnnc/edit?usp=sharing")
    RegisterMidwives1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1LFxg6rM_NuQ9UdfqmE_2Fw3wUAWV-hfvD9guWfGkU68/edit?usp=sharing")
    RegisterHealthPersonnel1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1w7nedadGoAXNl6pQ2iBUrTx-elYRhi5ofY-hRhKQrlI/edit?usp=sharing")
    RegisterHealthFacilities1 <-  read_sheet("https://docs.google.com/spreadsheets/d/18INXNnwHA-ZzZVqAfwjCsW1HvOL7xIJaVqzdWFvDgEw/edit?usp=sharing")
    PatientVitals1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1zojYUq7J4jJxZJa9aUjfv2a_mqAypWthnrQSmUnEVxI/edit?usp=sharing")
    RequestBlood1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1XaDLe4-jNJINPcz21fJhPof1Jmeb77Eb7ywBHqFZ7ZQ/edit?usp=sharing")
    ReportMaternalDeaths1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1BqpKUoOj1eDUGrp3x-wioF8Idv_mI5b0fdjtNHODAnk/edit?usp=sharing")
    RegisterSuccessfulDelivery1 <-  read_sheet("https://docs.google.com/spreadsheets/d/183sL8fhkU-2VSwCcnQrmzpQOWdgbRFIG1pt9PBYUFPs/edit?usp=sharing")
    AionFinancialSummary1 <-  read_sheet("https://docs.google.com/spreadsheets/d/1LeepnK9erKavPtI5iIK4etf3sOlGBnXPFbEYb1PeRWI/edit?usp=sharing")
    
    
    #-----------------------------------------------------------------------------
    
    output$downloadpd <- downloadHandler(
      filename = function(){"AionHealth'sPregnancyDatabase.xlsx"}, 
      content = function(fname){
        write.table(RegisterPregnancy1, fname)
      }
    )
    
    output$downloadrm <- downloadHandler(
      filename = function(){"AionHealth'sMidwivesDatabase.xlsx"}, 
      content = function(fname){
        write.table(RegisterMidwives, fname)
      }
    )
    output$downloadrhp <- downloadHandler(
      filename = function(){"AionHealth'sHealthPersonnel.xlsx"}, 
      content = function(fname){
        write.table(RegisterHealthPersonnel, fname)
      }
    )
    output$downloadrhf <- downloadHandler(
      filename = function(){"AionHealth'sHealthFacilitiesDatabase.xlsx"}, 
      content = function(fname){
        write.table(RegisterHealthFacilities, fname)
      }
    )
    output$downloadpv <- downloadHandler(
      filename = function(){"AionHealth'sPatient'svitalsDatabase.xlsx"}, 
      content = function(fname){
        write.table(PatientVitals, fname)
      }
    )
    output$downloadrb <- downloadHandler(
      filename = function(){"AionHealth'sBloodBankDatabase.xlsx"}, 
      content = function(fname){
        write.table(RequestBlood1, fname)
      }
    )
    output$downloadrmd <- downloadHandler(
      filename = function(){"AionHealth'sMaternalDeathsDatabase.xlsx"}, 
      content = function(fname){
        write.table(ReportMaternalDeaths1, fname)
      }
    )
    output$downloadrsd <- downloadHandler(
      filename = function(){"AionHealth'sSuccessfulDeliveryDatabase.xlsx"}, 
      content = function(fname){
        write.table(RegisterSuccessfulDelivery1, fname)
      }
    )
    output$downloadfs <- downloadHandler(
        filename = function(){"AionHealth Financial Summary.xlsx"}, 
        content = function(fname){
            write.table(AionFinancialSummary1, fname)
        }
    )
    output$registerpregnancy <- renderDT(RegisterPregnancy1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    output$registermidwives <- renderDT(RegisterMidwives1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$registerhealthpersonnel <- renderDT(RegisterHealthPersonnel1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$registerhealthfacilities <- renderDT(RegisterHealthFacilities1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$patientvitals <- renderDT(PatientVitals1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$requestblood <- renderDT(RequestBlood1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$reportmaternaldeaths <- renderDT(ReportMaternalDeaths1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    
    output$registersuccessfuldelivery <- renderDT(RegisterSuccessfulDelivery1,
                                 # data
                                 class = "display nowrap compact",
                                 # style
                                 filter = "top",
                                 # location of column filters
                                 editable = FALSE, options = list(
                                   pageLength = 10, autoWidth = TRUE
                                 ))
    output$AionFinancialSummary <- renderDT(AionFinancialSummary1,
                                                  # data
                                                  class = "display nowrap compact",
                                                  # style
                                                  filter = "top",
                                                  # location of column filters
                                                  editable = FALSE, options = list(
                                                      pageLength = 50, autoWidth = TRUE
                                                  ))
    
  
    
    
    

    # cells editable
}

# Run the application 
shinyApp(ui = ui, server = server)
