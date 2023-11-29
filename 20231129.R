dataSet <- list(
  list(
    gender="male", height=178, age=32,
    children=list(
      list(gender="male", age=5),
      list(gender="male", age=0))
  ),
  list(
    gender="female", height=166, age=30,
    children=list(
      list(gender="female", age=3))
  ),
  list(
    gender="male", height=170, age=42,
    children=list(
      list(gender="male", age=10),
      list(gender="female", age=8))
  ),
  list(
    gender="male", height=188, age=22,
    children=list()
  ),  
  list(
    gender="male", height=172, age=52,
    children=list(
      list(gender="female", age=25),
      list(gender="female", age=23))
  ),
  list(
    gender="female", height=160, age=42,
    children=list(
      list(gender="female", age=11))
  )
flightsData <- flights$Data[[1]]$data_frame

# split according to AirlineID
flightsData |>
  split(
    (flightsData$AirlineID
  ) -> split.data.frame
# for each split data frame we want to know 
# how many flights it contains
"numberOfFlights <- vector(integer" , length(split_data))
for(.x in seq_along(split_data)){
  number0fFlights[[.x]] <-
}