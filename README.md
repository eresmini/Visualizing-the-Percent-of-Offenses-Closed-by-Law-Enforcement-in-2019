# Visualizing-the-Percent-of-Offenses-Closed-by-Law-Enforcement-in-2019

## Background
I was interested to see what kinds of offenses were actually being closed (i.e. cleared) by law enforcement, since crime reporting is widespread in 24/7 news coverage and social media. Specifically, I wanted to illustrate the (perhaps) surprisingly low rate of offenses being closed throughout the United States, maybe even more surprising given the assumption that some percentage of violent and property crimes go unreported.

## Data
The data were collected by the FBI’s Uniform Crime Reporting (UCR) Program. By the UCR Program’s definitions, law enforcement agencies clear (or “close”) offenses in one of two ways: Arrest and Exceptional means. Exceptional means refers to elements outside of law enforcement’s control (death of offender, victim refusing to cooperate, etc.). The data include nationwide statistics, as well as statistics for the four major regions of the U.S. as defined by the Census Bureau (Northeast, South, Midwest, and West) and the nine sub-regions used by the UCR (New England, Middle Atlantic, East North Central, West North Central, South Atlantic, East South Central, West South Central, Mountain, and Pacific).  
The data are downloaded as an Excel spreadsheet, however its original format is not readily usable for analyzing/visualization. Within Excel, I changed the format from wide to long, making minor adjustments as needed, and converted to csv. (All further analyzing and wrangling was done in R.)

#### Sources: 
https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/clearances  
https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/topic-pages/tables/table-26

#### Notes on data:
The UCR Program makes no distinction between offenses cleared by arrest and offenses cleared by exceptional means, however my plot visualizes the probability of an offense being cleared – by either means – so this was not of great concern. The data on rape and arson offenses may not be as reliable as the data on the other offenses. Rape offenses that are defined in a way which does not follow the UCR Program definition are not included, and not all law enforcement agencies report arson cases to the FBI.

## Visualization
The visualization itself was created with R, using dplyr to prepare the data, ggplot to make the graph, and plotly to convert the plot to an interactive visual. The final product is a barplot grouped by the four major U.S. regions, with offense type on the x-axis and probability of clearance on the y-axis. The groupings are also in descending order, to add more of a narrative structure. When a user hovers over a bar on the plot, additional information also appears: offense type, count of offense for selected region, percentage of cleared offenses, population, and number of law enforcement agencies in selected region.
