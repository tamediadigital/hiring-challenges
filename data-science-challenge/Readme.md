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

1. Define a set of classifiers which predict the labels (from target.csv). 
Goals:
	- Explain why you have chosen the classifiers you present
	- Explain your evaluation strategy, e.g., avoiding overfitting etc.
2. Reduce the number of features by selecting the important features (with respect to your set of classifiers). 
Goals:
	- Explain your method for dimensionality reduction
	- How can you ensure a minimum of information loss?

## Task 2
### Data
- [text_clustering.csv](text_clustering.csv)

### Task
The file [text_clustering.csv](text_clustering.csv) contains two columns: `ID`, `X1.text`. 

Each record contains an identifier (`ID`) and an article text (`X1.text`). 
Note: texts still contains HTML tags.

1. Try to cluster the texts. 
Goals:
	- Explain the clustering method(s) you have chosen
	- How can you test the significance of the clusters found by your method(s)?

2. Visualise the clusters
Goals:
	- Make useful representations of the clusters
	- What are the shared characteristics of the articles within a cluster?
