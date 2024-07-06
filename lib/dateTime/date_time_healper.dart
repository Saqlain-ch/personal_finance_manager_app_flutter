String convertDateTimeToString(DateTime dateTime){
  String year = dateTime.year.toString();
  String month = dateTime.month.toString();
  //if month is one digit only add 0 at start
  if(month.length == 1){
    month = "0".toString()+month;
  } 
  //if day is one digit only add 0 at start
  String day = dateTime.day.toString();
  if(day.length == 1){
    day = "0".toString()+day; 
  }
  

  //final return yyyymmdd
  String yyyymmdd = year+month+day;
  return yyyymmdd.toString();
}


//display date like Jan 12

String dateToMMDD(DateTime dateTime){
  String day = dateTime.day.toString();
  String month = dateTime.month.toString();
  //change month numbet to month name like Jan Fab toll Dec
  switch(month){
    case "1":
      month = "Jan";
      break;
    case "2":
      month = "Feb";
      break;
  case "3":
    month = "Mar";
    break;
  case "4":
    month = "Apr";
    break;
  case "5":
    month = "May";
    break;
  case "6":
    month = "Jun";
    break;
  case "7":
    month = "Jul";
    break;
  case "8":
    month = "Aug";
    break;
  case "9":
    month = "Sep";
    break;
  case "10":
    month = "Oct";
    break;
  case "11":
    month = "Nov";
    break;
  case "12":
    month = "Dec";
    break;

  }

  String MMDD = month + " ".toString() + day;
  return MMDD;
}
