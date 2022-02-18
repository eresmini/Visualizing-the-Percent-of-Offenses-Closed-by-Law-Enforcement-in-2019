# Visualizing-the-Percent-of-Offenses-Closed-by-Law-Enforcement-in-2019

### Short summary:
This was a visualization final project for a class (CDS 301) taken at George Mason Univerity in Summer 2021. It uses the R programming language to create a visual summary of FBI data on the percentage of offenses closed by law enforcement in 2019.

### Long summary:
This was a visualization final project for a class (CDS 301) taken at George Mason Univerity in Summer 2021. We were free to choose our own dataset, and go about making the visualizaion as we pleased, as long as the code was in R.

I was interested to see what kinds of offenses were actually being closed (i.e. cleared) by law enforcement, since crime reporting is widespread in 24/7 news coverage and social media. Specifically, I wanted to illustrate the (perhaps) surprisingly low rate of offenses being closed throughout the United States, maybe even more surprising given the assumption that some percentage of violent and property crimes go unreported.

The visualization itself was created by using dplyr to prepare the data, ggplot to make the graph, and plotly to convert the plot to an interactive visual. The final product is a grouped barplot, with offense type on the x-axis and probability of clearance on the y-axis. The groupings are also in descending order, to add more of a narrative structure. When a user hovers over a bar on the plot, additional information also appears: offense type, count of offense for selected region, percentage of cleared offenses, population, and number of law enforcement agencies in selected region.
