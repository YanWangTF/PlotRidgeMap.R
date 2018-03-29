#!/usr/bin/env Rscript

#This R script is used to plot ridge map of each domain for a given table (column names are domains)
#Usage: Rscript PlotRidgeMap.R input.table

args = commandArgs(trailingOnly=TRUE)

library(ggplot2)
library(ggridges)

T <- read.table(args[1], header=TRUE)
T$Species <- factor(T$Species, levels=c('Glomeromycotina','Mucoromycotina','Mortierellomycotina','Kickxellomycotina','Entomophthoromycotina','Zoopagomycotina', ordered=TRUE))

D<-colnames(T)[-1]

for (a in D){
postscript(a)
print(ggplot(T, aes_string(x=a, y="Species")) + geom_density_ridges())
dev.off()
}
