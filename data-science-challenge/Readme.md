# Data Science Challenge
There are two tasks with two subtasks each. One is a typical problem in the area of supervised learning and the other one is about unsupervised learning
The challenge is not about finding the perfect solution but about showing how you approach the problem and which steps have been taken.

The result should be a small slidedeck ( ~ 5 slides) that shows the approach and the results.

Use whatever tools you want.

## Task 1
### Data
- [data.csv](data.csv)
- [target.csv](target.csv)

### Task

The file [data.csv](data.csv) contains 10'000 records with 100 columns each.

Each record corresponds to one measurement with all its 100 features.

The file [target.csv](target.csv) contains a label (0/1) per record (row-numbers are the foreign keys between target and data)

1. Define a set of classifiers that predict the labels (from target.csv). It is important that you explain why you choose a specific classifier and how it has been evaluated.

2. Reduce the number of features by selecting the important features (in respect to your choosen classifier). Again, show how you approached the problem.


## Task 2
### Data
- [text_clustering.csv](text_clustering.csv)

### Task


the file [text_clustering.csv](text_clustering.csv) contains two columns: `ID`, `X1.text`. 

Each record contains an Identifier (`ID`) and an Article text (`X1.text`). 
Note: the texts still contains HTML tags.

1. Try to cluster the texts. Which Method have you choosen and how can you test if the clusters are significant ?

2. Visualize the clusters
