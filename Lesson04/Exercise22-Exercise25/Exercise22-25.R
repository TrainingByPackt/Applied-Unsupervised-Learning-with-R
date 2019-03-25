#Exercise22
filepath='census.csv'
mkt<-read.csv(filepath,stringsAsFactors=FALSE,header=FALSE,sep=',')

head(mkt)
mkt$old<-1*(mkt$V1>median(mkt$V1))
mkt$young<-1*(mkt$V1<=median(mkt$V1))

mkt$government_employee<-1*(mkt$V2 %in% c(" State-gov"," Local-gov","Federal-gov"))
mkt$self_employed<-1*(mkt$V2 %in% c(" Self-emp-not-inc"," Self-empinc"))
mkt$never_worked<-1*(mkt$V2 %in% c(" Never-worked"))
mkt$private_employment<-1*(mkt$V2 %in% c(" Private"))
mkt$other_employment<-1*(mkt$V2 %in% c(" ?"," Without-pay" ))

mkt$high_school_incomplete<-1*(mkt$V4 %in% c(" 1st-4th"," Preschool","5th-6th"," 7th-8th"," 9th"," 10th"," 11th"," 12th"))
mkt$high_school_complete<-1*(mkt$V4 %in% c(" HS-grad"," Some-college","Assoc-acdm"," Assoc-voc"))
mkt$bachelors<-1*(mkt$V4 %in% c(" Bachelors"))
mkt$post_bachelors<-1*(mkt$V4 %in% c(" Masters"," Prof-school"," Doctorate" ))

mkt$married<-1*(mkt$V6 %in% c(" Married-civ-spouse"," Married-AFspouse","Married-spouse-absent"))
mkt$never_married<-1*(mkt$V6 %in% c(" Never-married"))
mkt$divorced_separated<-1*(mkt$V6 %in% c(" Divorced"," Separated"))
mkt$widowed<-1*(mkt$V6 %in% c( " Widowed"))

mkt$clerical<-1*(mkt$V7 %in% c(" Adm-clerical"))
mkt$managerial<-1*(mkt$V7 %in% c(" Exec-managerial"))
mkt$moving<-1*(mkt$V7 %in% c(" Transport-moving"))
mkt$farming_fishing<-1*(mkt$V7 %in% c(" Farming-fishing"))
mkt$craft_repair<-1*(mkt$V7 %in% c(" Craft-repair" ))
mkt$sales<-1*(mkt$V7 %in% c(" Sales"))
mkt$tech_support<-1*(mkt$V7 %in% c(" Tech-support"))
mkt$service<-1*(mkt$V7 %in% c(" Protective-serv"," Priv-house-serv", "Other-service"))
mkt$armed_forces<-1*(mkt$V7 %in% c(" Armed-Forces"))
mkt$other_occupation<-1*(mkt$V7 %in% c(" Handlers-cleaners"," ?"," Machine-op-inspct"," Prof-specialty"))

mkt$male<-1*(mkt$V9 %in% c(" Male"))
mkt$female<-1*(mkt$V9 %in% c(" Female"))

mkt$high_hours<-1*(mkt$V12 > median(mkt$V12))
mkt$low_hours<-1*(mkt$V12 <= median(mkt$V12))

mkt$usa<-1*(mkt$V13==" United-States")
mkt$not_usa<-1*(mkt$V13!=" United-States")

mkt$low_income<-1*(mkt$V14==" <=50K")
mkt$high_income<-1*(mkt$V14==" >50K")

mktdummies<-mkt[,15:ncol(mkt)]
mktdummies

#Exercise23
support_thresh<-0.1
firstpass<-unname(which(colMeans(mktdummies,na.rm=TRUE)>support_thresh))
secondcand<-t(combn(firstpass,2))
secondpass<-NULL
k<-4
support<-mean(mktdummies[,secondcand[k,1]]*mktdummies[,secondcand[k,2]]
              ,na.rm=TRUE)
print(support)

k<-1
while(k<=nrow(secondcand)){
  support<-mean(mktdummies[,secondcand[k,1]]*mktdummies[,secondcand[k,2]]
                ,na.rm=TRUE)
  if(support>support_thresh){
    secondpass<-rbind(secondpass,secondcand[k,])
  }
  k<-k+1
}
print(head(secondpass))

#Exercise 24
product<-1
n<-1
thirdpass<-NULL
k<-1
while(k<=nrow(secondpass)){
  j<-1
  while(j<=length(firstpass)){
    n<-1
    product<-1
    while(n<=ncol(secondpass)){
      product<-product*mktdummies[,secondpass[k,n]]
      n<-n+1
    }
    if(!(firstpass[j] %in% secondpass[k,])){
      product<-product*mktdummies[,firstpass[j]]
      support<-mean(product,na.rm=TRUE)
      if(support>support_thresh){
        thirdpass<-rbind(thirdpass,c(secondpass[k,],firstpass[j]))
      }
    }
    j<-j+1
  }
  k<-k+1
}

fourthpass<-NULL
k<-1
while(k<=nrow(thirdpass)){
  j<-1
  while(j<=length(firstpass)){
    n<-1
    product<-1
    while(n<=ncol(thirdpass)){
      product<-product*mktdummies[,thirdpass[k,n]]
      n<-n+1
    }
    if(!(firstpass[j] %in% thirdpass[k,])){
      product<-product*mktdummies[,firstpass[j]]
      support<-mean(product,na.rm=TRUE)
      if(support>support_thresh){
        fourthpass<-rbind(fourthpass,c(thirdpass[k,],firstpass[j]))
      }
    }
    j<-j+1
  }
  k<-k+1
}
print(head(thirdpass))

print(head(fourthpass))


#Exercise 25
head(thirdpass)
k<-5
confidence<-mean(mktdummies[,thirdpass[k,1]]*mktdummies[,
                                                        thirdpass[k,2]]*mktdummies[,thirdpass[k,3]],na.rm=TRUE)/
  mean(mktdummies[,thirdpass[k,1]]*mktdummies[,thirdpass[k,2]],na.rm=TRUE)
k<-5
lift<-confidence/mean(mktdummies[,thirdpass[k,3]],na.rm=TRUE)
lift_thresh<-1.8
conf_thresh<-.8

thirdpass_conf<-NULL
k<-1
while(k<=nrow(thirdpass)){
  support<-mean(mktdummies[,thirdpass[k,1]]*mktdummies[,thirdpass[k,2]]*mktdummies[,thirdpass[k,3]],na.rm=TRUE)
  confidence<-mean(mktdummies[,thirdpass[k,1]]*mktdummies[,
                                                          thirdpass[k,2]]*mktdummies[,thirdpass[k,3]],na.rm=TRUE)/
    mean(mktdummies[,thirdpass[k,1]]*mktdummies[,thirdpass[k,2]],na.rm=TRUE)
  lift<-confidence/mean(mktdummies[,thirdpass[k,3]],na.rm=TRUE)
  thirdpass_conf<-rbind(thirdpass_conf,unname(c(thirdpass[k,],support,confidence,lift)))
  k<-k+1
}
thirdpass_high<-thirdpass_conf[which(thirdpass_conf[,5]>conf_thresh & thirdpass_conf[,6]>lift_thresh),]
head(thirdpass_high)
