#R version 3.3.2 
  
library(reshape2)
library(ggplot2)

IPANEMAP<-c(0.945,0.6,0.843,0.836,0.762,0.982,0.851,0.74,0.671,0.761,0.914,0.85, 0.92,0.891,0.668,0.801,0.791,0.894,0.912, 0.827,0.977,0.591,0.667,0.539)
            
 Rsample<-c(0.274,0.031,0.576,0.58,0.514,0.749,0.641,0.57,0.548,0.651,0.81,0.755,0.833,0.836,0.624,0.758,0.791,0.894,0.929,0.851,1,0.651,0.727,0.707)
difference<-IPANEMAP-Rsample
 
mean(IPANEMAP)
mean(Rsample)
sd(IPANEMAP)
sd(Rsample)
mean(IPANEMAP[1:18])
mean (Rsample[1:18])
mean(IPANEMAP[19:24])
mean (Rsample[19:24])
mean(IPANEMAP[1:18])/mean (Rsample[1:18])
mean (Rsample[19:24])/mean (IPANEMAP[19:24])
Difference<-c(IPANEMAP-Rsample)
sum(Difference[1:18])
sum(Difference[19:24])

 k<-c('5SrEcoli [120]','Signal [301]','GroupIIO [412]','HCIRES [336]','tRNAphe [76]','P546 [155]' ,'5d16SrE [530]','GroupI [214]','Telom [47]' ,'RNase [401]' 
      ,'TPPE [79]','5d16SrHv [473]' ,'Lysine [174]','GroupIIT [425]','SAMI [118]','Fluorider [66]'
      ,'PreQ1 [34]','MBox [154]','cyclic [97]' ,'5d23SrE [511] ',  'Adenine [71]','tRNAasp [75]','SARS [79]','HIV15 [500]')

 df<- data.frame(Program=rep(c("IPANEMAP", "Rsample"), each=24),
                  RNAs=rep(c('5SrEcoli [120]','Signal [301]','GroupIIO [412]','HCIRES [336]','tRNAphe [76]','P546 [155]' ,'5d16SrE [530]','GroupI [214]','Telom [47]' ,'RNase [401]' 
                             ,'TPPE [79]','5d16SrHv [473]' ,'Lysine [174]','GroupIIT [425]','SAMI [118]','Fluorider [66]'
                             ,'PreQ1 [34]','MBox [154]','cyclic [97]' ,'5d23SrE [511] ',  'Adenine [71]','tRNAasp [75]','SARS [79]','HIV15 [500]')
                           ),GM=c(0.945,0.6,0.843,0.836,0.762,0.982,0.851,0.74,0.671,0.761,0.914,0.85, 0.92,0.891,0.668,0.801,0.791,0.894,0.912, 0.827,0.977,0.591,0.667,0.539,0.274,0.031,0.576,0.58,0.514,0.749,0.641,0.57,0.548,0.651,0.81,0.755,0.833,0.836,0.624,0.758,0.791,0.894,0.929,0.851,1,0.651,0.727,0.707))

df$RNAs<-factor(df$RNAs, levels = k)# to ensure the order by the RNA

p<-ggplot()+
  geom_bar(data=df, aes(x=RNAs, y=GM, fill=Program),stat="identity", position=position_dodge())+
 theme(axis.text.x = element_text(angle = 90, hjust = 1,vjust=0.3),text = element_text(size=10))+
  labs(fill=" ")+scale_fill_brewer(palette="Set2")+  ylim(0,1) +geom_rect(aes(xmin=-0.1,xmax=16.5,ymin=-Inf,ymax=Inf),alpha=0.2,fill="#CCFF99")+
  geom_rect(aes(xmin=16.5,xmax=18.5,ymin=-Inf,ymax=Inf),alpha=0.2,fill="#FFFFCC")+
  geom_rect(aes(xmin=18.5,xmax=25,ymin=-Inf,ymax=Inf),alpha=0.2,fill="#FFCC99")# pour les traits +geom_vline(xintercept=c(16.5,18.5),color ="grey")
#to remove grid:
#p+scale_fill_manual(values=c("palevioletred3","turquoise1"))
p+theme(legend.position="top")
#add separating lines:

#p+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),legend.position="top")
ggsave("Accuracy.pdf", width = 5.5, height = 5,units="in")# size of the figure

