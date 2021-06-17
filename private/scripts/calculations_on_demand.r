# Calculating cumulated sums for confirmed cases and deaths;

cumsum.control.points <- cbind.data.frame(
c(
as.character(spb.sk_primary$TIME[139]),
as.character(spb.sk_primary$TIME[191]),
as.character(spb.sk_primary$TIME[289]),
as.character(spb.sk_primary$TIME[412])
)
,
c(
sum(spb.sk_primary$i[1:139]),
sum(spb.sk_primary$i[1:191]),
sum(spb.sk_primary$i[1:289]),
sum(spb.sk_primary$i[1:412])
)
,
c(
sum(spb.sk_primary$d[1:139]),
sum(spb.sk_primary$d[1:191]),
sum(spb.sk_primary$d[1:289]),
sum(spb.sk_primary$d[1:412])
)
)

# Calculating excessive mortality;

colnames(cumsum.control.points) <- c("DATE", "CONFIRMED.cumsum", "DEATHS.cumsum")

excessive.mortality.floor <- cbind.data.frame(
c("2020-05-31", "2020-07-31", "2020-10-31", "2021-02-28"),
c(sum(spb.excessive_to_2019[4:5]),
sum(spb.excessive_to_2019[4:7]),
sum(spb.excessive_to_2019[4:10]),
sum(spb.excessive_to_2019[4:14])
),
c(sum(spb.excessive_to_mean.5[4:5]),
sum(spb.excessive_to_mean.5[4:7]),
sum(spb.excessive_to_mean.5[4:10]),
sum(spb.excessive_to_mean.5[4:14])
)
)

colnames(excessive.mortality.floor) <- c("DATE", "EXCESSIVE.1", "ECSESSIVE.5")

excessive.mortality.ceiling <- cbind.data.frame(
c("2020-06-30", "2020-08-31", "2020-11-31", "2021-03-31"),
c(sum(spb.excessive_to_2019[4:6]),
sum(spb.excessive_to_2019[4:8]),
sum(spb.excessive_to_2019[4:11]),
sum(spb.excessive_to_2019[4:15])
),
c(sum(spb.excessive_to_mean.5[4:6]),
sum(spb.excessive_to_mean.5[4:8]),
sum(spb.excessive_to_mean.5[4:11]),
sum(spb.excessive_to_mean.5[4:15])
)
)

colnames(excessive.mortality.ceiling) <- c("DATE", "EXCESSIVE.1", "ECSESSIVE.5")

# > cumsum.control.points
#         DATE CONFIRMED.cumsum DEATNS.cumsum
# 1 2020-06-18            21734           793
# 2 2020-08-09            33047          2156
# 3 2020-11-15            83743          4551
# 4 2021-03-18           385200         11844

# > excessive.mortality.floor
#         DATE EXCESSIVE.1 ECSESSIVE.5
# 1 2020-05-31        1682    1639.200
# 2 2020-07-31        5306    4966.200
# 3 2020-10-31        8245    7730.806
# 4 2021-02-28       17763   16767.610
# > excessive.mortality.ceiling
#         DATE EXCESSIVE.1 ECSESSIVE.5
# 1 2020-06-30        4245    3962.000
# 2 2020-08-31        5728    5325.204
# 3 2020-11-31       10409    9761.010
# 4 2021-03-31       19247   17852.810
# > 

# covid-related deaths, excess mortality и confirmed cases в Петербурге к 4 датам (это 7 дней после середины каждой из наших волн):
# * 2020-06-18
# * 2020-08-09
# * 2020-11-15
# * 2021-03-18

# DATE,CONFIRMED.cumsum,DEATHS.cumsum
# "2020-06-18",21734,793
# "2020-08-09",33047,2156
# "2020-11-15",83743,4551
# "2021-03-18",385200,11844
#
# DATE,EXCESSIVE.1,ECSESSIVE.5
# "2020-05-31",1682,1639.200
# "2020-07-31",5306,4966.200
# "2020-10-31",8245,7730.806
# "2021-02-28",17763,16767.610
#
# DATE,EXCESSIVE.1,ECSESSIVE.5
# "2020-06-30",4245,3962.000
# "2020-08-31",5728,5325.204
# "2020-11-31",10409,9761.010
# "2021-03-31",19247,17852.810
