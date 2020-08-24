mta = {
  :n_line => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  :l_line => ["8th", "6th", "Union Square", "3rd", "1st"],
  :six_line => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}
def plantrip line_name, start_stop, line_name2, end_stop
  puts start_index = mta[line_name].index start_stop
  puts end_index = mta[line_name2].index end_stop
  if start_index > end_index{
      puts station_of_trip = mta[line_name].slice(end_index,start_index)
      puts reversed_stations = station_of_trip.reverse
      p reversed_stations()
      p("You must travel through the following stops on #{line_name}: #{reversed_stations}.")
      p(`Total Train stops: #{stations_of_trip.length}`)
    }
   elsif line_name==line_name2{
      puts station_of_trip = mta[line_name].slice(start_index+1, end_index+1)
      p station_of_trip, start_index, end_index
      p("You must travel through the following stops on #{line_name}: #{stations_of_trip}.")
      p(`Total Train stops: #{stations_of_trip.length}`)
    }
  elsif stations_of_trip mta[line_name].slice(start_index+1, end_index+1)
      puts multi_station_trip = mta[line_name2].slice(start_index+1, end_index+1)
      p("You must travel through the following stops on #{line_name}: #{stations_of_trip}.")
      p(`change at Union Square to #{line_name2} and you must travel through the following stops: #{multi_station_trip}`)
      p(`Total Train stops: #{stations_of_trip.length+multi_station_trip.length}`)
  elsif line_name!=line_name2{
      puts multi_station_trip = mta[line_name2].slice(end_index, start_index)
      puts reversed_stations = multi_station_trip.reverse()
      p(`change at Union Square to #{line_name2} and you must travel through the following stops: #{multi_station_trip}`)
      p(`Total Train stops: #{stations_of_trip.length+multi_station_trip.length}`)
   }
end
p plantrip(:l_line,"1st",:n_line,"28th")
end
