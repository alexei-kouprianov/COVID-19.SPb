################################################################
# Loading primary data;
spb.lcb_primary <- read.table("../data/primary/covid.SPb.gov.spb.ru.overview.txt", h=TRUE, sep="\t")
spb.sk_primary <- read.table("../data/primary/covid.SPb.stopkoronavirus.rf.txt", h=TRUE, sep="\t")
spb.h_primary <- read.table("../data/primary/covid.SPb.gov.spb.ru.hospitalization.txt", h=TRUE, sep="\t")
spb.PCR_primary <- read.table("../data/primary/covid.SPb.PCRtests.txt", h=TRUE, sep="\t")

################################################################
# Trimming dates;
spb.lcb_primary$TIME <- strptime(spb.lcb_primary$DATE, "%Y-%m-%d")
spb.sk_primary$TIME <- strptime(spb.sk_primary$TIME, "%Y-%m-%d")
spb.h_primary$TIME <- strptime(spb.h_primary$DATE, "%Y-%m-%d")
spb.PCR_primary$TIME <- strptime(spb.PCR_primary$DATE, "%Y-%m-%d")

################################################################
# Building a combined data frame;

spb.sk_truncated <- spb.sk_primary[31:487, ]
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
	spb.h_combined$HOSPITALIZED.today
	)

colnames(spb.combined) <- c("TIME", "CONFIRMED", "RECOVERED", "DEATHS", "ACTIVE", "PCR.tested", "HOSPITALIZED.today")

################################################################
# Building a combined data frame aggregated by weeks;

weeks.TIME <- NULL
weeks.CONFIRMED <- NULL
weeks.RECOVERED <- NULL
weeks.DEATHS <- NULL
weeks.ACTIVE <- NULL
weeks.PCR.tested <- NULL
weeks.HOSPITALIZED.today <- NULL

for(i in 1:(nrow(spb.combined) %/% 7)){
	weeks.TIME <- c(weeks.TIME, as.character(spb.combined$TIME)[i*7])
	weeks.CONFIRMED <- c(weeks.CONFIRMED, sum(spb.combined$CONFIRMED[(1+(i-1)*7):(7+(i-1)*7)], na.rm=TRUE))
	weeks.RECOVERED <- c(weeks.RECOVERED, sum(spb.combined$RECOVERED[(1+(i-1)*7):(7+(i-1)*7)], na.rm=TRUE))
	weeks.DEATHS <- c(weeks.DEATHS, sum(spb.combined$DEATHS[(1+(i-1)*7):(7+(i-1)*7)], na.rm=TRUE))
	weeks.ACTIVE <- c(weeks.ACTIVE, spb.combined$ACTIVE[i*7])
	weeks.PCR.tested <- c(weeks.PCR.tested, sum(spb.combined$PCR.tested[(1+(i-1)*7):(7+(i-1)*7)], na.rm=TRUE))
	weeks.HOSPITALIZED.today <- c(weeks.HOSPITALIZED.today, sum(spb.combined$HOSPITALIZED.today[(1+(i-1)*7):(7+(i-1)*7)], na.rm=TRUE))
}

spb.combined.weeks <- cbind.data.frame(
weeks.TIME,
weeks.CONFIRMED,
weeks.RECOVERED,
weeks.DEATHS,
weeks.ACTIVE,
weeks.PCR.tested,
weeks.HOSPITALIZED.today
)

colnames(spb.combined.weeks) <- colnames(spb.combined)

spb.combined.weeks$TIME <- strptime(spb.combined.weeks$TIME, "%Y-%m-%d")

################################################################
# Saving derived data to files;

dir.create("../data/derived")

write.table(spb.combined, "../data/derived/spb.combined.daily.txt", row.names=FALSE, sep="\t")
write.table(spb.combined.weeks, "../data/derived/spb.combined.weekly.txt", row.names=FALSE, sep="\t")
