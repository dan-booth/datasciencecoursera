rankhospital <- function(state, outcome, num = "best") {
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