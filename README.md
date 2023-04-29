
#IF NOT ALREADY DONE -- VERY LONG HOMEBREW INSTALLATION
#Install and load the "readxl" package
install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)


# Read the Excel file into a data frame
speedtests <- read_excel("/Users/konstikowarsch/Sites/Kowarsch_Konstantin_cds/assignment01/speedtest.xlsx")



# Create a bar plot
ggplot(speedtests, aes(x = factor(c(128, 256, 512, 1024, 2048)), y = normal, fill = "Normal")) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_bar(aes(y = transponded, fill = "Transponded"), stat = "identity", position = "dodge") +
  geom_bar(aes(y = flatarray, fill = "Flatarray"), stat = "identity", position = "dodge") +
  scale_fill_manual(values = c("Normal" = "#E69F00", "Transponded" = "#56B4E9", "Flatarray" = "#009E73")) +
  labs(x = "Image Size", y = "Speed (ms)", fill = "Test Type") +
  theme_minimal()


