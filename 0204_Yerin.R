 함수 
head()  데이터 앞부분 출력
tail()  데이터 뒷부분 출력
View()  뷰어 창에서 데이터 확인
dim()   데이터 차원 출력
str()   데이터 속성 출력, 문자인지 숫자인지
summary() 요약통계량 출력

 #ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기
library(dplyr) #library를 먼저 불러오기
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg) #:: ggplot2 안에 있는 mpg라는 데이터를 불러오라
head(mpg) # Raw 데이터 앞부분 출력
tail(mpg) # Raw 데이터 뒷부분 출력
head(mpg, 4)

View(mpg)
dim(mpg)
str(mpg) #chr 문자, int 정수, 소수점은 실수
summary(mpg) #mean 평균

df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw

df_new <- df_raw  #복사본 생성
df_new   #복사본 출력

df_new <- rename(df_new, v2=var2)
df_new

mpg <- as.data.frame(ggplot2::mpg)
copy <- mpg
copy <- rename(copy, city=cty) #고칠 이름을 앞으로
copy <- rename(copy, highway = hwy)
copy
head(copy)

#데이터 프레임 생성
df <- data.frame(var1 = c(4,3,8), 
                 var2 =c(2,6,1))
df
df$sum <- c(df$var1 + df$var2)
df

df$sum <- df$var1 + df$var2 # var_sum 파생변수 생성, A$B- A안에 B

df$mean <- (df$var1 + df$var2)/2 #평균구하기
df

df$mean2 <- df$sum/2 #평균구하기 다른 방법
df

# mpg 통합 연비 변수 만들기
mpg <- as.data.frame(ggplot2::mpg)
mpg$total <-(mpg$cty + mpg$hwy)/2 # 통합 연비 변수생성
head(mpg)
mean(mpg$total)

#기준값 정하기
summary(mpg$total) #요약 통계량 산출
hist(mpg$total) #히스토그램 생성

# 조건문
ifelse(mpg$total >= 20, "pass", "fail")
mpg$test <-ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

table(mpg$test) #연비 합격 빈도표 생성
libary(ggplot2) # ggplot2 불러오기
qplot(mpg$test) #연비 합격 빈도 막대 그래프 생성

# 중첩조건문 활용하기-연비 등급 변수 만들기, 그룹끼리 비교
#A,B,C,D 등급 부여
mpg$grade2 <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 25, "B", ifelse(mpg$total >= 20, "C", "D"))) #조건문에 거짓인 부분을 if문을 사용해서 계속 나눔, A가 아닌 것들은 B인데 여기서 조건문을 달아줘서 B,C,D로 나뉘게 됨 
mpg$grade2
#엑셀은 library(excel), read(excel)

libarary("ggplot2")
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)
midwest <-rename(midwest, total = poptotal)
midwest <-rename(midwest, asian= popasian)
midwest$per <- c(midwest$asian/midwest$total)*100
midwest
hist(midwest$per)
summary(midwest)
summary(midwest$per)
mean(midwest$per)
midwest$group <- ifelse(midwest$per > 0.4872462, "large", "small")
midwest$group <- ifelse(midwest$per > mean(midwest$per), "large", "small")

var7 <- mean(midwest$per)
midwest$group <- ifelse(midwest$per > var7, "large", "small")
table(midwest$group)
#library(ggplot2)
qplot(midwest$group)


library(dplyr)
exam <- read.csv("./teacher/Data/csv_exam.csv", fileEncoding = "euc-kr")
exam
exam %>% filter(class == 1) #파이프연산자, 함수들을 서로 조합시킴, 여러가지 함수를 하나로 사용할 수 있게 
exam %>% filter(class !=1) # 2반이 아닌 반들을 출력하고 싶을때

exam %>% filter(math > 50)
exam %>% filter(class ==1 & math>50) # 1반이면서 수학점수가 50점 이상인 학생
exam %>% filter(math >= 90 | english >=90)
exam %>% filter(class ==1 | class==3| class==5)

#%in% 기호 사용하기
exam %>% filter(class %in% c(1,3,5)) #존재하면 불러옴, 매치 연산자
class1 <- exam %>% filter(class ==1) #class가 1인 행 추출, class1에 해당
class2 <- exam %>% filter(class==2) #class가 2인 행 추출, class2에 해당
mean(class1$math) # 1반의 수학 평균
mean(class2$math) # 2반의 수학 평균

mpg <- as.data.frame(ggplot2::mpg)
mpg %>% filter(displ > 5)
mpg %>% filter(displ < 4)

mpg_a <- mpg %>% filter(displ >= 5)
mpg_a
mpg_b <- mpg %>% filter(displ <= 4)
mpg_b
mean(mpg_a$hwy)
mean(mpg_b$hwy)
mpg_audi <- mpg %>%  filter(manufacturer == "audi")
mpg_toyota <- mpg %>%  filter(manufacturer == "toyota")
mean(mpg_audi$cty)
mean(mpg_toyota$cty)

mpg_new <- mpg %>%  filter(manufacturer %in% c("chevrolet",))

#필요한 변수만 추출
exam %>%  select(math)
exam %>% select(class, math, english)
#변수 제거하기
exam %>% select(-math, -english) #-붙은 해당 변수를 제외시킴

exam %>% filter(class ==1) %>% select(english) #1반에서 영어점수 가져오기

#줄바꿈을 하려면
exam %>%
  filter(class ==1) %>%
  select(english)  #연산자 바로 뒤에서 엔터 
         
#일부만 출력하기
exam %>% 
  select(id, math) %>% 
  head(10) # %>%가 있기 때문에 head뒤에 데이터 프레임을 안 적어도 됨