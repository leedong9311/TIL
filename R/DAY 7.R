#외부파일(csv , xsl , txt) & 데이터 가공 & 시각화

install.packages('readxl')
library(readxl)

# read_excel() - xl
# read.table() - txt
#header , skip , nrows , sep
# , 나 tap으로 이루어 진거 찾기

tmp.x1 <- read_excel(file.choose())
class(tmp.xl)
view(tmp.xl)
tmp.xl.df <- as.data.frame(tmp.xl)
class(tmp.xl.df)

tmp.txt <- read.table(file.choose() , header = T)
class(tmp.txt)

tmp.txt <- read.table(file.choose() , 
                      header = T ,
                      skip = 2 ,
                      nrows = 7 ,
                      sep = "|t" )
class(tmp.txt)
tmp.txt
str(tmp.txt)

# 데이터 로드 및 열 이름 부여
tmp.txt <- read.table(file.choose() ,
                      sep = "," )

colnames(tmp.txt) <- c('번호', '성별' , '나이' , '지역')

cname <-  c('번호', '성별' , '나이' , '지역')
tmp.txt <- read.table(file.choose() ,
                      header = F ,
                      sep = "," ,
                      col.names = cname)


write(tmp.txt , file = "C:\Users\campusseven\Documents\R\R_SUTDEY\save_data.csv")

ex.data <- read_excel(file.choose())
ex.data.frm <- as.data.frame(ex.data)
str(ex.data.frm)

# sex , area _> factor 변경

ex.data.frm$SEX <- as.factor(ex.data.frm$SEX)
ex.data.frm$AREA <- as.factor(ex.data.frm$AREA)
levels(ex.data.frm$SEX)
levels(ex.data.frm$AREA)

# [chain , group_by , summarise] , split
library(dplyr)

# 성별에 따른 AMT17 평균이용 금액
?split
class(split(ex.data.frm$AMT17 , ex.data.frm$SEX))
sapply( split(ex.data.frm$AMT17 , ex.data.frm$SEX) ,
        mean , 
        na.rm =T )
class(sapply( split(ex.data.frm$AMT17 , ex.data.frm$SEX) ,
              mean , 
              na.rm =T ))

ex.data.frm %>%
  group_by(SEX) %>% 
    summarise(cnt = n() ,
              mean = mean(AMT17))

# 지역에 따른 Y17_CNT 이용건수의 합

class(split(ex.data.frm$Y17_CNT , ex.data.frm$AREA))
sapply( split(ex.data.frm$Y17_CNT , ex.data.frm$AREA) ,
        mean , 
        na.rm =T )
class( sapply( split(ex.data.frm$Y17_CNT , ex.data.frm$AREA) ,
             mean , 
             na.rm =T ) )

ex.data.frm %>%
  group_by(AREA) %>% 
  summarise(cnt = n() ,
            mean = mean(Y17_CNT))
  
dim (ex.data.frm)
  
# rename()
# AMT17 -> Y17_AMT , AMT16 -> Y16_AMT
?rename
rename(ex.data.frm , Y17_AMT = AMT17 , Y16_AMT = AMT16)


# 파생변수 추가
# AMT 합, CNT 합

ex.data.frm$CNT.SUM <- ex.data.frm$Y16_CNT + ex.data.frm$Y17_CNT
ex.data.frm$AMT.SUM <- ex.data.frm$AMT17 + ex.data.frm$AMT16

mutate(ex.data.frm , 
       amt.sum = Y17_AMT + Y16_AMT ,
       amt.sum = Y17_CNT + Y16_CNT ,
       amt.avg = amt.sum / cnt.sum )

#AGE50_YN 추가 , 나이가 50이상이면 Y , 미만 N
# ifelse ~
ex.data.frm <-ex.data.frm %>%
  mutate(AGE50_YN = ifelse(AGE >= 50 , 'Y' , 'N'))

ex.data.frm

class(ex.data.frm$ID)
class(ex.data.frm %>% select(ID))

ex.data.frm %>%
  select(ID , AREA , Y17_CNT) %>%
   filter(AREA == '서울' & Y17_CNT>= 10) %>%
     arrange(desc(Y17_CNT))

# 데이터 결합

# 두 개의 파일을 로드
# 가로결합 , join
# inner join , left join , right join , full join 
# inner.df <- join(tmp.x.df , tmp.y.df , by='id' , type='xxxxxx')
# left_join() , inner_join() , full_join()

f.data <- read_excel(choose.files())
m.data <- read_excel(choose.files())
f.data <- as.data.frame(f.data)
m.data <- as.data.frame(m.data)
library(plyr)

new.df <- join(f.data , m.data , by='ID' , type='full')
new.df

left_join (f.data , m.data , by='ID')
new.df <- as.data.frame(new.df)
str(new.df)

# 1. new.df 데이터 세트에서 ID 변수만 추출
new.df %>%
  select(ID)

# 2. new.df 데이터 세트에서 ID, AREA, Y17_CNT 변수 추출
new.df %>%
  select(ID,AREA,Y17_CNT)


# 3. new.df 데이터 세트에서 AREA 변수만 제외하고 추출
new.df %>%
  select(-AREA)


# 4. new.df 데이터 세트에서 AREA, Y17_CNT 변수를 제외하고 추출
new.df %>%
  select(-AREA , -Y17_CNT)

# 5. new.df 데이터 세트에 AREA(지역)가 서울인 경우만 추출

new.df %>%
  filter(AREA == '서울')

# 6. new.df 데이터 세트에서 AREA(지역)가 서울이면서 
#    Y17_CNT(17년 이용 건수)가 10건 이상인 경우만 추출 

new.df %>%
  filter(AREA == '서울' & Y17_CNT >= 10)


# 7. new.df 데이터 세트의 AGE 변수를 오름차순 정렬

new.df %>%
  arrange(AGE)

# 8. new.df 데이터 세트의 Y17_AMT 변수를 내림차순 정렬

new.df %>%
  arrange(desc(AMT17))

# 정렬 중첩 
# 9. new.df 데이터 세트의 AGE 변수는 오름차순, Y17_AMT 변수는 내림차순 정렬
new.df %>%
  arrange(desc(AMT17),AGE)


# 데이터 요약하기
# 10. new.df 데이터 세트의 Y17_AMT(17년 이용 금액) 변수 값 합계를
# TOT_Y17_AMT 변수로 도출

TOT_Y17_AMT <- sum(new.df$AMT17)

# 11. new.df 데이터 세트의 AREA(지역) 변수 값별로 
# Y17_AMT(17년 이용 금액)를 더해 SUM_Y17_AMT 변수로 도출
SUM_Y17_AMT <- new.df %>%
  group_by(AREA) %>%
   dplyr::summarise(SUM_Y17_AMT = sum(AMT17))


# 12. new.df 데이터 세트의 AMT를 CNT로 나눈 값을 
# new.df 데이터 세트의 AVG_AMT로 생성
new.df$AVG_AMT <- (new.df$AMT17 + new.df$AMT16) / (new.df$Y17_CNT + new.df$Y16_CNT)


# 13. new.df 데이터 세트에서 AGE 변수 값이 50 이상이면 “Y”
# 50 미만이면 “N” 값으로 new.df 데이터 세트에 AGE50_YN 변수 생성 
new.df$AGE50_YN <- ifelse(new.df$AGE >= 50 , 'Y' , 'N')


# ::나이분류
# 14. new.df 데이터 세트의 
# AGE 값이 50 이상이면 “50++”, 
# 40 이상이면 “4049”
# 30 이상이면 “3039”, 
# 20 이상이면 "2029”, 
# 나머지는 “0019”를 값으로 하는 AGE_GR10 변수 생성

new.df$AGE_GR10 <-ifelse(new.df$AGE >=50 , '50++' ,
                         ifelse(new.df$AGE >=40 , '4049' ,
                                ifelse(new.df$AGE >=30 , '3039' ,
                                       ifelse(new.df$AGE >= 20 , '2029' , '0019'))))


# descr::freq()
# 빈도분석 : 특정값이 얼마나 반복되는지

install.packages('descr')
library(descr)
?freq
freq(new.df$AREA , plot = T)
freq(new.df$SEX , plot = T)
freqGender <- freq(new.df$SEX , plot = T)
barplot(freqGender)

# 시각화
# 변수 구분 (이산 VS 연속)
# 막대 , 점 , 파이

chart.data <- c(380 , 520 , 330 , 390, 320, 460, 300, 405)
names(chart.data) <- c( "2020 1Q" , "2020 2Q", "2020 3Q", "2020 4Q" ,"2021 1Q" , "2021 2Q", "2021 3Q", "2021 4Q")

chart.data
range(chart.data)
max(chart.data)
min(chart.data)
length(chart.data)

?barplot

# 막대차트(세로 , 가로)
barplot(chart.data ,
        xlim = c(0,600) ,
        col = rainbow(8) ,
        main = '2020 vs 2021' ,
        horiz = T ,
        ylab = '년도별 현황' ,
        xlab = '매출 현황')

?dotchart

dotchart(chart.data , 
         color = c('green' , 'red') ,
         lcolor = 'blue' ,
         pch = 1:4 ,
         xlab = '매출액' ,
         ylab = '분기별 현황' ,
         cex = 0.8 ,
         main = '2020 vs 2021' )

?pie

pie(chart.data ,
    labels = names(chart.data) ,
    border = 'blue' ,
    col = rainbow(8) ,
    cex = 1.5)

iris
pie(table(iris$Species))

?table
new.df

barplot(table(new.df$SEX) ,
        names = c('남자' , '여자') ,
        main = '성별' ,
        xlab = 'gender' ,
        ylab = 'cnt' ,
        horiz = T)

# 연속형 : 변수가 연속된 구간을 가지고 있다는 뜻
# 간격변수 , 비율변수
# 상자 , 히스토그램 , 산점도
# boxplot() , hist() , plot()

?boxplot
boxplot(new.df$Y17_CNT , new.df$Y16_CNT)

iris
hist(iris$Sepal.Length , 
     xlab = '꽃받침 길이' ,
     ylin = c(0,40))

#산점도
?plot
x <- runif(5, min = 0 , max =1)
y <- x^2
x

plot(x , y , type = 'l')
plot(x , y , type = 'o' , pch = 25)
plot(x , y , type = 'h')
plot(x , y , type = 's')

# ?pairs - 산점도 매트릭스
pairs(iris[1:4])

# 3차원 산점도
install.packages('scatterplot3d')
library(scatterplot3d)

scatterplot3d(iris$Sepal.Length ,
              iris$Petal.Length ,
              iris$Sepal.Width , 
              type = 'p' ,
              color = c('red'))

# 시각화 알아보기 
install.packages('mlbench')
library(mlbench)

data(Ozone)
str(Ozone)
?Ozone

# 수치형 데이터 산점도
plot(Ozone$V8 , Ozone$V9)

# 축 이름 
range(Ozone$V8 , na.rm = T)
range(Ozone$V9 , na.rm = T)

plot(Ozone$V8 , Ozone$V9 ,
     xlab = 'Sandburg Temp' ,
     ylab = 'EI monte Temp' ,
     main = 'Region Temp' ,
     pch = '+' ,
     cex = 0.8 ,
     col = 'red' ,
     xlim = c(20,100) ,
     ylim = c(25, 85))

iris
summary(iris$Sepal.Length)
boxplot(iris$Sepal.Length)

#IQR(3사분위수 - 1사분위수)
summary(iris$Sepal.Width)
boxplot(iris$Sepal.Width)

# 3 -> 3.3
# 1 -> 2.8
# m -> 3
# whisker
# low  whisker : 중앙값 - 1.5 * IQR : 3 - 0.5 * 0.5 = 2.25
# high whisker : 중앙값 + 1.5 * IQR : 3 + 1.5 * 0.5 = 3.75

boxplot(iris$Sepal.Width ,
        horizontal = T)

#iris의 setosa종과 versicolor 종의 sepla.width 대한 상자 그림을 그려본다면?
# subset()

iris.subset <- subset(iris , Species == 'setosa' | Species == 'versicolor')
boxplot(Sepal.Width ~ Species , data = iris.subset)

install.packages("ggplot2")
lilbrary(ggplot2)
mpg
mpg.df<- as.data.frame(mpg)

# 주요컬럼
# manufacturer : 제조회사
# displ : 배기량
# cyl : 실린더 개수
# drv : 구동 방식
# hwy : 고속도로 연비
# class : 자동차 종류
# model : 자동차 모델명
# year : 생산연도
# trans : 변속기 종류
# cty : 도시 연비
# fl : 연료 종류

# 1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려 한다. 
# displ(배기량)이 4 이하인 자동차와 4 초과인 자동차 중 
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 확인하세요. displ<=4
mpg %>%
  filter(displ >4) %>%
  dplyr::summarise(mean(hwy))
mpg %>%
  filter(displ <=4) %>%
  dplyr::summarise(mean(hwy))

mpg %>%
  group_by(displ >4) %>%
  dplyr::summarise(mean(hwy))

mpg.df %>%
  mutate(displ.4.over = ifelse(displ > 4 , 'over' , 'under')) %>%
   group_by(displ.4.over) %>%
  dplyr::summarise(mean.hwy =mean(hwy))
  

# 2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. 
# "audi"와 "toyota" 중 어느 manufacturer(제조회사)의 cty(도시 연비)가 
# 평균적으로 더 높은지 확인하세요.  toyota
mpg %>%
  filter(manufacturer == 'audi') %>%
  dplyr::summarise(mean(cty))
mpg %>%
  filter(manufacturer == 'toyota') %>%
  dplyr::summarise(mean(cty))

mpg %>%
  filter(manufacturer == 'toyota' | manufacturer == 'audi')  %>%
  group_by(manufacturer) %>%
  dplyr::summarise(mean(cty))

# 3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 
# 이 회사들의 데이터를 추출한 후 hwy(고속도로 연비) 전체 평균을 구하세요.
?select

mpg %>%
  group_by(manufacturer) %>%
  dplyr::summarise(mean(hwy)) %>%
  filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'honda')

# 4. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 
# 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 
# 자동차의 데이터를 출력하세요.
head(mpg %>%
 filter(manufacturer == 'audi') %>%
  arrange(desc(hwy)),5)


# 5. mpg 데이터는 연비를 나타내는 변수가 2개입니다. 
# 두 변수를 각각 활용하는 대신 하나의 통합 연비 변수를 만들어 사용하려 합니다. 
# 평균 연비 변수는 두 연비(고속도로와 도시)의 평균을 이용합니다. 
# 회사별로 "suv" 자동차의 평균 연비를 구한후 내림차순으로 정렬한 후 1~5위까지 데이터를 출력하세요.
mpg.new <- mpg
  mpg.new$avg = mpg$hwy + mpg$cty

 head(mpg.new %>%
  filter(class == 'suv') %>%
    group_by(manufacturer) %>%
  dplyr::summarise(mean = mean(avg)) %>%
   arrange(desc(mean)) ,5)
 


# 6. mpg 데이터의 class는 "suv", "compact" 등 자동차의 특징에 따라 
# 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교하려 합니다. 
# class별 cty 평균을 구하고 cty 평균이 높은 순으로 정렬해 출력하세요.

mpg %>%
  group_by(class) %>%
  dplyr::summarise(mean = (mean(cty))) %>%
   arrange(desc(mean))


# 7. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려 합니다. 
# hwy(고속도로 연비) 평균이 가장 높은 회사 세 곳을 출력하세요.
head(mpg %>%
 group_by(manufacturer) %>%
  dplyr::summarise(mean = (mean(hwy))) %>%
   arrange(desc(mean)) ,3)

# 8. 어떤 회사에서 "compact" 차종을 가장 많이 생산하는지 알아보려고 합니다. 
# 각 회사별 "compact" 차종 수를 내림차순으로 정렬해 출력하세요.

mpg %>%
  filter(class == 'compact') %>%
  group_by(manufacturer) %>%
  dplyr::summarise(count = n()) %>%
  arrange(desc(count))