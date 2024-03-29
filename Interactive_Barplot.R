## Emma Resmini

library(dplyr)
library(ggplot2)
library(plotly)


fbi_data <- read.csv("table-26.csv") # read in file (in working directory)
regions = c("NORTHEAST", "MIDWEST", "SOUTH", "WEST", "TOTAL ALL AGENCIES")
clears <- fbi_data %>%
  rename(num_agencies = Number..of..agencies, est_pop_2019 = X2019..estimated...population, Geo_Reg = Geographic.region.division) %>% # rename columns for easier calling
  mutate(Percent_Cleared_Decimal = Percent.Cleared.by.Arrest / 100) %>% # make a new column with the PROBABILITY of an offense being cleared (so the y-axis goes from 0 to 1)
  filter(Geo_Reg %in% regions) # only use the regions listed above

clears["Geo_Reg"][clears["Geo_Reg"] == "TOTAL ALL AGENCIES"] <- "ALL AGENCIES (NATIONWIDE)" # renaming value for clarification


fig <-clears %>%
  ggplot(aes(x = reorder(Offense, -Percent_Cleared_Decimal), y = Percent_Cleared_Decimal, fill = Geo_Reg, # barplot in descending order
             text = paste( # hover text information
               "Offense: ", Offense, "\n",
               "Count of Known Offences: ", Offenses.Known, "\n",
               "% Cleared by Arrest: ", Percent.Cleared.by.Arrest, "%", "\n",
               "No. of Law Enforcement Agencies: ", num_agencies, "\n",
               "Region Population: ", est_pop_2019, "\n",
               sep = " "
             )))+
  geom_bar(position = "dodge", stat = "identity") + # grouped barplot
  ylim(c(0,1)) + # setting y-axis from 0 to 1 to emphasize the low probabilities
  ggtitle("Probability of Offenses Closed by Law Enforcement through Arrest or Exceptional Means \n in 2019 by U.S. Geographic Region") +
  xlab("Offense Type") +
  ylab("Probability of offense closed \n by arrest or exceptional means") +
  theme(axis.text.x = element_text(angle=45)) + # angling x-axis tick labels to avoid overlapping
  guides(fill=guide_legend(title="U.S. Region")) + # changing legend title
  annotate("text", x = 2, y = 0.9, alpha = 0.65, size = 3,
           label = "Exceptional Means: \n elements beyond law enforcement's \n control which prevent arrest and/or \n and a formal charge.") # defining "exceptional means" for clarification

ggplotly(fig, tooltip = "text") # convert to plotly



### SOURCE:
# FBI Uniform Crime Reporting (UCR) Program, Table 26, "Percent of Offenses Cleared by Arrest or Exceptional Means by Geographic Region and Division, 2019" 
# https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/tables/table-26 


