
# 변수의 데이터 타입

# scalar
var.scalar <- 100 
var.scalar

# vector
var.vector <- c(1,2,3)
var.vector

# matrix 
var.matrix <- matrix(1:4 , nrow = 2 , ncol = 2 ) 
var.matrix %*% var.matrix

# array
var.array <- array(1:8 , dim=c(2,2,2) ) 
var.array

# list
userInfo <- list(name     = c('김철수','이영희')  , 
                 address  = c('seoul', 'seoul') ,
                 tel      = c('010-1234-1234','010-4321-4321') , 
                 age      = c(20, 30) , 
                 marriage = c(F,T) ) 

userInfo$name
userInfo$name[1]
userInfo$name[2]

userInfo$age[1] <- 30 
userInfo$age

# 새로운 키,값을 추가한다면?
userInfo$id <- c("jslim" , "parksu")
userInfo
str(userInfo)

# key 제거
userInfo$id <- NULL
str(userInfo)

# 서로다른 자료구조(vector , matrix , array)

lst01 <- list(one = c("one" , "two" , "three") , 
              two = matrix(1:9 , nrow = 3) , 
              three = array(1:12 , dim = c(2,3,2)))

str(lst01)
lst01$one
lst01$two[2,2]
lst01$three[1,3,2]


lst02 <- list(1:5)
lst02[[1]][4]
class(lst02)

# list -> vector
# vector -> list
# 형변환 as.
?as.list

lst03 <- unlist(lst02)
lst03
class( lst03 )

# lapply , sapply 처리함수
?lapply

lst04 <- list(1:5)
lst05 <- list(6:10)
lst04
lst05

lapply(X = c(lst04 , lst05) , FUN = sum)
sapply(X = c(lst04 , lst05) , FUN = sum)


result <- sapply(1:3 , function(x) { x * 2} ) 
result
class(result)

result <- lapply(1:3 , function(x) { x * 2} ) 
class(result)
class(unlist(result))

# data.frame
# vector 를 이용한 방법
?data.frame

id     <- c(100, 200, 300)
name   <- c("섭섭해" , "임섭순" , "홍길동")
salary <- c(1000000 , 2000000 , 3000000)

exDF <- data.frame(ID = id , NAME = name , SALARY = salary)
exDF$ID


# matrix 를 이용한 방법
?matrix

matDF <- matrix(data = c(1 , "jslim" , 150 ,
                         2 , "jslim" , 150 , 
                         2 , "jslim" , 150) , 
                nrow = 3 , 
                byrow = T)
class(matDF)

matDF <- data.frame(matDF)
class(matDF)
matDF$X1

str(matDF)

sampleDF <- data.frame(x = c(1,2,3,4,5) , 
                       y = c(2,4,6,8,10) ) 

sampleDF$x
sampleDF$y
sampleDF
sampleDF[1, ]
sampleDF[1, 2]

sampleDF[ c(1, 3) , 2]
sampleDF[ -1 ,  ] 

class( sampleDF[ -1 , c("x", "y") ] )

class( sampleDF[ -1 , c("x") ] )

# vector 리턴을 data.frame 형식으로 반환받기를 원한다면?
class( sampleDF[ -1 , c("x") ] )
sampleDF[ -1 , c("x") , drop = F ] 

?data.frame

str(sampleDF)
head(sampleDF)

# rownames() , colnames() , names()

sampleDF <- data.frame(1:3 , 4:6)
sampleDF
colnames(sampleDF) <- c('feature01' , 'featuer02')
rownames(sampleDF) <- c('idx01' , 'idx02', 'idx03') 


class( names(sampleDF) )

# 문자열이 인수일 경우 생기는 문제점

tmp.students <- c('John' , 'Mary' , 'Ethan' , 'Dora')
tmp.score    <- c(76 , 82 , 84 , 67)
tmp.grade    <- c('C' , 'B' , 'B' , 'D') 

tmp.class.df <- data.frame(tmp.students , tmp.score , tmp.grade)
tmp.class.df

str(tmp.class.df)

# 행의갯수 nrow() 및 열갯수 ncol()
ncol(tmp.class.df)
nrow(tmp.class.df)
names(tmp.class.df)

# 행이름 지정
rownames(tmp.class.df) <- c('idx01' , 'idx02', 'idx03' , 'idx04')
tmp.class.df

# 열 , 행 추가
# cbind() , rbind()
tmp.id <- c("100", "200" , "300" , "400")
tmp.class.df <- cbind(tmp.class.df , tmp.id)
tmp.class.df

tmp.class.df <- rbind(tmp.class.df , c('Jslim' , 100 , 'A' , "500"))
tmp.class.df

rownames(tmp.class.df) <- c('idx01', 'idx02', 'idx03', 'idx04', 'idx05')



# factor

tmp.factor <- c('A' , 'O' , 'AB' , 'B' , 'A' , 'O' , 'A')
tmp.factor

# vector -> factor
# as.factor
blood.factor <- factor(tmp.factor)
blood.factor
class(blood.factor)

nlevels(blood.factor)
levels(blood.factor)
is.factor(blood.factor)
ordered(blood.factor)

# 빈도수 구할 때 사용하는 함수
table(blood.factor)
plot(blood.factor)


id     <- c(1,2,3,4,5,6,7,8,9,10)
gender <- c('F', 'M','F', 'M','F', 'M','F', 'M','M','F')
age    <- c(50, 40, 28, 50, 27, 19, 23, 26, 38, 40)
area   <- c('서울','경기','제주','서울','서울','서울','경기','인천','인천','경기')

# %in%
member.df <- data.frame(id, gender, age, area)
member.df

names(member.df)
member.df[ , names(member.df) %in% c('gender','age') ]

str(member.df)

member.df$gender <- as.factor(member.df$gender)
member.df$area <- as.factor(member.df$area)
member.df
str(member.df)

levels(member.df$gender)
levels(member.df$gender)[1]
levels(member.df$gender)[2]

class(iris)
str(iris)

levels(iris$Species)

mean(iris$Sepal.Length)
class(iris$Sepal.Length)

# with(dataset , 표현식 ) , within() 
# with(dataset , tapply(vector,factor , func) )
# 데이터프레임 또는 리스트내에 존재하는 필드를 손쉽게 접근하기 위한 함수

?with

iris
mean(iris$Sepal.Length)
mean(iris$Sepal.Width)

with(iris , { print(mean(Sepal.Length)) 
              print(mean(Sepal.Width)) } ) 

x <- data.frame(val=c(1,2,3,4, NA , 5, NA)) 
x

is.na(x$val)
mean(x$val , na.rm = T) 
median(x$val , na.rm = T) 



x <- within(x , 
            val <- ifelse(is.na(val) , mean(val , na.rm = T)  , val) )
x

x$val[is.na(x$val)] <- median(x$val , na.rm=T) 
x

class( lapply(iris[ , -5] , mean) )
class( sapply(iris[ , -5] , mean) )

# vector -> data.frame (as.data.frame())
x <- sapply(iris[ , -5] , mean)
x
xx <- as.data.frame(t(x))
xx
class(xx)
xx$Sepal.Length

sapply(iris , class)
str(iris)

iris
# 5.1
iris[1,1] = NA
head(iris)



# setosa종의 sepal.length의 평균을 구해서 NA가 있는 값을 대체한다면?

iris[1,1] = NA
iris[1, ]


tmp.mat <- iris
tmp.mat[1,1] <- NA
pos <- tmp.mat$'Species' == 'setosa'
tmp.mat$Sepal.Length[is.na(tmp.mat$Sepal.Length)] <- mean(tmp.mat$Sepal.Length[pos], na.rm=T)

str(iris)

?split
split(iris$Sepal.Length , iris$Species)
split(iris$Sepal.Length , iris$Species)$setosa
class( split(iris$Sepal.Length , iris$Species) )

iris.sl.median <- sapply( split(iris$Sepal.Length , iris$Species) ,
                          median , 
                          na.rm = T) 
iris.sl.median[3]
class( iris.sl.median )

iris <- within(iris , 
               {
                Sepal.Length <- ifelse(is.na(Sepal.Length),
                                       iris.sl.median[Species] , 
                                       Sepal.Length)  
               })
head(iris)

# subset()
# data.frame 으로부터 조건만족하는 행을 추출하여 그걸 data.frame으로 만든다
?subset

x <- 1:5
y <- 6:10

?letters
z <- letters[1:5]

tmp.frm <- data.frame(x,y,z)
tmp.frm

tmp.frm.subset <- subset(tmp.frm , x >= 3) 
tmp.frm.subset
class(tmp.frm.subset)

tmp.frm.subset <- subset(tmp.frm , y <= 8) 
tmp.frm.subset
class(tmp.frm.subset)

tmp.frm.subset <- subset(tmp.frm , x >= 2 & y <= 8) 
tmp.frm.subset
class(tmp.frm.subset)

tmp.frm.subset <- subset(tmp.frm , select = c(x,y)) 
tmp.frm.subset
class(tmp.frm.subset)

tmp.frm.subset <- subset(tmp.frm , y<=8 , select = c(x,y) ) 
tmp.frm.subset
class(tmp.frm.subset)

tmp.frm.subset <- subset(tmp.frm , y<=8 , select = c(x) , drop=T ) 
tmp.frm.subset
class(tmp.frm.subset)


str(airquality)

iris
dim(iris)
str(iris)

# 1,3,5 컬럼을 대상으로 subset
# 3번 컬럼은 평균이상 선택

tmp.iris.subset <- subset(iris ,
                          Petal.Length >= mean(Petal.Length) , 
                          select=c(Sepal.Length,Petal.Length,Species))
tmp.iris.subset
str(tmp.iris.subset)













































































































