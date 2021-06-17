# Loading primary data;
spb.lcb_primary <- read.table("../data/primary/covid.SPb.gov.spb.ru.overview.txt", h=TRUE, sep="\t")
spb.sk_primary <- read.table("../data/primary/covid.SPb.stopkoronavirus.rf.txt", h=TRUE, sep="\t")
spb.h_primary <- read.table("../data/primary/covid.SPb.gov.spb.ru.hospitalization.txt", h=TRUE, sep="\t")
spb.PCR_primary <- read.table("../data/primary/covid.SPb.PCRtests.txt", h=TRUE, sep="\t")

# Trimming dates;
spb.lcb_primary$TIME <- strptime(spb.lcb_primary$DATE, "%Y-%m-%d")
spb.sk_primary$TIME <- strptime(spb.sk_primary$TIME, "%Y-%m-%d")
spb.h_primary$TIME <- strptime(spb.h_primary$DATE, "%Y-%m-%d")
spb.PCR_primary$TIME <- strptime(spb.PCR_primary$DATE, "%Y-%m-%d")

# Building a combined data frame;
spb.sk_truncated <- spb.sk_primary[33:487, ]
spb.h_combined <- cbind.data.frame(
	c(spb.h_primary$HOSPITALIZED.today, 
	spb.lcb_primary$h[173:176]),
	c(spb.h_primary$TIME, 
	spb.lcb_primary$TIME[173:176])
	)
colnames(spb.h_combined) <- c("HOSPITALIZED.today", "TIME")
spb.PCR_truncated <- spb.PCR_primary[1:423, 2:3]

spb.combined <- cbind.data.frame(
	spb.sk_truncated,
	c(rep(NA, (nrow(spb.sk_truncated)-nrow(spb.PCR_truncated))), spb.PCR_truncated$TESTS),
	spb.h_combined$HOSPITALIZED.today[3:nrow(spb.h_combined)])
	)

colnames(spb.combined) <- c(colnames(spb.sk_truncated), "PCR.tested", "HOSPITALIZED.today")
