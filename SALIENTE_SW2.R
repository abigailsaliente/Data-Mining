
# Abigail Saliente
#SW No. 2
#No.5
# Create boxplot using ggplot2 package
ggplot(SW1_DATA, aes(x = schooltype, y = average)) +
  geom_boxplot(color = "black", fill = "pink") +
  labs(x = "Type of School", y = "High School Average Grade",
       title = "Box Plot for Type of School and High School Average Grade")

#No.6
# Create scatterplot using plotly package
plot_ly(SW1_DATA, x = ~average, y = ~EntranceScore, type = "scatter",
        mode = "markers") %>%
  layout(xaxis = list(title = "Type of School"),
         yaxis = list(title = "High School Average Grade"),
         title = "Scatter Plot for Average and Entrance Score")
