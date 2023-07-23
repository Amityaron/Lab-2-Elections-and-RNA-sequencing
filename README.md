# Lab 2 - Elections and RNA-sequencing
Open the following files:
1.Lab2_handout_52525.pdf<br />
2.Lab2.html <br />
3. Shiny app for K-mean&PCA on RNA sequencing.<br />
Lab 2 has 3 parts.<br /> 
**Part 1 Simulation-Study explores the behavior of running K-means with or without extracting the top 3 PCs:** <br />
Explore the behavior of running K-means with or without extracting the top 3 PCs, using a simulated dataset.<br /> 
We would like to see whether clustering can accurately recover the original<br />
distribution of each of the points.<br />
The goal is to compare the accuracy and the speed of two algorithms, for<br />
different dimension $p$ and different levels of variation.<br />
I compare K-means with or without extracting the top 3 PCs, using a simulated dataset.<br />

<img src="https://github.com/Amityaron/Lab-2-Elections-and-RNA-sequencing/blob/main/lab2%20image%202.png" width="60%" height="30%"> <br />
<img src="https://github.com/Amityaron/Lab-2-Elections-and-RNA-sequencing/blob/main/lab2%20image%201.png" width="60%" height="30%"> <br />

**Part 2 Comparing demographic and election data:** <br />
In this part, we will explore how socio-economical similarity between cities relates to similarity in voting
patterns Based on Hierarchical clustering and dendrogram trees.<br />
Finally, we create and compare two dendrogram tree hierarchical trees for the elections data. and hierarchical tree for the demographic data.<br />
We will use [Baker's Gamma](https://rdrr.io/cran/dendextend/man/cor_bakers_gamma.html)a similarity score for two trees.<br />
<img src="https://github.com/Amityaron/Lab-2-Elections-and-RNA-sequencing/blob/main/lab2%20image%203.png" width="60%" height="30%"> <br />
**Part 3 exploratory analysis of RNA seq data with Shiny apps:** <br />*
Apply PCA and K-mean on the data set 'gtex' that contains Gene Expression estimates collected by the Genotype Tissue Expression (gtex-
portal.org)..<br />
Each row signies a gene, and every column a tissue type (e.g. Heart, Exposed Skin, Unexposed
Skin)..<br />
The value measures the median expression level of the gene across multiple samples of the same tissue..<br />
Values are positive, with zero meaning there is no indication of the gene in the tissue..<br />
<img src="https://github.com/Amityaron/Lab-2-Elections-and-RNA-sequencing/blob/main/Screenshot.png"> <br />
