* Encoding: UTF-8.



GRAPH
  /HISTOGRAM=Accesstoelectricityruralofruralpopulation.

GRAPH
  /HISTOGRAM=GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD.

GRAPH
  /HISTOGRAM=Educationalattainmentatleastcompletedprimarypopulation25yearstot.

GRAPH
  /HISTOGRAM=Time.

DESCRIPTIVES VARIABLES=Time Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Accesstoelectricityruralofruralpopulation
  /STATISTICS=MEAN STDDEV MIN MAX SKEWNESS.

CORRELATIONS
  /VARIABLES=Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time Accesstoelectricityruralofruralpopulation    
  /PRINT=TWOTAIL NOSIG FULL
  /MISSING=PAIRWISE.

USE ALL.
COMPUTE filter_$=(Time = 2010 | Time = 2011 | Time = 2012).
VARIABLE LABELS filter_$ 'Time = 2010 | Time = 2011 | Time = 2012 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /CASEWISE PLOT(ZRESID) OUTLIERS(2)
  /SAVE COOK.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COLLIN TOL
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time.

REGRESSION
  /MISSING LISTWISE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /RESIDUALS DURBIN.

USE ALL.
COMPUTE filter_$=(Time = 2010 | Time = 2011 | Time = 2012).
VARIABLE LABELS filter_$ 'Time = 2010 | Time = 2011 | Time = 2012 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

REGRESSION
  /MISSING LISTWISE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /RESIDUALS DURBIN.


UNIANOVA Accesstoelectricityruralofruralpopulation WITH 
    Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PRINT F
  /CRITERIA=ALPHA(.05)  
  /ROBUST=HC3
  /DESIGN=Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time.

UNIANOVA Accesstoelectricityruralofruralpopulation WITH 
    Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PRINT F PARAMETER
  /CRITERIA=ALPHA(.05)
  /DESIGN=Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time.

REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS DURBIN.

GRAPH
  /SCATTERPLOT(BIVAR)=GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD WITH 
    Accesstoelectricityruralofruralpopulation
  /MISSING=LISTWISE.

GRAPH
  /SCATTERPLOT(BIVAR)=Educationalattainmentatleastcompletedprimarypopulation25yearstot WITH 
    Accesstoelectricityruralofruralpopulation
  /MISSING=LISTWISE.

GRAPH
  /SCATTERPLOT(BIVAR)=Time WITH Accesstoelectricityruralofruralpopulation
  /MISSING=LISTWISE.

REGRESSION
  /MISSING LISTWISE
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS NORMPROB(ZRESID).

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Accesstoelectricityruralofruralpopulation INPUT=  
    Educationalattainmentatleastcompletedprimarypopulation25yearstot 
    GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD Time  
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
REGRESSION
  /DESCRIPTIVES MEAN STDDEV CORR SIG N
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS CI(95) R ANOVA COLLIN TOL ZPP
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Accesstoelectricityruralofruralpopulation
  /METHOD=ENTER Educationalattainmentatleastcompletedprimarypopulation25yearstot
  /METHOD=ENTER GDPpercapitaPPPcurrentinternational$NY.GDP.PCAP.PP.CD
  /METHOD=ENTER Time
  /SCATTERPLOT=(*ZRESID ,*ZPRED)
  /RESIDUALS NORMPROB(ZRESID).
