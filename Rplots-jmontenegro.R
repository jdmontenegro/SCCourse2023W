### libraries
library(edgeR)
library(reshape2)
library(tidyverse)

### setting working directory
setwd("/scratch/course/2023w300106/BAMS/")

### loading data and normalizing
counts <- read_tsv("counts.tsv", comment = "#")
rpk <- counts[, 3:13]/unlist(counts[,2]) * 1000
tpm <- cpm(rpk)

### filtering
tpmFil <- tpm[rowSums(tpm)>0,]  # remove genes that have 0 counts in all libraries

### reshaping
melNorm <- melt(tpmFil) # reshape the matrix into a plotable table

### plotting
ggplot(melNorm) +  # take data to plot from melNorm table
  geom_boxplot(aes(x=Var2, y=value, col=Var2)) + # plot a boxplot using library as X and read counts as Y
  scale_y_log10() # log-transform the data for plotting

### filtering using tidyverse
melNorm %>% 
  dplyr::filter(value>=1) %>%                # filter tpm values greater than 1, why? bc
  ggplot(aes(y=value, col=Var2)) +           # plotting and setting aesthetics
    geom_violin(aes(x=Var2)) +               # we chose violin plot bc hey are pretty
    scale_y_log10() +                        # we scale the y axis to soften the long distances from min-max
    geom_boxplot(width=0.15, aes(x=Var2))    # we draw a boxplot for reference

### Principal component analysis
pcaRes <- prcomp(t(tpmFil), scale=TRUE, center=TRUE)

# adding some libraries for nicer visualization
library(ggsci)
library(ggrepel)

ggplot(as.data.frame(pcaRes$x), aes(x=PC1, y=PC2)) +          # converts the pca matrix into a dataframe and plots PC1 and PC2
  theme_bw() +                                                # white background
  geom_point(aes(col=rownames(pcaRes$x))) +                   # colors the points based on library name
  geom_label_repel(size = 2, aes(label=rownames(pcaRes$x))) + # adds labels to the data points so we can easily identify them
  scale_color_futurama() +                                    # changes the color palette to make it nicer
  theme(legend.position = "none")                             # removes the legend (not necessary)
  