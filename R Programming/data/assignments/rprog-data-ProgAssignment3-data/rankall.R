rankall <- function(outcome, num = "best") {
    # First deal with invalid arguments
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
}