# Instructions

The exam repository is available on the GitHub course organization page 
with the prefix **exam02-**. These will be available Friday, October 23 at 
9:00 AM. 

The exam covers lectures 01 - 20.

The exam questions are in the README portion of the repository.


### Deadline

This exam is due **Monday, October 26, at 11:59 PM US Eastern Time**.

You must submit a pdf document to Gradescope that corresponds to an .Rmd file
on your GitHub repository in order to receive credit for this exam.

**There will be no grace period for this exam. Start and submit the exam early**
**in order to avoid any last-minute technical issues.**

**You may resubmit the exam before the deadline.** 

If a pdf is not uploaded to Gradescope by the submission deadline, your latest
commit prior to the deadline will be used as your submission. There will be a 
penalty for failing to submit a pdf to Gradescope. **Commit and push often and** 
**at appropriate times.** Part of your grade will be based on quality of commit
history.

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
- If you have questions email the instructor. Questions should only be about 
understanding the data or the exam's instructions. You may not ask questions on 
any topics from past assignments or material related to the exam. 
- The instructor will provide code debugging if needed, but this will result in
a **grade penalty** if needed.

### Academic Integrity

By taking this exam, you pledge to uphold the Duke Community Standard on this
exam:

- I will not lie, cheat, or steal in my academic endeavors;
- I will conduct myself honorably in all my endeavors; and
- I will act if the Standard is compromised.

# Submission

Please only upload your pdf document to Gradescope. Before you submit the 
uploaded document, mark where each answer is to the exercises. If any answer 
spans multiple pages, then mark all pages. Make sure to associate the “Overall”
section with the first page. **Failure to do so may result in points being**
**taken off.**

Make sure that your uploaded pdf document matches your .Rmd file and .pdf in
your repository exactly. Points will be deducted for non-reproducibility.

# Data

What do you think determines the selling price of a home? Square footage? Number
of bedrooms? Location? Charm? Purchasing a home is a huge investment and home 
buyers and sellers are interested in determining the attributes of a home
associated with selling price. 

The data for this exam are taken from the City of Minneapolis Assessor's office
and contain the selling price and other attributes of a random sample of 
single-family homes sold in Minneapolis, Minnesota between 2005 and 2015. The 
data have been slightly modified for the purposes of this exam.

The variables in this dataset are as follows:

- `saleyear`: year of sale (2005 - 2015)
- `salemonth`: month of sale (1 = "Jan", 2 = "Feb", etc)
- `salesprice`: sale price (U.S. dollars)
- `area`: area (square feet)
- `beds`: number of beds
- `baths`: number of baths
- `stories`: number of stories
- `yearbuilt`: year home was built
- `neighborhood`: neighborhood where home is located
- `community`: community where home is located
- `lotsize`: size of lot (square feet)
- `numfireplaces`: number of fireplaces

# Exercises

You will need the `tidyverse` package for this exam. 

To see the exam questions with math formatting ($\alpha$, $\mu$, etc), click the
"Preview" button above your .md file (where you usually see knit).

### Exercise 1

Create and save the new variables described below.

- `pricesqft`: price per square foot of each house
- `fireplace`: an indicator for the presence of a fireplace
- `holidays`: an indicator for whether the home was sold in Oct, Nov, or Dec
- `prewar`: an indicator for whether the home was built during or before 1940

### Exercise 2

Use a single code pipeline to create a dataset containing the houses with the 
smallest and largest price per square foot in each neighborhood. Include only 
the columns `salesprice`, `neighborhood`, and `pricesqft`. 

Print the rows corresponding to the neighborhood Minnehaha.

### Exercise 3

Are more homes sold in the summer months? Use a single code pipeline to create a
new dataset containing the count of homes sold in each month across all years.

Use this dataset to construct an effective, well-labeled visualization of the
count of homes sold and month. Describe what you observe. Note: do not do 
inference for this problem.

### Exercise 4

Use a single code pipeline to report the sample correlation between lot size
and area.

Then, construct a 99% bootstrap confidence interval for the true correlation.
Display your bootstrap distribution and confidence interval in an effective
visualization and provide a concise, one-sentence interpretation of your
interval in the context of the problem.

### Exercise 5

A real estate agent working in the community *Southwest* is trying to convince 
individuals to purchase a home by supplying an interval estimate of the true 
mean lot size of sold homes. Larger lot sizes means more room for activities:
grilling, playing catch, swingsets, etc.

Construct a 90% confidence interval for the mean lot size of houses sold in the
*Southwest* community using both a simulation-based approach and a CLT-based
approach.

### Exercise 6

Suppose the mean lot size for single-family homes in the United States is 10,134
square feet. Denote by $\mu$ the true mean lot size of homes sold in the 
Southwest community.

Would a hypothesis test conducted using $\alpha = 0.10$ of the hypotheses 
$H_o: \mu = 10,134$ and $H_a: \mu \neq 10,134$ reject or fail to reject the null 
hypothesis? Answer using the confidence interval from Exercise 5 and describe
the connection between confidence intervals and hypothesis tests. Note: do not 
perform the hypothesis test.

### Exercise 7

Homes with fireplaces are cozy and inviting, particularly around winter
holidays. Does the presence of a fireplace help convince a buyer to purchase a 
home when it is cold outside? Comprehensively assess the claim that a higher
proportion of homes sold during October, November, and December have fireplaces 
compared to homes sold during other months.

Visualize your simulated null distribution and observed data on a single, 
effective visualization.

### Exercise 8

Pre-war homes (constructed during and before 1940) are known for their 
sturdy construction and charm, including elements like high ceilings, decorative 
moldings, and hardwood floors.

Comprehensively assess the claim that pre-war homes have a higher median price
per square foot compared to non pre-war homes. Use a simulation-based method.

### Exercise 9

Suppose you are interested in testing the claim that more than 50% of Minneapolis
residents own a pet. You take a random sample of 104 residents and find that 
53.8% own a pet. Describe the procedure for constructing a simulation-based null 
distribution and finding the p-value. 

Your answer should not include any 
references to code (for loops, storing data, etc). Instead, describe the 
sampling scheme using **words**. For example, you could describe the sampling 
procedure using different numbers of red and white marbles.


### Exercise 10

A random sample of 1,231 Minneapolis residents is taken and 0.5207 report that 
they rent (rather than own) their home. A 95% confidence interval for the true
proportion of Minneapolis residents who rent their homes is (0.492, 0.549).

Identify the following statements as TRUE or FALSE. No justification is 
necessary.

(a) There is a 95% chance the true population proportion is between 0.492 and 
0.549.

(b) If we considered many random samples of Minneapolis residents of size 1,231 
and calculated 95% confidence intervals for each sample, approximately 95% of 
them will contain the true population proportion.

(c) If we considered many random samples of Minneapolis residents of size 1,231
and calculated 95% confidence intervals for each sample, approximately 95% of 
the sample proportions will be between 0.492 and 0.549.

(d) We are 95% confident the sample proportion is between 0.492 and 0.549.

### Exercise 11

Identify the following statements as TRUE or FALSE. Provide a brief, one 
sentence justification for statements that are FALSE. No justification is 
necessary for TRUE statements.

(a) A p-value of 0.01 means the null hypothesis has a 1% chance of being true.

(b)  A nonsignificant difference (p-value > 0.05) means there is no difference 
between groups.

(c) A p-value < 0.05 means we have a relationship of practical importance.

(d) Smaller p-values imply the presence of larger or more important effects.

(e) We reject the null hypothesis if the p-value is less than $\alpha$.


