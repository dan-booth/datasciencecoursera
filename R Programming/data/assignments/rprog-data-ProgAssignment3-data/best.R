## This function takes two arguments: the 2-character abbreviated name of a state and an
## outcome name. It reads the outcome-of-care-measures.csv file and returns a character vector
## with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome
## in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
## be one of "heart attack", "heart failure", or "pneumonia". Hospitals that do not have data on a particular
## outcome should be excluded from the set of hospitals when deciding the rankings.

## == Handling ties == If there is a tie for the best hospital for a given outcome, then the hospital names should
## be sorted in alphabetical order and the first hospital in that set should be chosen (i.e. if hospitals "b", "c",
## and "f" are tied for best, then hospital "b" should be returned).

## == Prep work == ##
# Work out the column names with 30-day mortality
#require(stringr)
#x[str_detect(string = colnames(data), pattern = "^Hospital.30.Day.Death..Mortality")]

best <- function(state, outcome) {
    # First deal with invalid arguments
    # Test state is valid
    if(length(which(data$State == state)) == 0) {
        stop("invalid state")
    }
    # Test outcome is valid
    # First read in value and convert to its corresponding column name
    outcome <- switch(outcome,
                      "heart attack" = "Heart.Attack",
                      "heart failure" = "Heart.Failure",
                      "pneumonia" = "Pneumonia",
                      "invalid outcome")
    # Stop if invalid
    if (outcome == "invalid outcome") {
        stop(outcome)
    }
    
    # Read the outcome-of-care-measures.csv data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # Create the outcome column name
    outcome_col <- sprintf("Hospital.30.Day.Death..Mortality..Rates.from.%s", outcome)
    # Subset by the state and remove 'Not Available' outcome column values
    data_state <- data[which(data$State == state & data[outcome_col] != "Not Available"),]
    # Return the minimum
    sort(data_state[data_state[,outcome_col] == min(as.numeric(data_state[,outcome_col])), "Hospital.Name"]) [1]
}