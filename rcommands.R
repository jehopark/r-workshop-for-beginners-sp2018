## R for Beginners SP2017
## HMC Scientific Computing Workshop

#Look Ma, R can do Math!  ---------
1+1
2+runif(1,0,1)
2+runif(1,min=0,max=1)
3^2
3*3
sqrt(3*3) # comments
# comments are preceded by hash sign

# Even More Math! 

integrand <- function(x) {1/((x+1)*sqrt(x))} ## define the function
integrate(integrand, lower=0, upper=Inf) ## integrate the function from 0 to infinity


# Some General Stuff -----------
demo() # display available demos
demo(graphics) # try graphics demo
library() # show available packages on the computer
search() # show loaded packages
?hist # search for the usage of hist function
??histogram # search for package documents containing the word "histogram"

# Workspace of R ------------
a <- 5 # notice a in your Environment window
A <- "text" 
a
A
ls()
print(c(a,A))
print(a,A)

# Vector -----------
# A vector is an array object of the same type data elements.
class(a)
class(A)
B <- c(a,A) # concatenation
print(B)
class(B) # why?

# Matrix -----------
# A matrix is a two-dimensional rectangular object of the same type data elements
mat <- matrix(rnorm(6), nrow = 3, ncol = 2) 
mat # a matrix
dim(mat) # dimension
t(mat) 
summary(mat) 

# List -------------
# A list is an object that can store different types of vectors. 
aList <- list(name=c("Joseph"), married=T, kids=2)
aList
aList$kids <- aList$kids+1
aList$kids
aList2 <- list(numeric_data=a,character_data=A)
aList2
allList <- list(aList, aList2)
allList # a list of lists

# Data Frame ----------
# A data frame is used for storing data tables. It is a list of vectors of equal length. 
n <- c(2, 3, NA, 5) # a vector 
s <- c("aa", "bb", "cc", "dd") # a vector
b <- c(TRUE, FALSE, TRUE, NA) # a vector
df <- data.frame(n, s, b) # a data frame
df
mtcars # a built-in (attached) data frame
mtcars$mpg

# Continued
myFrame <- data.frame(y1=rnorm(100),y2=rnorm(100), y3=rnorm(100))
head(myFrame) # display first few lines of data
names(myFrame) # display column names
summary(myFrame) # output depends on the data types
plot(myFrame)
myFrame2 <- read.table(file="http://scicomp.hmc.edu/data/R/Rtest.txt", header=T, sep=",")
myFrame2

# Subsetting --------
# Three operators: [, [[, and $
# -------------------
x <- c("a", "b", "c", "c", "d", "a") # a character vector
x[1]
x[1:4]
x[x > "a"] 
u <- x > "a" # what's u here?
u
x[u] # subsetting using a boolean vector
y <- list(foo=x, bar=x[u])
y
y[[1]]
y[1]
y$bar

# Factor ------------
# Factors are a special compoud object used to represent categorical data such as gender, social class, etc.
# Factors have 'levels' attribute. They may be nominal or ordered.
v <- c("a","b","c","c","b")
x <- factor(v) # turn the character vector into a factor object
z <- factor(v, ordered = TRUE) # ordered factor
x
z
table(x)

# Function ------------
# commands that do something to an object in R
fun <- function(a,b) {
  a*b
}
fun   
fun(2,3) # a function call

# Converting between different types -----
integers <- 1:10
as.character(integers)
as.numeric(c('3.7', '4.8'))

indices <- c(1.7, 2.3)
integers[indices] # sometimes R is too generous
integers[0.999999999] # close to 1 but...

df <- as.data.frame(mat)
df

# Data Import ------
cpds <- read.csv(file.path('.', 'data', 'cpds.csv'))
head(cpds) # good to look at a few lines
class(cpds) # data.frame

## Data import from the Internet

data <- read.table(file="http://scicomp.hmc.edu/data/R/normtemp.txt", header=T)
tail(data)

rta <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE)
dim(rta)
rta[1:5, 1:5]
class(rta)
class(rta$time) # what? let's see ?read.table more carefully


rta2 <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE, stringsAsFactors = FALSE)
class(rta2$time)


# Data (and plot) Export ------
write.csv(data, file = "temp.csv", row.names = FALSE) 

save.image(file="myenv.RData")

# Subsseting ------

x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[x > "a"] 
u <- x > "a" # what's u here?
u
x[u] # subsetting using a boolean vector
y <- list(foo=x, bar=x[u]) 
y
y[[1]]
y$bar

subset(mtcars, gear == 5) # use of subset function for data frames

# Data frame vs matrix ------
m = matrix(1:400000, 2, 200000) # esp. for a large number of columns!
d = as.data.frame(m)
object.size(m) # 1600200 bytes
object.size(d) # 22400568 bytes