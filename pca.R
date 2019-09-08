setwd("~/R Scripts")
load("LeukError.RData")

pca <- prcomp(leuk[, 1:5000], 3)
summary(pca)

#Scree Plot
plot(pca$sdev^2, type='b', 
     ylab='Eigenvalue (Variance of Each Component',
     main='Leukemia Screeplot')

#Plot the first 2 components
plot(pca$x[,1], pca$x[,2], col = leuk$V5001, 
     xlab = "Principal Component 1", 
     ylab = "Principal Component 2", 
     main = 'Leukemia Samples Projected into 2-dimensions')
legend(55000, -1000, legend = levels(leuk$V5001), col = unique(leuk$V5001))
text(pca$x[,1], pca$x[,2])
sum(pca$sdev[1:3]^2)/sum(pca$sdev^2)
#Sample 19 is probably mislabeled

library(RColorBrewer)
palette(brewer.pal(n = 8, name = "Dark2"))
colors = factor(palette())
colors = colors[leuk$V5001]

#3D Plot of all 3 components
library(rgl)
plot3d(x = pca$x[,1], 
       y = pca$x[,2],
       z= pca$x[,3], col = colors,
       size=7,
       xlab = "Principal Component 1", 
       ylab = "Principal Component 2", 
       zlab = "Principal Component 3")
