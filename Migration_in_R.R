setwd("C:\Users\hmehdizade\Desktop\Migration_in_R")

#above will be your preferred workspace

data = 'input_data.csv'

# this is my input file. input will have these attributes: loan id, month of record,migration bucket at that month, migration bucket at next month

data_load = read.csv2(file = data, header = TRUE, sep = ";", dec = ".", skip = 0)
table_general=table(data_load$current_bucket,data_load$next_bucket)
data1 = data_load[!(data_load$month!="2016December"),]
data2 = data_load[!(data_load$month!="2017January"),]
data3 = data_load[!(data_load$month!="2017February"),]
data4 = data_load[!(data_load$month!="2017March"),]
data5 = data_load[!(data_load$month!="2017April"),]
data6 = data_load[!(data_load$month!="2017May"),]
data7 = data_load[!(data_load$month!="2017June"),]
data8 = data_load[!(data_load$month!="2017July"),]
data9 = data_load[!(data_load$month!="2017August"),]
data10 = data_load[!(data_load$month!="2017September"),]
data11 = data_load[!(data_load$month!="2017October"),]
data12 = data_load[!(data_load$month!="2017November"),]

t1 = table(data1$current_bucket,data1$next_bucket)
t2 = table(data2$current_bucket,data2$next_bucket)
t3 = table(data3$current_bucket,data3$next_bucket)
t4 = table(data4$current_bucket,data4$next_bucket)
t5 = table(data5$current_bucket,data5$next_bucket)
t6 = table(data6$current_bucket,data6$next_bucket)
t7 = table(data7$current_bucket,data7$next_bucket)
t8 = table(data8$current_bucket,data8$next_bucket)
t9 = table(data9$current_bucket,data9$next_bucket)
t10 = table(data10$current_bucket,data10$next_bucket)
t11 = table(data11$current_bucket,data11$next_bucket)
t12 = table(data12$current_bucket,data12$next_bucket)

table1 = t1/rowSums(t1)
table2 = t2/rowSums(t2)
table3 = t3/rowSums(t3)
table4 = t4/rowSums(t4)
table5 = t5/rowSums(t5)
table6 = t6/rowSums(t6)
table7 = t7/rowSums(t7)
table8 = t8/rowSums(t8)
table9 = t9/rowSums(t9)
table10 = t10/rowSums(t10)
table11 = t11/rowSums(t11)
table12 = t12/rowSums(t12)


table_list = list(table1, table2, table3, table4, table5, table6, table7, table8, table9, table10, table11, table12)
table_list = apply(simplify2array(table_list), 1:2, mean)
default <- c(rep(0,dim(table_list)[2]-1),1)
table_list <- rbind(table_list,default)
require(Matrix)
library(expm)
table_list12 = table_list %^% 12
matrix = as.data.frame(matrix(sprintf("%.2f%%", table_list12*100), nrow(table_list12), dimnames = dimnames(table_list12)))
write.csv(matrix, "2017_migration.csv", row.names = FALSE)