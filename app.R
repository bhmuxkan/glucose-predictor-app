library(shiny)
library(dplyr)
library(plotly)

# Load dataset
diabetes_data <- read.csv("diabetes.csv")

# Linear regression model
model <- lm(Glucose ~ Pregnancies + BloodPressure + SkinThickness + Insulin + BMI + DiabetesPedigreeFunction + Age,
            data = diabetes_data)

# UI
ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"),
    tags$style(HTML("
      body {
        background: #f5f8fc;
        font-family: 'Segoe UI', sans-serif;
        padding: 0;
        margin: 0;
      }
      .main-container {
        max-width: 1200px;
        margin: 40px auto;
        background-color: #ffffff;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        border-radius: 12px;
        padding: 40px 60px;
      }
      h1 {
        text-align: center;
        font-size: 28px;
        color: #003366;
        margin-bottom: 10px;
        font-weight: bold;
      }
      .subtitle {
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        color: #555;
        margin-bottom: 30px;
      }
      .input-row {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
      }
      .left-panel {
        background-color: #f2f6fb;
        border-radius: 10px;
        padding: 25px;
        width: 350px;
        box-sizing: border-box;
        margin-left: 10px;
      }
      .predict-btn {
        width: 100%;
        margin-top: 20px;
        background: #005eb8;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        padding: 12px;
        transition: all 0.3s ease;
      }
      .predict-btn:hover {
        background-color: #003f7d;
        color: white;
      }
      .right-panel {
        flex-grow: 1;
        padding-left: 40px;
        margin-top: 30px;
      }
      .section-card {
        background-color: #f0f8ff;
        padding: 20px;
        border-left: 6px solid #0073e6;
        border-radius: 10px;
        margin-top: 20px;
        margin-left: 10px;
      }
      .footer-note {
        text-align: center;
        margin-top: 40px;
        color: #888;
        font-size: 14px;
        font-weight: bold;
      }
    "))
  ),
  
  div(class = "main-container",
      h1("🧠 GlucoIntel – Your Predictive AI Health Assistant"),
      div(class = "subtitle", "Smarter Insights, Healthier Living"),
      div(class = "input-row",
          div(class = "left-panel",
              numericInput("Pregnancies", "🤰 Pregnancies (Count)", value = 1, step = 1),
              numericInput("BloodPressure", "🩸 Blood Pressure (mm Hg)", value = 80, step = 1),
              numericInput("SkinThickness", "🧫 Skin Thickness (mm)", value = 20, step = 1),
              numericInput("Insulin", "💉 Insulin (μU/mL)", value = 80, step = 0.1),
              numericInput("BMI", "🏋️ BMI (kg/m²)", value = 25.0, step = 0.1),
              numericInput("DiabetesPedigreeFunction", "🧬 Diabetes Pedigree Function", value = 0.5, step = 0.01),
              numericInput("Age", "📅 Age (years)", value = 30, step = 1),
              actionButton("predict", "📊 Predict Glucose Level", class = "predict-btn")
          ),
          div(class = "right-panel",
              plotlyOutput("plot", height = "500px")
          )
      ),
      uiOutput("predicted_glucose"),
      uiOutput("model_info"),
      div(class = "footer-note", "💻 Built with Linear Regression · For learning purposes only 💻")
  )
)

# Server
server <- function(input, output) {
  observeEvent(input$predict, {
    user_data <- data.frame(
      Pregnancies = input$Pregnancies,
      BloodPressure = input$BloodPressure,
      SkinThickness = input$SkinThickness,
      Insulin = input$Insulin,
      BMI = input$BMI,
      DiabetesPedigreeFunction = input$DiabetesPedigreeFunction,
      Age = input$Age
    )
    
    predicted_glucose <- predict(model, newdata = user_data)
    
    output$predicted_glucose <- renderUI({
      div(class = "section-card",
          HTML(paste0("<h4>🔥 Estimated Glucose Level:</h4>",
                      "<p style='font-size: 22px; font-weight: bold; color: #003366; margin-left: 28px;'>",
                      round(predicted_glucose, 2), " mg/dL</p>"))
      )
    })
    
    output$plot <- renderPlotly({
      plot_ly(diabetes_data, x = ~BMI, y = ~Glucose, type = "scatter", mode = "markers",
              marker = list(color = 'lightgray', size = 6), name = "Data") %>%
        add_markers(x = input$BMI, y = predicted_glucose, marker = list(color = 'red', size = 10), name = "You") %>%
        layout(title = "BMI vs Glucose Level",
               xaxis = list(title = "BMI"),
               yaxis = list(title = "Glucose"))
    })
    
    output$model_info <- renderUI({
      div(class = "section-card",
          HTML(paste0(
            "<h4>📈 Model Insights:</h4>",
            "<ul>",
            "<li><strong>Top Influencers:</strong> Age, BMI, Insulin</li>",
            "<li><strong>Model:</strong> Linear Regression (R² = ", round(summary(model)$r.squared, 2), ")</li>",
            "</ul>"
          ))
      )
    })
  })
}

# App
shinyApp(ui = ui, server = server)
