# Rank hospital function
# From Programming assignment 3 in the R programming course fram Data Scienze specialization on Coursera

# 3 Ranking hospitals by outcome in a state

rankhospital <- function(state, outcome, num) {
        outcome_data <- read.csv("outcome-of-care-measures.csv")
        if (state %in% outcome_data[ , "State"]==FALSE) {
                stop("invalid state")
        }
        if (outcome %in% c("heart attack", "heart failure", "pneumonia")==FALSE) {
                stop("invalid outcome")
        }
        
        outcome_data[, 11] <- as.numeric(outcome_data[, 11])
        outcome_data[, 17] <- as.numeric(outcome_data[, 17])
        outcome_data[, 23] <- as.numeric(outcome_data[, 23])
        
        outcome_data_state <- subset(outcome_data, State == state)
        
        if (outcome == "heart attack") {
                outcome_data_state[which.min(outcome_data_state[, 11]), 2]
        } else if (outcome == "heart failure") {
                outcome_data_state[which.min(outcome_data_state[, 17]), 2]
        } else if (outcome == "pneumonia") {
                outcome_data_state[which.min(outcome_data_state[, 23]), 2]
        }
        
}
