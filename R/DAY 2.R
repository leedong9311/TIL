txtVec <- c("BigData" , "Bigdata" , "bigdata" , "Data" , "dataMining" , "class1" , "class2") 
txtVec

# nchar() : character 개수 반환
nchar(txtVec)

# package 설치
# remove.package("stringr")

install.packages("stringr")
library(stringr)


str_length(txtVec)

?substr
?strsplit

greetingMsg <- "hi, bigdata is very important" 
class(greetingMsg)

substr(greetingMsg , 5, 11) 
class(strsplit(greetingMsg , ","))

?str_extract

str_extract("abc123def456" , "[0-9]{3}")
str_extract_all("abc123def456" , "[0-9]{3}")

str_extract("abc123def456" , "[a-zA-Z]{3}")
str_extract_all("abc123def456" , "[a-zA-Z]{3}")

gsub("[0-9]+" , "" , "abc123def456")

stringDumy <- "임정섭jslim49섭서해seop34강봉진조수연강려명30"
stringDumy

# 영어단어만 추출
str_extract_all(stringDumy , '[a-z]{3,5}')

# 문제01) 연속된 한글 3자 이상을 추출한다면?
str_extract_all(stringDumy , '[가-힣]{3}')
class(str_extract_all(stringDumy , '[가-힣]{3}'))

str_extract_all(stringDumy , '[가-힣]{3,}')


# 문제02) 나이추출
str_extract_all(stringDumy , '[0-9]{2}')

# 문제03) 숫자를 제외하고 추출
gsub("[0-9]", "", stringDumy)
str_extract_all(stringDumy , '[^0-9]')
str_extract_all(stringDumy , '[^0-9]+')
str_extract_all(stringDumy , '[^0-9]{3,}')


# 문제04) 영문자를 제외한 한글이름만
str_extract_all(stringDumy , '[^a-z]+')
str_extract_all(stringDumy , '[^a-z]{3,}')

# 메타문자
# 단어 \\w
# 숫자 \\d
# 특수문자 \\특수문자
# 엔터키 \n, 탭키 \t
# []1회 , {n} n반복

ssn <- "730910-1234567"
str_extract_all(ssn , '[0-9]{6}-[1-4][0-9]{6}')
str_extract_all(ssn , '\\d{6}-[1-4]\\d{6}')

email <- "jslim9413@naver.com"
str_extract_all(email , '\\w{4,}@\\w{3,}.[a-z]{2,}')


strMsg <- "우리는 달려간다~이상한 나라로~섭섭이가 잡혀있는 마왕의 소굴로~"
length(strMsg)
str_length(strMsg)

# 문자열의 위치
str_locate_all(strMsg , '섭섭')
class(str_locate_all(strMsg , '섭섭'))

# 섭섭 -> 섭순
?str_replace_all
str_replace_all(strMsg , '섭섭' , '섭순')

# 부분 문자열
?str_sub

str_sub(strMsg , start = 5 , end = 8)

# 특수문자제외($ , ,)
num <- "$123,466"

gsub('[[:punct:]]', '', num)
str_replace_all(num , "\\$|\\," , "")
class(str_replace_all(num , "\\$|\\," , ""))

# 변환함수 as.
tmp <- str_replace_all(num , "\\$|\\," , "")
class(tmp)

tmp * 2


digt <- as.numeric(tmp)
digt * 2
class( as.numeric(digt) )



# 행렬(matrix)
# mtrix() , rbind () , cbind()
# apply()

# 생성
var01 <- matrix(c(1:5))
class(var01)
nrow(var01)

var02 <- matrix(c(1:10) , nrow=2 , byrow=T)
var02


var03 <- matrix(c(1:9) , nrow=3 , ncol = 3 )
var03

x <- c(1,2,3,4,5,6)
class(x)
var04 <- matrix(x , 2 , 3)
var04
t(var04)  #행과 열 교환


#row() , col()
row(var04)
col(var04)

# 데이터 접근 [행 인덱스 , 열 인덱스]
class(var04[2,3])

var04[2,3]

var05 <- matrix(c(1:9) ,3 , 3 )
x <- c(1,2)
var05[x,2]
class(var03[x,2])

var05[2,x]

# 1행을 제외하고 1,3열의 정보만 추출
var05[-1 , c(T , F , T)]
var05[c(2,3),c(1,3)]

#1,3 열을 제외한 행렬을 만든다면?
var05[ , -c(1,3)]
class(var05[ , -c(1,3)])


var05[ , 2 ,drop=f]
class(var05[ , 2 ,drop=f])


x <- rbind(c(1,2,3) , c(4,5,6))
x

x <- cbind(c(1,2,3) , c(4,5,6))
x

x <- matrix(c(1,2,3,4,5,6,7,8,9) , 
            nrow = 3 , 
            dimnames = list (c("row1" , "row2" , "row3") ,
                             c("col1" , "col2" , "col3")))
x

# 행의 이름과 열의 이름을 이용하여 조회가 가능하다

x["row1" , ]

x*2
x+2
x/2

mat01 = matrix(c(1,2,3,4,5,6,7,8,9) , nrow =3 )
mat02 = matrix(c(1,2,3,4,5,6,7,8,9) , ncol =3 )

# 행열의 연산에서는 앞 행열의 열의 수와 뒤 행열의 행의 숫자가 같아야한다.
mat01 * mat02
mat01 %*% mat02

?apply
# apply (data , 방향 , 함수)
# 방향 1 ->행 , 2 ->열
# 함수 sum , mean
# vector 또는 matrix 데이터로 받아서 임의의 함수를 적용한 결과 얻는 것

mat01

apply(mat01 , 1 , sum)
apply(mat01 , 2 , sum)
class(apply(mat01 , 1 , sum))
class(apply(mat01 , 2 , sum))

iris
class(iris)

# 각 열 (species 제외한)에 대한 합, 평균(mean), 중위수(median) , 최대 , 최소
apply(iris[ , -5] , 2 , sum)
apply(iris[ , -5] , 2 , mean)
apply(iris[ , -5] , 2 , median)
apply(iris[ , -5] , 2 , max)
apply(iris[ , -5] , 2 , min)


# rowSums() ,colSums() , rowMeans() , colMeans()

rowSums(iris[ , -5])
colSums(iris[ , -5])
rowMeans(iris[ , -5])
colMeans(iris[ , -5])

#order() 정렬
?order
iris [order(iris[ ,1],decreasing = T) , ]
class(iris [order(iris[ ,1],decreasing = T) , ])

?data.frame
exDF <- data.frame(x = c(1,2,3,4,5) ,
                   y = c( "a" , "b" , "c" , "d" , "e"))
exDF

# 특정행 가져오기
exDF[c(T, F , T , F , T), ]

# x값이 짝수인 행만 선택한다면?
exDF[exDF[ ,1]%% 2 == 0 , ]
exDF[ exDF$x %%2 == 0 , ]

# 배열
# array() , dim(c())

( m <- matrix(1:12 , ncol=4))
class(m)

?array
ary <- array(1:12 , dim =c(3,4))
ary
class(ary)

ary <- array(1:12 , dim = c(2,2,3))
ary
class(ary)

# ary[행 , 열 , 차원의 요소]
ary[1,1,1]
ary[1,1, ]
ary[2,1,3]

apply(ary , c(1,2) , mean)

iris3

dim(iris3)
mode(iris3)
class(iris3)

iris3[ , , 1]

#list (key =value)
#list()
#lapply() : list , key=value
#sapply() : list , value

tmpList <- list(name="jslim" , height=178)
tmpList
tmpList$name
tmpList$height
mode(tmpList)
class(tmpList)

tmpList<- list(name="jslim" , height=c(1,2,3,4))
tmpList
class(tmpList$name)
class(tmpList$height)

?list
# list타입의 경우 구조를 확인 할 경우
str(tmpList)

tmpList <- list(1:4 , rep(3:5) , "dog")
str(tmpList)

tmpList[[1]]
tmpList[[2]]
tmpList[[3]]

newList <- c(list(1 , 2 , tmpList) , c(3,4))
str(newList)
class(newList)
str(newList)


overList <- list(a = list(e=c(1,2,3)) ,
                 b = list(f=c(1,2,3,4)))
overList
overList$a$e
overList$b$f




overList <- list(a = list(c(1,2,3)) ,
                 b = list(c(1,2,3,4)))
overList
overList$a[[1]][2]
overList$b[[1]]

userInfo <- list(name     = c('dslee', 'jslim') , 
                 address  = c('신논현','삼성동') , 
                 tel      = c('010-1111-1234' , '011-1234-1234') ,
                 age      = c( 27 , 20) ,
                 marriage = c( T ,F ))

userInfo
str(userInfo)

class(userInfo[1])
class(userInfo$name)










