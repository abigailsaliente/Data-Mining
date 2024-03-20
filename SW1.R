
#SW NO.1

View(SW1_DATA)
str(SW1_DATA)
dim(SW1_DATA)

#No.1
#Base
GraduatesfromSUC <- SW1_DATA[SW1_DATA$"CourseCode" == "BSA" & SW1_DATA$"schooltype" == "suc" & SW1_DATA$"average" >= 98, ]
View(GraduatesfromSUC)

#Dplyr
GraduatesfromSUC_dplyr <- SW1_DATA %>% filter(CourseCode == "BSA", schooltype == "suc",
                                              average >=98)
View(GraduatesfromSUC_dplyr)


#No.2
#BASE
HighSchoolGrade <- SW1_DATA[, c("CourseCode", "eng", "mat", "sci")]
names (HighSchoolGrade) [names (HighSchoolGrade) == "CourseCode"] <- "Course Code"
names (HighSchoolGrade) [names (HighSchoolGrade) == "eng"] <- "English"
names (HighSchoolGrade) [names (HighSchoolGrade) == "mat"] <- "Mathematics"
names (HighSchoolGrade) [names (HighSchoolGrade) == "sci"] <- "Science"
HighSchoolGrade_High <- HighSchoolGrade[HighSchoolGrade$English > 97 &
                                          HighSchoolGrade$Mathematics > 97 & 
                                          HighSchoolGrade$Science > 97, ]
View(HighSchoolGrade_High)





#DPLYR
library(dplyr)
HighSchoolGrade <- SW1_DATA %>% select(CourseCode, eng, mat, sci) %>% rename("Course Code" = CourseCode,
                                                                             "English" = eng, "Mathematics" = mat,
                                                                             "Science" = sci)%>%
  filter(SW1_DATA$eng > 97 & SW1_DATA$mat >97 & SW1_DATA$sci > 97,)
View(HighSchoolGrade)


#No.3
#Base
EntranceScoreArrange <- SW1_DATA[order(SW1_DATA$Language + SW1_DATA$GenInfo + SW1_DATA$Science +  SW1_DATA$Numerical + SW1_DATA$NonVerbal, decreasing = TRUE),]
View(EntranceScoreArrange)

#Dplyr
EntranceScoreArrange_dyplr <- SW1_DATA %>% mutate(Entrance = Language + GenInfo + Science + Numerical + NonVerbal) %>% arrange(desc(Entrance))
View(EntranceScoreArrange_dyplr)



#No.4
#BASE
avg_male <- mean(EntranceScoreArrange_dyplr$Entrance[EntranceScoreArrange_dyplr$Gender == "M"])
sd_male <- sd(EntranceScoreArrange_dyplr$Entrance[EntranceScoreArrange_dyplr$Gender == "M"])
avg_female <- mean(EntranceScoreArrange_dyplr$Entrance[EntranceScoreArrange_dyplr$Gender == "F"])
sd_female <- sd(EntranceScoreArrange_dyplr$Entrance[EntranceScoreArrange_dyplr$Gender == "F"])
summary_base <- data.frame(
  Gender = c("M", "F"),
  Avg = c(avg_male, avg_female),
  SD = c(sd_male, sd_female))
View(summary_base)


#DPLYR
summary_dplyr <- EntranceScoreArrange_dyplr %>%
  group_by(Gender) %>%
  summarise(Avg = mean(Entrance), SD = sd(Entrance))

View(summary_dplyr)




