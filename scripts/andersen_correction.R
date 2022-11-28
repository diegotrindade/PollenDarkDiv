
library(vegan)
library(here)

and<-read.csv(here("data", "andersens.csv"))

and$Taxon<-as.character(and$Taxon)

dat<-read.csv(here("data","pollen_raw.csv"), row.names = 1)

#dat.poll<-dat[,4:143]
dat.poll<-pollen_raref[,4:143]
poll.sum<-rowSums(dat.poll)
min(poll.sum)#minimum pollen sum 411

m<-match(and$Taxon, names(dat.poll))
data.frame(and$Taxon, m)
and1<-and[is.na(m)==F,]
m1<-match(and1$Taxon, names(dat.poll))

dat.poll1<-dat.poll
#Andersen-transformed pollen counts:
for (i in 1:length(m1)){
dat.poll1[,m1[i]]<-round(dat.poll[,m1[i]]*and1[i,2], digits=0)
}

poll.sum1<-rowSums(dat.poll1)
min(poll.sum1)#is no 152, 62 samples with pollen sum <300

trasnf_data <-data.frame(dat[,1:3],dat.poll1)
#write.table(data.frame(dat[,1:3],dat.poll1), "pollen.csv", sep=",")

#write.table(data.frame(dat[,1:3],dat.poll), "pollen_raw.csv", sep=",")

