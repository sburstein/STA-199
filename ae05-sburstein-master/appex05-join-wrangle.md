Joining data sets + data wrangling
================
Scott Burstein
2020-09-08

## Clone a repo + start a new project

Go to the `ae05-[GITHUB USERNAME]` repo, clone it, and start a new
project in RStudio. See the earlier labs for detailed instructions.

## Configure git

Run the following code to configure Git. Fill in your GitHub username
and the email address associated with your GitHub account.

``` r
library(usethis)
use_git_config(user.name= "sburstein", user.email="scott.burstein@duke.edu")
```

1.  Run the setup code chunk. If you receive an error, you will need to
    run `install.packages("nycflights13")` and
    `install.packages("maps")` in the console first then re-run the
    setup code chunk.

2.  Familiarize yourself with the datasets `flights` and `airports`
    using the documentation `?flights`, `glimpse()`, and other
    functions. What information is provided in each dataset?

<!-- end list -->

``` r
?flights
glimpse(flights)
```

    ## Rows: 336,776
    ## Columns: 19
    ## $ year           <int> 2013, 2013, 2013, 2013, 2013, 2013, 2013, 2013, 2013, …
    ## $ month          <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
    ## $ day            <int> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …
    ## $ dep_time       <int> 517, 533, 542, 544, 554, 554, 555, 557, 557, 558, 558,…
    ## $ sched_dep_time <int> 515, 529, 540, 545, 600, 558, 600, 600, 600, 600, 600,…
    ## $ dep_delay      <dbl> 2, 4, 2, -1, -6, -4, -5, -3, -3, -2, -2, -2, -2, -2, -…
    ## $ arr_time       <int> 830, 850, 923, 1004, 812, 740, 913, 709, 838, 753, 849…
    ## $ sched_arr_time <int> 819, 830, 850, 1022, 837, 728, 854, 723, 846, 745, 851…
    ## $ arr_delay      <dbl> 11, 20, 33, -18, -25, 12, 19, -14, -8, 8, -2, -3, 7, -…
    ## $ carrier        <chr> "UA", "UA", "AA", "B6", "DL", "UA", "B6", "EV", "B6", …
    ## $ flight         <int> 1545, 1714, 1141, 725, 461, 1696, 507, 5708, 79, 301, …
    ## $ tailnum        <chr> "N14228", "N24211", "N619AA", "N804JB", "N668DN", "N39…
    ## $ origin         <chr> "EWR", "LGA", "JFK", "JFK", "LGA", "EWR", "EWR", "LGA"…
    ## $ dest           <chr> "IAH", "IAH", "MIA", "BQN", "ATL", "ORD", "FLL", "IAD"…
    ## $ air_time       <dbl> 227, 227, 160, 183, 116, 150, 158, 53, 140, 138, 149, …
    ## $ distance       <dbl> 1400, 1416, 1089, 1576, 762, 719, 1065, 229, 944, 733,…
    ## $ hour           <dbl> 5, 5, 5, 5, 6, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5, 6, 6, …
    ## $ minute         <dbl> 15, 29, 40, 45, 0, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59, …
    ## $ time_hour      <dttm> 2013-01-01 05:00:00, 2013-01-01 05:00:00, 2013-01-01 …

flights provides information for 336,776 flights across 19 variables.

``` r
?airports
```

    ## Help on topic 'airports' was found in the following packages:
    ## 
    ##   Package               Library
    ##   airports              /usr/local/lib/R/site-library
    ##   nycflights13          /usr/local/lib/R/site-library
    ## 
    ## 
    ## Using the first match ...

``` r
glimpse(airports)
```

    ## Rows: 1,458
    ## Columns: 8
    ## $ faa   <chr> "04G", "06A", "06C", "06N", "09J", "0A9", "0G6", "0G7", "0P2", …
    ## $ name  <chr> "Lansdowne Airport", "Moton Field Municipal Airport", "Schaumbu…
    ## $ lat   <dbl> 41.13047, 32.46057, 41.98934, 41.43191, 31.07447, 36.37122, 41.…
    ## $ lon   <dbl> -80.61958, -85.68003, -88.10124, -74.39156, -81.42778, -82.1734…
    ## $ alt   <dbl> 1044, 264, 801, 523, 11, 1593, 730, 492, 1000, 108, 409, 875, 1…
    ## $ tz    <dbl> -5, -6, -6, -5, -5, -5, -5, -5, -5, -8, -5, -6, -5, -5, -5, -5,…
    ## $ dst   <chr> "A", "A", "A", "A", "A", "A", "A", "A", "U", "A", "A", "U", "A"…
    ## $ tzone <chr> "America/New_York", "America/Chicago", "America/Chicago", "Amer…

airports provides information for 1,458 airports across 8 variables.

3.  Imagine you wanted to draw (approximately) the route each plane
    flies from its origin to its destination. What variables would you
    need from `flights`? What variables would you need from `airports`?
    Consider (in words) how you might join these two datasets.

In order to create an approximate visualization for the route each plane
flies from its origin to its destination, the following information
would be necessary:

from `flights` : origin & destination (both are <chr> variables) from
`airports` : lat & lon (both are <dbl> variables)

A potential method for joining these two datasets would be to perform a
left\_join() on `flights`, `airports` that retains all information for
each flight in `flights`. Next, filter to just retain lat and lon <dbl>
variables for each flight’s origin and destination <chr> data. Draw
straight lines from the origin to the destination and overlay on an
appropriately scaled map.

One interesting addition to this visualization would be to color each
line by airline carrier to get a sense of what routes and regions each
airline flies the most.

### What is the geographic distribution of delays in the United States?

4.  Starting with the `flights` dataset, find the average delay by
    destination and store your results in a dataset named `delays`. Note
    that NA’s are “contagious” so you will need to add an argument to
    the `mean` function.

<!-- end list -->

``` r
delays <- flights %>%
  group_by(dest) %>%
  summarize(delay = mean(arr_delay, na.rm = TRUE), count=n())
delays
```

5.  Create a new dataset by joining `delays` and `airports`. Only
    include observations that have both delay and airport information.
    Note `delays` and `flights` have no variables in common so you will
    need to specify the variables to join using `by`.

<!-- end list -->

``` r
delays_airports <- delays %>%
  inner_join(airports, by = c("dest" = "faa"))
delays_airports

left_out <- delays %>%
  anti_join(airports, by = c("dest" = "faa"))
left_out
```

6.  Create a map to show the spatial distribution of delays. Some helper
    code is provided. Use an appropriate aesthetic to display the
    average delay for each airport.

<!-- end list -->

``` r
delays_airports %>%
  ggplot(aes(x = lon, y = lat)) +
    borders("state") +
    geom_point(aes(color = delay)) +
    coord_quickmap()
```

### Is there a relationship between the age of a plane and its delays? The plane tail number is given in the `tailnum` variable in the dataset `flights`. The year the plane was manufactured is given in the `year` variable in the dataset `planes`.

7.  Start by finding the average arrival delay for each plane and store
    the resulting dataset in `plane_delays`.

<!-- end list -->

``` r
#plane_delays is average arrival delay for each plane

plane_delays <- flights %>%
  select(tailnum, arr_delay) %>%
  group_by(tailnum) %>%
  summarise(avg_arr_delay = sum(arr_delay, na.rm = TRUE) / length(arr_delay))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
plane_delays
```

    ## # A tibble: 4,044 x 2
    ##    tailnum avg_arr_delay
    ##    <chr>           <dbl>
    ##  1 D942DN         31.5  
    ##  2 N0EGMQ          9.47 
    ##  3 N10156         12.1  
    ##  4 N102UW          2.94 
    ##  5 N103US         -6.93 
    ##  6 N104UW          1.77 
    ##  7 N10575         19.3  
    ##  8 N105UW         -0.267
    ##  9 N107US         -5.73 
    ## 10 N108UW         -1.25 
    ## # … with 4,034 more rows

8.  Join `plane_delays` to the `planes` data using an appropriate join
    and then use `mutate` to create an `age` variable. Note this data is
    from 2013.

<!-- end list -->

``` r
LJ_delays_planes <- left_join(plane_delays, planes)
```

    ## Joining, by = "tailnum"

``` r
# Performed a left join on plane_delays, planes. data joined based on tailnum.

view(LJ_delays_planes)
```

``` r
#mutate to find age from manufacture age
#Only determining plane age based on year of plane commission.
#All flights from dataset occurred in 2013

plane_age <- LJ_delays_planes %>%
  mutate(age = 2013 - year)

view(plane_age)
```

``` r
#just keep two useful columns (aircraft age and average arrival delay)

age_avgDelay <- plane_age %>%
  select(age, avg_arr_delay) %>%
  group_by(age) %>%
  na.omit() %>%
  summarise(avg_arr_delay_by_age = sum(avg_arr_delay) / length(avg_arr_delay))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

``` r
age_avgDelay
```

    ## # A tibble: 46 x 2
    ##      age avg_arr_delay_by_age
    ##    <dbl>                <dbl>
    ##  1     0                2.52 
    ##  2     1                0.720
    ##  3     2                4.18 
    ##  4     3                3.03 
    ##  5     4                5.82 
    ##  6     5                4.57 
    ##  7     6                7.72 
    ##  8     7                7.52 
    ##  9     8               10.6  
    ## 10     9               12.1  
    ## # … with 36 more rows

9.  Finally, create an effective visualization of the data.

<!-- end list -->

``` r
ggplot(data = age_avgDelay,
       mapping = aes(x = age, y = avg_arr_delay_by_age)) +
  labs(title = "Average Arrival Delay by Aircraft Age",
       x = "Aircraft Age",
       y = "Average Arrival Delay") +
  geom_bar(stat = "identity")
```

![](appex05-join-wrangle_files/figure-gfm/Average%20Delay%20Visualization%20Plot-1.png)<!-- -->

I ultimately decided to create a bar plot visualization. There are some
outliers which are the result of small sample size n for aircrafts of
age greater than \~35 years. Interesting takeaway is that average
aircraft delay is not explicitly correlated with aircraft age.
