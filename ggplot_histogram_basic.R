library(ggplot2)
args=commandArgs(T)

data = read.table(args[1],header=F)
value_column = as.integer(args[2])
mode(value_column)

colnames(data)[value_column] <- "value"
head(data)

min_data = min(data$value)
max_data = max(data$value)

ggplot(data,aes(x=data$value)) + 
	geom_histogram(aes(y =..count..), binwidth=1) +
	#geom_bar(aes(y =..count..)) +
	xlab("") +
	# scale_x_continuous(limits=c(min_data, max_data), breaks=seq(min_data,max_data,1)) +
	scale_x_continuous(limits=c(min_data, max_data)) +
	
	theme(
	      panel.background = element_blank(),
	      axis.line = element_line(),
	      panel.border = element_rect(fill=NA)
	)

ggsave("Basic_histogram.jpg")
print("output is : Basic_histogram.jpg")

