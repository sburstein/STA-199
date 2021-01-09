# Instructions

The exam repository is available on the GitHub course organization page here 
with the prefix **exam01-**. These will be available Friday, September 25 at 
9:00 AM. 

The exam covers lectures 01 - 08.

The exam questions are in the README portion of the repository.


### Deadline

This exam is due **Monday, September 19, at 11:59 PM US Eastern Time**.

You must submit a PDF document to Gradescope that corresponds to an .Rmd file
on your GitHub repository in order to receive credit for this exam.

**There will be no grace period for this exam. Start and submit the exam early**
**in order to avoid any last-minute technical issues.**

**You may resubmit the exam before the deadline.** 

If a PDF is not uploaded to Gradescope by the submission deadline, your latest
commit prior to the deadline will be used as your submission. There will be a 
penalty for failing to submit a PDF to Gradescope. Commit often and at appropriate times. Part of your grade will be based on quality of commit history.

### Rules

- This is an individual assignment.
- Everything in your repository is for your eyes only except for the instructor.
- You may not collaborate or communicate anything about this exam to **anyone** 
except the instructor. For example, you may not communicate with other students, 
the TAs, or post/solicit help on the internet, email or via any other
method of communication. 
- You may use R, as well as any notes, books, or existing internet resources to
answer exam questions.
- As always, you must cite any code you use as inspiration. A failure to cite is
plagiarism. Cite any sources by providing a link to the original source in your
exam write-up.
- No TA office hours will be held while the exam is live.
- Piazza will be inactive while the exam is live.
- Do not email the TAs with questions.
- If you have questions email the instructor. Questions should only be about understanding 
the data or the exam's instructions. You may not ask questions on any topics from past 
assignments or material related to the exam. 
- The instructor will provide code debugging if needed, but this will result in
a **grade penalty** if needed.

### Academic Integrity

By taking this exam, you pledge to uphold the Duke Community Standard on this
exam:

- I will not lie, cheat, or steal in my academic endeavors;
- I will conduct myself honorably in all my endeavors; and
- I will act if the Standard is compromised.

# Submission

Please only upload your PDF document to Gradescope. Before you submit the 
uploaded document, mark where each answer is to the exercises. If any answer 
spans multiple pages, then mark all pages. Make sure to associate the “Overall”
section with the first page. **Failure to do so may result in points**
**being taken off.**

Make sure that your uploaded PDF document matches your .Rmd file and .pdf in
your repository exactly. Points will be deducted for non-reproducibility.

# Data

Air pollution is a major source of morbidity and mortality across the globe. Of
particular interest are SO2 (sulfur dioxide), NO2 (nitrogen dioxide), CO 
(carbon monoxide), and PM2.5 (fine particulate matter with diameter < 2.5 
micrometers)

Hourly data of pollution readings from 2013-2017 were captured at a weather 
station at Nongzhanguan in Chaoyang District, Beijing. 

A modified subset of 1500 of these observations is given in the `beijing.csv` 
file in the data folder, which has been adapted from data provided by Dr. Songxi 
Chen at Peking University (Proc. Roy. Soc. A: 473(2205): 2017.0457). 

The variables in this dataset are as follows. All pollutant concentrations are
measured in micrograms per cubic meter.

- `year`: year of observation
- `month`: month of observation
- `day`: day of observation
- `hour`: hour of observation (24 hour scale)
- `PM2.5`: PM2.5 concentration
- `PM10`: PM10 concentration
- `SO2`: sulfur dioxide concentration
- `NO2`: nitrogen dioxide concentration
- `CO`: carbon monoxide concentration
- `O3`: ozone concentration
- `TEMP`: temperature (in Celsius)
- `PRES`: atmospheric pressure (in hectopascals)
- `DEWP`: dew point temperature (in Celsius)
- `RAIN`: precipitation (in millimeters)
- `wd`: wind directoin (8 cardinal compass directions)
- `WSPM`: wind speed (in meters per second)

# Exercises

You will need the `tidyverse` package for this exam.

### Exercise 1

Create and save a new variable named `season` that corresponds to the season. 
Seasons should be defined with the following values according to the following
scheme: 

- `spring`: Days in March through May, inclusive
- `summer`: Days in June through August, inclusive
- `autumn`: Days in September through November, inclusive
- `winter`: Days in December through February, inclusive

### Exercise 2

For each season, what *percentage* of days did it rain? Your answer should be 
the output of a single code pipeline that displays only the seasons and 
corresponding percentages of rainy days, rounded to one decimal place. 

### Exercise 3

Based on your answer in Exercise 3, are rainy days and season independent?
Formally support your answer using probabilities calculated from the data. 
Round to three decimal places.

### Exercise 4

Suppose that days in Beijing may be classified as "good," "acceptable," or 
"dangerous" based on air quality. 46% of days may be classified as good, 24% may
be classified as acceptable, and 30% may be classified as dangerous. Further
suppose the following:

- 24% of good air quality days are windy
- 9% of acceptable air quality days are windy
- 4% of dangerous air quality days are windy

What is the probability that a randomly selected windy day has good air quality?
Remember that you may use R as a calculator. Show all work in the narrative of 
your document to receive full credit.

### Exercise 5

In what year and month were the days with the three highest recorded PM2.5
values? Your answer should be the output of a single code pipeline that displays 
only the month, year, and PM2.5 levels.

### Exercise 6

Evaluate the claim that average SO2, NO2, and CO levels are higher during
working hours than during non-working hours. Working hours are defined to be
between 8AM and 6PM. Use the data to validate or refute this claim. Do **not**
perform formal statistical inference. Examining point estimates is sufficient.

### Exercise 7

Create a well-labeled visualization that examines the distribution of PM2.5 
levels by the month of the year. Color-code your visualization by season, 
and comprehensively describe the distributions and any relationships you see.

**Hint**: the `month` variable is stored as a numeric data type in R. How might 
you convert it to a categorical variable?

### Exercise 8

Construct a data narrative that may be presented to an audience. Create a new
visualization (or visualizations) to support your narrative. The 
visualization(s) you create should tell an interesting story and/or provide 
insights into the underlying data. Your analysis may be a continuation of the 
analysis you’ve completed in exercises 1 - 7, or you can explore a completely 
different question about the data

**There is no single correct answer for these data.** Your visualization(s) will 
depend on what your narrative is for the reader. Points will be awarded based on 
having an interesting, data-driven insight supported by an appropriate 
visualization. 

Note that an analysis that is merely mistake-free will earn most, 
but not all points. Only exceptional analyses that go above and beyond will 
receive full credit.
