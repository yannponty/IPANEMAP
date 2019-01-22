library(reshape2)
library(ggplot2)
library(scales)

k<-c('(-)','CMCT','DMS','NMIA','DMS+CMCT','DMS+NMIA','NMIA+CMCT','NMIA+DMS+CMCT')
df<- data.frame(Program=rep(c("MFE [Rnafold]","MEA [Rnafold]","IPANEMAP"), each=4),
                Conditions=rep(c('(-)','CMCT','DMS','NMIA')),
                GM=c(0.6883333333, 0.5791666667,0.6476666667, 0.7431666667,0.6305, 0.6236666667,  0.686,0.6766666667,0.6036666667,0.6988333333,0.7588333333,0.771))
meanMFE<-mean(0.5791667,0.6476667, 0.7431667)
meanMEA<-mean(0.6236667,0.6860000,0.6766667)
meanIPANEMAP<- mean(0.6988333,0.7588333,0.7710000)
  
df2<- data.frame(Program=rep(c("IPANEMAP")),
                Conditions=rep(c('DMS+CMCT','DMS+NMIA','NMIA+CMCT','NMIA+DMS+CMCT')),
                GM=c(0.7055,0.7681666667,0.7693333333,0.7851666667))
head(df)
df<-rbind(df,df2)

df$Conditions<-factor(df$Conditions, levels = k)
df$Program2<- relevel(df$Program, "IPANEMAP")# to order by legend
df$x_pos[order(df$Conditions, df$Program2)] <- 1:nrow(df)

 df$x_pos
 #[1]  3  6  9 12  1  4  7 10  2  5  8 11 13 14 15 16
 #Adjust position:
 df$x_pos<- c(3,6.5,10,13.5,2,5.5,9,12.5,1,4.5,8,11.5,15.5,17,18.5,20.5)
# for bar width modif aes(x=Conditions, y=GM, fill=Program,width=.6)## to keep the same bar width: position_dodge(preserve = "single")
p<-ggplot(data=df, aes(x=df$x_pos, y=GM, fill=Program2),legend=c("MFE [RNAfold]","IPANEMAP","MEA [RNAfold]"))+
  geom_hline(yintercept=c(0.6988333333,0.771,0.7588333333),color="grey",size=1,alpha=0.2)+# size for width and alpha for clearness
  geom_bar(stat="identity",position="dodge", width=1)+
  theme(axis.text.x = element_text(angle = 90, hjust = 1),text = element_text(size=10))+
  labs(fill=" ")#+guides(fill=guide_legend(nrow=2,byrow=TRUE))# to make legend in 2 rows
p+scale_x_continuous(breaks=c(2,5.5,9,12.5,15.5,17,18.5,20.5),labels=k)+xlab("")+
theme(legend.position="top",legend.justification="left")+ scale_fill_manual(values=c("#66C2A5","#8DA0CB","#E78AC3"))+coord_flip(ylim =c(.5,.8) )

  #p + theme_gray(base_size = 14)
ggsave("cordero_mean.pdf", width = 5, height = 4,units="in")

#extract colors from palette
library(RColorBrewer)
f <- function(pal) brewer.pal(brewer.pal.info[pal, "maxcolors"], pal)
(cols <- f("Set2"))

