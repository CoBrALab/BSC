# May 5th 2019
# Can the cortical intensity profile be approximated with a sigmoid function?
### Load required libraries
##
library(plyr)
library(RMINC)
library(metafor)
library(mni.cortical.statistics) 

#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)
WD <- getwd()
setwd(WD)
setwd("..")
setwd("./samples/")

print(args)
gf <- data.frame(matrix(NA, nrow =1, ncol = 9))
gf$left_50 <- paste(args,"_GM_50_left.txt", sep = "")
gf$left_25 <- paste(args,"_GM_25_left.txt", sep = "")
gf$left_18_75 <- paste(args,"_GM_18_75_left.txt", sep = "")
gf$left_12_5 <- paste(args,"_GM_12_5_left.txt", sep = "")
gf$left_6_25 <- paste(args,"_GM_6_25_left.txt", sep = "")

gf$left_whiteboundary <- paste(args,"_WM_0_left.txt", sep = "")

#gf$left_wm50 <- paste(args,"_mid_left_WM.txt", sep = "")
gf$left_wm25 <- paste(args,"_WM_25_left.txt", sep = "")
gf$left_wm18_75 <- paste(args,"_WM_18_75_left.txt", sep = "")
gf$left_wm12_5 <- paste(args,"_WM_12_5_left.txt", sep = "")
gf$left_wm6_25 <- paste(args,"_WM_6_25_left.txt", sep = "")

gray_left50 <- vertexTable(gf$left_50)
gray_left25 <- vertexTable(gf$left_25)
gray_left18_75 <- vertexTable(gf$left_18_75)
gray_left12_5 <- vertexTable(gf$left_12_5)
gray_left6_25 <- vertexTable(gf$left_6_25)
left_whiteboundary <- vertexTable(gf$left_whiteboundary)
white_left25 <-  vertexTable(gf$left_wm25)
white_left18_75 <-  vertexTable(gf$left_wm18_75)
white_left12_5 <-  vertexTable(gf$left_wm12_5)
white_left6_25 <-  vertexTable(gf$left_wm6_25)
sf <- rbind(t(white_left25), t(white_left18_75), t(white_left12_5), t(white_left6_25), t(left_whiteboundary), t(gray_left6_25), t(gray_left12_5), t(gray_left18_75), t(gray_left25), t(gray_left50))
df <- cbind(sf, c(-25, -18.75, -12.5, -6.25, 0, 6.25, 12.5, 18.75, 25, 50))

dff <- as.data.frame(df)
model_a <- list()
model_k <- list()
model_c<- list()
model_d <- list()
model_c_adj <- list()
model_ratio <- list()
model_max <-list()
model_min <- list()

for (i in 1:40963){ 
  xvalues <- dff[,40963]
  yvalues <- dff[,i]
  adj_vals <- (yvalues - min(yvalues))/(max(yvalues)-min(yvalues))
  nls_fit_rest <- nls(formula = yvalues ~ a+exp(k)+(-exp(k))/(1 + exp(-c*(xvalues-d))),  start = list(a =min(yvalues), k = 5, c = 0.1, d = 0), algorithm="port", lower=c(min(yvalues), 0, 0, -50), upper=c(2000,100, 1, 50),control = nls.control(maxiter = 50, tol = 1e-05, minFactor = 1/5096, printEval = FALSE, warnOnly = TRUE))
  nls_fit_adj <- nls(formula = adj_vals ~ a+exp(k)+(-exp(k))/(1 + exp(-c*(xvalues-d))),  start = list(a =min(adj_vals), k = 5, c = 0.1, d = 0), algorithm="port", lower=c(min(adj_vals), 0, 0, -50), upper=c(2000,100, 1, 50),control = nls.control(maxiter = 50, tol = 1e-05, minFactor = 1/5096, printEval = FALSE, warnOnly = TRUE))
  
   coeffs <- coef(nls_fit_rest)
  coeffs_adj <- coef(nls_fit_adj)
  model_c_adj[i] <- coeffs_adj[3]
  model_c[i] <- coeffs[3]
  model_ratio[i] <- yvalues[1]/yvalues[9]
}

model_c[1:10]
model_c_adj[1:10]

model_c_log<- log(as.numeric(model_c)+0.1)

setwd("..")
setwd("./sigmoid_fit/unsmoothed/")

 #write lists to .txt files
write.table(as.numeric(model_c), paste(args,"_model_c_left.txt", sep=""), sep = "", col.names = FALSE, row.names = FALSE)
write.table(as.numeric(model_ratio), paste(args,"_model_ratio_left.txt", sep=""), sep = "", col.names = FALSE, row.names = FALSE)
write.table(as.numeric(model_c_log), paste(args,"_model_c_left_log.txt", sep=""), sep = "", col.names = FALSE, row.names = FALSE)


