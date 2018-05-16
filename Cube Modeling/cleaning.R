rm(list=ls())
library(readxl)
cube <- read_excel("C:/Users/uni5p_000/Desktop/RMIT_Studies/Machine-Learning-Projects/Cube Modeling/Simplex Cube Register.xlsx", 
                   skip = 2)

cube$Sr.No <- NULL
cube$Remark <- NULL
cube$`CUBE ID` <- NULL
cube$`Date of Testing` <- NULL
cube$`Date of Casting` <- NULL
cube$X__1 <- NULL
cube$`Structure` <- NULL
cube$`Location` <- NULL
cube$`Avg. Strength in  N/mm2` <- NULL
cube$`Comp. Strength in N/mm2` <- NULL

columnsModification <- function(colname){
  i <- 1
  temp <- ""
  while (i < length(cube[[colname]])) {
    if(!is.na(cube[[colname]][i])){
      temp <- cube[[colname]][i]
    }
    else{
      cube[[colname]][i] <- temp
    }
    i <- i+1
  }
  return(cube)
}

colNames <- c('Concrete Grade','Age','Qty.','Concrete Source','Comp. Strength in %')

for(i in 1:length(colNames))
  cube <- columnsModification(colNames[i])

cube <- cube[!cube$`Comp. Strength in %` == 0, ]

cube <- cube[!cube$`Comp. Strength in %` > 200, ]

write.csv(cube, file = "C:/Users/uni5p_000/Desktop/RMIT_Studies/Machine-Learning-Projects/Cube Modeling/cube.csv", row.names=FALSE)
