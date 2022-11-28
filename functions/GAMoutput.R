## function summary GAM table from rmarkdown to word
notidy_glance_gam<-function(model,...){
  data.frame(
    df=sum(model$edf),
    df.residual=stats::df.residual(model),
    logLik=as.numeric(stats::logLik(model)),
    AIC = stats::AIC(model),
    BIC = stats::BIC(model),
    adj.r.squared=summary(model)$r.sq,
    deviance=summary(model)$dev.expl,
    nobs = stats::nobs(model),
    method=as.character(summary(model)$method),
    sp.crit=as.numeric(summary(model)$sp.criterion),
    scale.est=summary(model)$scale
  )
}

notidy_tidy_gam<-function(model,dig.num=2,...){
  ptab <- data.frame(summary(model)$p.table)
  ptab$term<-rownames(ptab)
  rownames(ptab)=NULL
  ptab$Component="A. parametric coefficients"
  ptab<-ptab[,c(6,5,1:4)]
  colnames(ptab) <- c("Component","Term", "Estimate", "Std.Error", "t.value", "p.value")
  ptab$p.value=with(ptab,ifelse(p.value<0.01,"<0.01",round(p.value,2)))
  ptab[,3:5]=format(round(ptab[,3:5],dig.num),nsmall=dig.num)
  ptab
  
  stab= data.frame(summary(model)$s.table)
  stab$term<-rownames(stab)
  rownames(stab)=NULL
  stab$Component="B. smooth terms"
  stab<-stab[,c(6,5,1:4)]
  colnames(stab) <- c("Component","Term", "edf", "Ref. df", "F.value", "p.value")
  stab$p.value=with(stab,ifelse(p.value<0.01,"<0.01",round(p.value,2)))
  stab[,3:5]=format(round(stab[,3:5],dig.num),nsmall=dig.num)
  stab
  
  ptab.cnames = c("Component","Term", "Estimate", "Std Error", "t-value", "p-value")
  stab.cnames = c("Component","Term", "edf", "Ref. df", "F-value", "p-value")
  
  colnames(ptab) = c("A", "B", "C", "D")
  if (ncol(stab) != 0) {
    colnames(stab) = colnames(ptab)
  }
  tab = rbind(ptab, stab)
  colnames(tab) = ptab.cnames
  
  tab2 = rbind(c(ptab.cnames), tab[1:nrow(ptab), ])
  if (nrow(stab) > 0) {
    tab2 = rbind(tab2, c(stab.cnames), tab[(nrow(ptab) + 1):nrow(tab), ])
  }
  
  tab2
}

notidy_as_flextable_gam<-function(x=NULL,data_t=NULL,data_g=NULL,dig.num=2,r2dig=2,brd.lwd=1.25,...){
  # needs flextable
  # magrittr
  if(sum(class(x)%in%c("gam"))==1&is.null(data_t)&is.null(data_g)){
    data_t <- notidy_tidy_gam(x)
    data_g <- notidy_glance_gam(x)
  }
  
  std_border=officer::fp_border(color = "black", style = "solid", width = brd.lwd)
  data.frame(data_t)%>%
    flextable()%>%
    delete_part(part="header")%>%
    hline(i=which(data_t=="Component"),border=std_border)%>%
    hline(i=which(data_t=="Component")[2]-1,border=std_border)%>%
    bold(i=which(data_t=="Component"))%>%
    align(j=1,part="all")%>%
    hline_top(border=std_border)%>%
    hline_bottom(border=std_border)%>%
    merge_v(j=1)%>%valign(j=1,valign="top")%>%fix_border_issues()%>%
    autofit(part = c("header", "body"))%>%
    add_footer_lines(values = c(
      sprintf("Adjusted R-squared: %s, Deviance explained %s", formatC(data_g$adj.r.squared,digits = r2dig,format="f"), formatC(data_g$deviance,digits = r2dig,format="f")),
      paste0(data_g$method,": ",format(round(data_g$sp.crit,dig.num),dig.num),", Scale est.: ",format(round(data_g$scale.est,dig.num),dig.num),", N: ",data_g$nobs)
    ))
}