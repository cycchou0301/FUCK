flights = readRDS("data/flights.rds")

data2 <- list(
  meta = list(
    name="航空公司統一代碼",
    source_lunk ="http://data.gov.tw/dataset/8088"
  ),
  file = "data/airlines.json"
)

flights$data[[2]] <- data2

airlines <- 
  jsonlite::fromJSON(
    flights$data[[2]][["file"]]
  )

flights$data[[2]][["data_frame"]] <- airline

# Merge data

flightsData <- flights$data[[1]]$data_frame



dplyr::left_join(
  flightsData, airlines,
  by="AirlineID"
  ) -> flightsData

install.packages("airportr")
airportr::airports -> airports

head(airports$Country)
head(airports$Country == "Taiwan")


pick_taiwan <- airports$Country == "Taiwan"
pick_taiwan

airports[pick_taiwan, ] |> View()

c(2, 4, 7)c[(T, F, T)]

airports$IAIA[pick_taiwan]

airports |>
  dplyr::filter(
    Country == "Taiwan"
) -> airports_taiwan

taiwan_IAIA <- unique(airports_taiwan$IAIA)


pick_departure <- flightsData$DepartureAirportID %in% taiwan_IAIA
head(pick_departure)
flightsData[pick_departure, ] |> View()

which(pick_departure) |> head(10)

whichIsDeparture <- which(pick_departure)
flightsData[whichIsDeparture, ]

flightsData |>
  dplyr::filter(
    DepartureAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  departure_flightsData

flightsData |>
  dplyr::filter(
    ArrivalAirportID %in% unique(airports_taiwan[["IATA"]])) -> 
  arrival_flightsData


flights$data[[3]] <- list(
  departure_flightsData= departure_flightsData,
  arrival_flightsData = arrival_flightsData
)


#
flightsData <- readRDS("data/flightsData_week8.rds")

dplyr::glimpse(flightsData)

flightsData$ScheduleStartDate |> head()

lubridate::ymd(flightsData$ScheduleStartDate) ->
  flightsData$ScheduleStartDate
View(flightsData)

