# Congressional Apportionment 1910-2010

![Congressional Apportionment](https://github.com/kerr14333/congressional-apportionment/blob/master/img/apportionment.png?raw=true)

## Data Sources

All sources were pulled from the U.S. Census Bureau website:

[Apportionment of Membership of the House of Representatives: 1789-2000 ](https://www.census.gov/population/apportionment/data/2000_apportionment_results.html)

[Apportionment Population and Number of Representatives, by State: 2010 Census](https://www.census.gov/population/apportionment/data/2010_apportionment_results.html)

## Tools

I used ggplot in R to create the graph.

## Graph Info

1910 to 2010 was chosen due to there being a constant 435 representatives with the exception of the 1950 census when there were briefly 437. This was due to the introduction of Hawaii and Alaska as states.

The subset of states was chosen to be states where the range of seats over the time period was greater or equal to 8. This was chosen for two reasons. One, it did not clutter up the graph and two, it showed states where there has been a large change in its representation.

Feel free to play around with the code and see what you can do with it yourself.