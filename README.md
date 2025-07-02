# 🧠 GlucoIntel – Predictive AI Health Assistant (2025)

![Made with R](https://img.shields.io/badge/Made%20with-R-blue)
![Powered by Shiny](https://img.shields.io/badge/Powered%20by-Shiny-orange)
![ML Model](https://img.shields.io/badge/ML%20Model-Linear%20Regression-blueviolet)
![Healthcare AI](https://img.shields.io/badge/domain-Healthcare%20AI-purple)
![UI/UX Friendly](https://img.shields.io/badge/UI%2FUX-Clean%20Design-ff69b4)
![Responsive UI](https://img.shields.io/badge/Responsive%20UI-Yes-9cf)
![Status: Complete](https://img.shields.io/badge/Status-Complete-brightgreen)
![License: MIT](https://img.shields.io/badge/license-MIT-green)
![Built with ❤️](https://img.shields.io/badge/Built%20with-%E2%9D%A4-red)

A Shiny-powered R app that turns real-world diabetes health data into a gentle, intelligent health assistant. It uses a linear regression model to estimate glucose levels from user inputs — visualized beautifully with Plotly.

*Smarter Insights, Healthier Living*

<video src="https://github.com/user-attachments/assets/d3ab3860-9ebe-4b48-a6d3-0b1654643111" controls width="100%"></video>

---

## 🌸  What This App Can Do for You

- Predicts glucose levels based on user inputs like:
  - Pregnancies, Blood Pressure, Skin Thickness  
  - Insulin, BMI, Diabetes Pedigree Function, Age

- Shows an interactive BMI vs Glucose plot, powered by Plotly

- Offers model insights that are simple to understand:
  - Key feature contributions
  - R² score to reflect how well it performs

- Clean, responsive UI built with Shiny + custom HTML/CSS

---

## 💻 Tech Stack

**Language:**  
&nbsp;&nbsp;&nbsp;&nbsp;R

**Core Libraries:**  
&nbsp;&nbsp;&nbsp;&nbsp;• `shiny` — app framework  
&nbsp;&nbsp;&nbsp;&nbsp;• `dplyr` — data manipulation  
&nbsp;&nbsp;&nbsp;&nbsp;• `plotly` — interactive visualization

**Machine Learning Model:**  
&nbsp;&nbsp;&nbsp;&nbsp;• Linear Regression (base `lm()` in R)

**Interface & Styling:**  
&nbsp;&nbsp;&nbsp;&nbsp;• Shiny UI with custom HTML & CSS

---

## 📂 Requirements
- **Software**:
  - R and RStudio
  - R packages: `shiny`, `dplyr`, `plotly`
- **Dataset**:
  - `diabetes.csv` with fields for `Pregnancies`, `BloodPressure`, `SkinThickness`, `Insulin`, `BMI`, `DiabetesPedigreeFunction`, `Age`, and `Glucose`.

---

## ⚙️ How to Run

### 1. **Clone the repository**
```bash
git clone https://github.com/bhmuxkan/glucointel-ai-app.git
cd glucointel-ai-app
```

### 2. **Open R or RStudio and run the app**
```r
shiny::runApp('app.R')
```

### 3. **Make sure you have the required packages installed:**
```r
install.packages(c("shiny", "dplyr", "plotly"))
```

---

## 🖥️ Usage
1. **Run the Application**:
   ```r
   shinyApp(ui = ui, server = server)
   ```
2. **Input Data**: Enter health details in the sidebar and hit "Predict Glucose Level".
3. **View Prediction**: The predicted glucose level will appear on the main panel, styled for clarity.

---

## 💡 Why I Built This

*GlucoIntel* started as a personal project — a quiet space to explore real healthcare data and build something that feels both meaningful and usable.

I wanted it to be more than just technically sound — something intuitive, thoughtful, and designed to help.

Through this project, I was able to:

- Work with real clinical datasets
- Build and interpret a clear machine learning model in R
- Design a soft, human-centered UI using Shiny
- Communicate results in a way that’s visual and accessible

This app reflects how I love to create: with clarity, care, and intention — blending data with design to make something gentle and empowering.

---

## 🤝 Contribution
Contributions are welcome to help improve this project! You can:

1. **Fork the Repository** on GitHub.
2. **Create a New Branch** for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. **Make Your Changes** and commit:
   ```bash
   git commit -m "Add new feature or fix"
   ```
4. **Push Changes** to your branch:
   ```bash
   git push origin feature-name
   ```
5. **Submit a Pull Request** explaining the changes made.

We encourage you to suggest improvements, file issues, and help enhance this application!

---

## 📬 Connect With Me

If you love thoughtful UI, health tech, or just want to say hi — I’d love to connect. 

- LinkedIn – [Muskan](https://www.linkedin.com/in/bhmuxkan)

---

## 📄 License

- This project is released under the **`MIT LICENSE`**  
- Feel free to use, modify, and share — with kind attribution 

---



