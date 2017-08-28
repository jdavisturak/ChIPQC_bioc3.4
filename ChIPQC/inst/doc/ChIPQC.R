### R code from vignette source 'ChIPQC.Rnw'

###################################################
### code chunk number 1: style
###################################################
BiocStyle::latex()


###################################################
### code chunk number 2: summaryExp (eval = FALSE)
###################################################
## experiment = ChIPQC(samples)
## experiment
## ChIPQCreport(experiment)


###################################################
### code chunk number 3: summarySamp (eval = FALSE)
###################################################
## sample = ChIPQCsample("chip.bam")
## sample
## ChIPQCreport(sample)


###################################################
### code chunk number 4: ex1Samples
###################################################
library(ChIPQC)
samples = read.csv(file.path(system.file("extdata", package="ChIPQC"),
                                         "example_QCexperiment.csv"))
samples


###################################################
### code chunk number 5: ex1Construct (eval = FALSE)
###################################################
## 
## exampleExp = ChIPQC(samples,annotaiton="hg19")
## exampleExp


###################################################
### code chunk number 6: ex1Load
###################################################
data(example_QCexperiment)
exampleExp


###################################################
### code chunk number 7: ex1Report (eval = FALSE)
###################################################
## ChIPQCreport(exampleExp)


###################################################
### code chunk number 8: tamSamples
###################################################
library(ChIPQC)
samples = read.csv(file.path(system.file("extdata", package="ChIPQC"),
                                         "tamoxifenQC.csv"))
samples


###################################################
### code chunk number 9: tamConstruct (eval = FALSE)
###################################################
## data(blacklist_hg19)
## tamoxifen = ChIPQC(samples, consensus=TRUE, bCount=TRUE, summits=250,
##                    annotation="hg19", chromosomes="chr18",
##                    blacklist = blacklist.hg19)
## tamoxifen


###################################################
### code chunk number 10: tamLoad
###################################################
data(tamoxifen_QC)
tamoxifen


###################################################
### code chunk number 11: tam1Report (eval = FALSE)
###################################################
## ChIPQCreport(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 12: figCoverageHist
###################################################
plotCoverageHist(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 13: figCC
###################################################
plotCC(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 14: figRegi
###################################################
plotRegi(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 15: figPeakProfile
###################################################
plotPeakProfile(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 16: figRap
###################################################
plotRap(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 17: figFribl
###################################################
plotFribl(tamoxifen,facetBy=c("Tissue","Condition"))


###################################################
### code chunk number 18: figCorHeatmap
###################################################
plotCorHeatmap(tamoxifen,attributes=c("Tissue","Factor","Condition","Replicate"))


###################################################
### code chunk number 19: figPrincomp
###################################################
plotPrincomp(tamoxifen,attributes=c("Tissue","Condition"))


###################################################
### code chunk number 20: sampConstruct (eval = FALSE)
###################################################
## CTCF1 = ChIPQCsample("reads/SRR568129.bam", peaks="peaks/SRR568129_chr22_peaks.bed")


###################################################
### code chunk number 21: sampLoad
###################################################
CTCF1 = QCsample(exampleExp,1)


###################################################
### code chunk number 22: sampShow
###################################################
CTCF1


###################################################
### code chunk number 23: sampMetrics
###################################################
QCmetrics(CTCF1)


###################################################
### code chunk number 24: figSampCC
###################################################
plotCC(CTCF1)


###################################################
### code chunk number 25: sampList
###################################################
sampleList = QCsample(tamoxifen)
class(sampleList)
length(sampleList)
names(sampleList)
class(sampleList[[1]])


###################################################
### code chunk number 26: sampSheet
###################################################
sampleSheet = read.csv(file.path(system.file("extdata", package="ChIPQC"),
                                         "tamoxifenQC.csv"))
sampleSheet


###################################################
### code chunk number 27: sampExp (eval = FALSE)
###################################################
## tamoxifen = ChIPQC(sampleSheet, samples=sampleList)
## tamoxifen


###################################################
### code chunk number 28: sampExp2 (eval = FALSE)
###################################################
## BT474s = ChIPQC(sampleSheet[1:2,], samples=sampleList)


###################################################
### code chunk number 29: figCCBySample
###################################################
plotCC(exampleExp,facetBy="Sample")


###################################################
### code chunk number 30: figCCColourByFlineByTissue
###################################################
plotCC(exampleExp,facetBy="Sample",colourBy="Factor",lineBy="Tissue")


###################################################
### code chunk number 31: extraMetadata
###################################################

extraMetadata <- data.frame(Sample = rownames(QCmetrics(exampleExp)),
FRiBL = QCmetrics(exampleExp)[,("RiBL%")],
SSD =QCmetrics(exampleExp)[,("SSD")]
)


###################################################
### code chunk number 32: figCCaddMetadata
###################################################
plotCC(exampleExp,facetBy="Sample",lineBy="Tissue",addMetaData=extraMetadata,colourBy="SSD")



###################################################
### code chunk number 33: extraMetadataGGextra (eval = FALSE)
###################################################
## 
## plotCC(exampleExp,facetBy="Sample",lineBy="Tissue",addMetaData=extraMetadata,colourBy="SSD")
## + scale_color_gradient2(high="red",mid="black",low="white",midpoint=1.5)


###################################################
### code chunk number 34: sessionInfo
###################################################
toLatex(sessionInfo())


