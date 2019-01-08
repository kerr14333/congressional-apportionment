#Libraries
library(tidyverse)
library(ggrepel)


#Sources:
#https://www.census.gov/population/apportionment/data/2000_apportionment_results.html
#https://www.census.gov/population/apportionment/data/2010_apportionment_results.html

#Read in data
historic_data <- read_csv("apportionment.csv")

#Subset Data and Create My Labels
sub<-historic_data %>% 
  group_by(State) %>% 
  filter(all(abs(max(seats)-min(seats))>=8)) %>%
  mutate(label = if_else(year == max(year), 
                         paste0(as.character(State)," ",seats), 
                         NA_character_))


my.breaks <- sub %>% pull(year) %>% unique() %>% sort()


## Line plot

  #Plot the data
  sub %>%
  ggplot(aes(x=year,y=seats,col=as.factor(State),group=State)) + 
  geom_line() + 
  guides(col=F) + #Remove guide because it will clutter
  ggtitle("Apportionment of Congressional Seats\n1910-2010")+
  labs(subtitle="States with a range of 8 or greater \nseats over the time period.",
       caption="Source: U.S. Census Bureau.")+
  xlab("Year") + 
  ylab("Number of Seats") +
  theme(legend.position = "bottom",
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5),
        axis.text.x = element_text(angle = 45, hjust = 1))+
  scale_x_continuous(breaks=my.breaks,limits=c(1910,2060)) +
  scale_y_continuous(breaks=seq(from=0,to=55,by=5),limits=c(0,55)) +
  geom_label_repel(aes(label = label), #Add Labels
                   nudge_x = 50,
                   label.size = 0,
                   label.padding = 0.15,
                   direction="y",
                   na.rm = TRUE,segment.colour = "black",
                   arrow = arrow(length = unit(0.02, "npc"))) 
  
## Step Plot
  
  #Plot the data
  sub %>%
    ggplot(aes(x=year,y=seats,col=as.factor(State),group=State)) + 
    geom_linestep() + 
    guides(col=F) + #Remove guide because it will clutter
    ggtitle("Apportionment of Congressional Seats\n1910-2010")+
    labs(subtitle="States with a range of 8 or greater \nseats over the time period.",
         caption="Source: U.S. Census Bureau.")+
    xlab("Year") + 
    ylab("Number of Seats") +
    theme(legend.position = "bottom",
          plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
          axis.text.x = element_text(angle = 45, hjust = 1))+
    scale_x_continuous(breaks=my.breaks,limits=c(1910,2060)) +
    scale_y_continuous(breaks=seq(from=0,to=55,by=5),limits=c(0,55)) +
    geom_label_repel(aes(label = label), #Add Labels
                     nudge_x = 50,
                     label.size = 0,
                     label.padding = 0.15,
                     direction="y",
                     na.rm = TRUE,segment.colour = "black",
                     arrow = arrow(length = unit(0.02, "npc"))) 
  
