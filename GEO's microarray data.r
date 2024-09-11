e2<-gset[[1]]
phe<-e2@phenoData@data #提取临床信息
exp<-e2@assayData[["exprs"]] #提取表达量信息

library(tidyverse)
library(data.table)
library(stringr)
GPL175<-read.table("D:/work1/task/09免疫治疗响应预测/0903集合数据/GPL17586-45144.txt",header = TRUE,sep = "\t",fill=TRUE)
gpl<-GPL175[,c("ID","gene_assignment")] #提取ID列和gene_assignment列

gpl<-data.frame(gpl$ID,str_split_fixed(gpl$gene_assignment,pattern = "//",3)[,2]) #提取基因名
colnames(gpl)<-c("ID","gene_assignment") #修改列名
gpl_1<-gpl[!str_detect(gpl$gene_assignment,"---"),] #把包含“---”的行删除
write.csv(gpl_1, "D:/work1/task/09免疫治疗响应预测/0903集合数据/gpl.csv", row.names = FALSE)

GSE<-read.csv("D:/work1/task/09免疫治疗响应预测/0903集合数据/GSE.csv", header = TRUE, sep = ",")
full_merged_df <- full_join(gpl, GSE, by = "ID")   #合并两个数据框
full_merged_df_1<-full_merged_df[!str_detect(full_merged_df$gene_assignment,"---"),] #删除缺失值
merge <- full_merged_df_1[, -1]     #删除第一列
write.csv(merge_clean, "D:/work1/task/09免疫治疗响应预测/0903集合数据/merge_clean.csv", row.names = FALSE) #保存为csv文件
merge_clean <- na.omit(merge)   #删除缺失值