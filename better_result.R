library(dplyr)
library(plyr)


steve <- distinct(df_3, .keep_all = TRUE) #keep only the unique sample_ids. df_3 is demographics


prac_df <- steve[1:10, 1:6]


prac_gene <- filter(gene_mut_count, sample_id == c("TCGA-OR-A5J1", "TCGA-OR-A5J2", 
                                                   "TCGA-OR-A5J3", "TCGA-OR-A5J4", 
                                                   "TCGA-OR-A5J5", "TCGA-OR-A5J6",
                                                   "TCGA-OR-A5J7", "TCGA-OR-A5J8", 
                                                   "TCGA-OR-A5J9", "TCGA-OR-A5JB"))

prac_gene$Total <- rowSums(prac_gene[, 3:13]) #total mutation column


gene_count <- merge(prac_gene, prac_df, by = "sample_id", all = TRUE) #combine the sum of mutations and the demographics by sample_id. This gives repeated rows of the same person.



demogr <- steve


gene_mut_count$Total <- rowSums(gene_mut_count[, 3:13])

gene_demo <- merge(gene_mut_count, demogr, by = "sample_id", all = TRUE)














