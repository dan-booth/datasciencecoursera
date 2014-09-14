## == Week 2 Quiz == #

# Q1
cube <- function(x, n) {
    x^3
}
cube(3)

# Q2
x <- 1:10
if(x > 5) {
    x <- 0
}
# This will have a warning since 'x' is a vector
# of length 10 and 'if' can only test a single
# logical statement (would need an ifelse).

# Q3
f  <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}
z <- 10 # This gets overrided in f(x) to 4
f(3)
# This would return 3 + (3 + 4) = 10

# Q4
x <- 5
y <- if(x < 3) {
    NA
} else {
    10
}

# Q5
h <- function(x, y = NULL, d = 3L) {
    z <- cbind(x, d)
    if(!is.null(y)) {
        z <- z + y
    } else {
        z <- z + f
    }
    g <- x + y / z
    if (d == 3L) {
        return(g)
    }
    g <- g + 10
    g
}
# A free variable is a variable not defined
# in the function nor an argument of the function.
# So here it is 'f'