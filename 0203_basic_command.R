library(readxl)
exam <- read.csv("./teacher/Data/csv_exam.csv", fileEncoding = "euc-kr") #fileEncoding 어떠한 형식을 사용하고 있는지 알려줌
View(exam) #전체데이터 프레임 보여주기
head(exam) # 앞에서부터 6개의 데이터 프레임 보여주기, 옵션을 안 달아주면 기본 6개
tail(exam) #뒤에서부터 6개의 데이터 프레임 보여주기
head(exam, 10) # 앞에서부터 원하는 개수만큼 보여주기
tail(exam, 10) # 뒤에서부터 원하는 개수만큼 보여주기

summary(exam) #기술통계
max(exam$math) #변수표시 $, math 변수에서 최대값 찾기
min(exam$english) #english 변수에서 최소값 찾기


install.packages("ggplot2") 
mpg <- as.data.frame(ggplot2::mpg)
View(mpg)

dim(mpg) #현재 불러온 데이터가 몇 행, 몇 열로 이뤄졌는지 알 수 있음
summary(mpg)

install.packages("dplyr")
library(dplyr)

df_raw <- data.frame(var1=c(1,2,3),
                     var2=c(2,3,2))

df_raw
df_new <- df_raw #원본을 건들기 싫을때 복사하는, 대입하는 거
df_new

df_new <- rename(df_new, v2 = var2)
df_new

df_new$var_sum <- df_new$var1 + df_new$v2 # 새로운 변수를 만들려면
df_new
