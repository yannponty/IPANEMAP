library(ggplot2)

Noprobing<-c(	0.55	,	0.55	,	0.78	,	0.8	,	0.79	,	0.73	,	0.55	,	0.55	,	0.75	,	0.55		)
M7ILUMg<-c(	0.84	,	0.84	,	0.79	,	0.85	,	0.84	,	0.85	,	0.85	,	0.8	,	0.85	,	0.85		)
M7ILU	<-c(	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84		)
DMS	<-c(	0.81	,	0.81	,	0.82	,	0.81	,	0.82	,	0.82	,	0.82	,	0.81	,	0.82	,	0.82		)
NMIAMg	<-c(	0.8	,	0.8	,	0.81	,	0.81	,	0.8	,	0.8	,	0.81	,	0.81	,	0.81	,	0.81		)
NMIAMgCE	<-c(	0.74	,	0.74	,	0.73	,	0.73	,	0.73	,	0.73	,	0.74	,	0.74	,	0.73	,	0.72		)
M7	<-c(	0.83	,	0.83	,	0.81	,	0.71	,	0.7	,	0.7	,	0.64	,	0.75	,	0.73	,	0.81		)
NMIA	<-c(	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.64	,	0.79		)
M7Mg	<-c(	0.79	,	0.79	,	0.77	,	0.79	,	0.78	,	0.78	,	0.78	,	0.79	,	0.63	,	0.77		)
M7ILU3Mg	<-c(	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74		)
BzCN	<-c(	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	)
NaiMg	<-c(	0.71	,	0.71	,	0.72	,	0.71	,	0.72	,	0.71	,	0.71	,	0.72	,	0.72	,	0.72	)
M7ILU3	<-c(	0.63	,	0.63	,	0.58	,	0.66	,	0.63	,	0.58	,	0.63	,	0.65	,	0.61	,	0.72)
Nai	<-c(	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6		)
CMCT	<-c(	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6		)
GM<-c(	0.55	,	0.55	,	0.78	,	0.8	,	0.79	,	0.73	,	0.55	,	0.55	,	0.75	,	0.55,0.84	,	0.84	,	0.79	,	0.85	,	0.84	,	0.85	,	0.85	,	0.8	,	0.85	,	0.85		,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84	,	0.84		,	0.81	,	0.81	,	0.82	,	0.81	,	0.82	,	0.82	,	0.82	,	0.81	,	0.82	,	0.82		,	0.8	,	0.8	,	0.81	,	0.81	,	0.8	,	0.8	,	0.81	,	0.81	,	0.81	,	0.81		,	0.74	,	0.74	,	0.73	,	0.73	,	0.73	,	0.73	,	0.74	,	0.74	,	0.73	,	0.72		,	0.83	,	0.83	,	0.81	,	0.71	,	0.7	,	0.7	,	0.64	,	0.75	,	0.73	,	0.81		,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.79	,	0.64	,	0.79		,	0.79	,	0.79	,	0.77	,	0.79	,	0.78	,	0.78	,	0.78	,	0.79	,	0.63	,	0.77		,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74	,	0.74		,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.73	,	0.71	,	0.71	,	0.72	,	0.71	,	0.72	,	0.71	,	0.71	,	0.72	,	0.72	,	0.72	,	0.63	,	0.63	,	0.58	,	0.66	,	0.63	,	0.58	,	0.63	,	0.65	,	0.61	,	0.72,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6		,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6	,	0.6		)

k<-c('1','2','3','4','5','6','7','8','9','10')
l<-c("(-)","1M7","1M7ILU","1M7ILU3","BzCN","CMCT","DMS","Nai","NMIA","1M7Mg","1M7ILUMg","1M7ILU3Mg","NaiMg","NMIAMg","NMIAMgCE")
Probing_condition<-(c(rep("(-)",10),rep("1M7ILUMg",10),rep("1M7ILU",10),rep("DMS",10),rep("NMIAMg",10),rep("NMIAMgCE",10),rep("1M7",10),rep("NMIA",10),rep("1M7Mg",10),rep("1M7ILU3Mg",10),rep("BzCN",10),rep("NaiMg",10),rep("1M7ILU3",10),rep("Nai",10),rep("CMCT",10)))
Conditions<-rep(c('1','2','3','4','5','6','7','8','9','10'),15)
Mg<-(c(rep("+Mg",10),rep("+Mg",10),rep("-Mg",10),rep("+Mg",10),rep("+Mg",10),rep("+Mg",10),rep("-Mg",10),rep("-Mg",10),rep("+Mg",10),rep("+Mg",10),rep("+Mg",10),rep("+Mg",10),rep("-Mg",10),rep("-Mg",10),rep("+Mg",10)))
StopMutation<-c(rep("I",10),rep("M",10),rep("M",10),rep("S",10),rep("M",10),rep("S",10),rep("M",10),rep("M",10),rep("M",10),rep("M",10),rep("S",10),rep("S",10),rep("M",10),rep("S",10),rep("S",10))     
df<- data.frame(Probing_condition,Conditions,GM,Mg,StopMutation)
df$Probing_condition<-factor(df$Probing_condition, levels = l)
df$Mg <- factor(df$Mg,levels=c("+Mg","-Mg"),
                labels=c("With Magnesium","Magnesium-free")) 
df$StopMutation <- factor(df$StopMutation, levels=c("S","M","I"),
                          labels=c("Stops-based","Mutation-based","In silico")) 

#facets=Mg~StopMutation,
#facet_wrap: creates a separate panel for each benchmark + facet_wrap(Mg~StopMutation)
p<-qplot(Conditions, GM, data=df, shape=Probing_condition, color=Probing_condition, 
          size=I(3),facets=Mg~StopMutation,
         xlab="RUN", ylab="MCC") + 
  geom_point() +
  scale_shape_manual(values=c(0,13,13,13,13,13,13,1,1,1,1,1,6,6,2))+
  scale_color_manual(values=c("#E69F00","#009E73","#56B4E9","#0072B2","#0072B2","#56B4E9","#009E73","coral2","black","#CC79A7","#6495ED","#6495ED","darkolivegreen4","darkolivegreen4","darkolivegreen4"))+
  coord_flip()
Mypalette<-c("#E69F00","#009E73","#56B4E9","#0072B2","coral2","black","#CC79A7","#6495ED","darkolivegreen4","#009E73","#56B4E9","#0072B2","#6495ED","darkolivegreen4","darkolivegreen4")
##################second figure
p<-qplot(Conditions, GM, data=df, shape=Probing_condition, color=Probing_condition, 
      size=I(3),
      xlab="RUN", ylab="MCC") + 
  geom_point() + facet_wrap(Mg~StopMutation)+
  scale_shape_manual(values=c(0,13,13,13,1,1,1,1,6,13,13,13,1,6,6))+
  scale_color_manual(values=Mypalette)+
  coord_flip()+theme(legend.position = c(0.85,0.01))
p
ggsave("Reproductibility.pdf", width = 9, height = 5.85,units="in")

