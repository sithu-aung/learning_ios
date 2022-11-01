class Util {
  static String intToMM(int str) {
    String converted;
    converted = str.toString().replaceAll(RegExp('0'), "၀");
    converted = converted.replaceAll(RegExp('1'), "၁");
    converted = converted.replaceAll(RegExp('2'), "၂");
    converted = converted.replaceAll(RegExp('3'), "၃");
    converted = converted.replaceAll(RegExp('4'), "၄");
    converted = converted.replaceAll(RegExp('5'), "၅");
    converted = converted.replaceAll(RegExp('6'), "၆");
    converted = converted.replaceAll(RegExp('7'), "၇");
    converted = converted.replaceAll(RegExp('8'), "၈");
    converted = converted.replaceAll(RegExp('9'), "၉");

    return converted;
  }

  static String convertMonthToString(String str) {
    String converted = "01";
    if (str == "January") {
      converted = "01";
    } else if (str == "February") {
      converted = "02";
    } else if (str == "March") {
      converted = "03";
    } else if (str == "April") {
      converted = "04";
    } else if (str == "May") {
      converted = "05";
    } else if (str == "June") {
      converted = "06";
    } else if (str == "July") {
      converted = "07";
    } else if (str == "August") {
      converted = "08";
    } else if (str == "September") {
      converted = "09";
    } else if (str == "October") {
      converted = "10";
    } else if (str == "November") {
      converted = "11";
    } else if (str == "December") {
      converted = "12";
    }
    return converted;
  }

  static String convertStringToMonth(String str) {
    String converted = "January";
    if (str == "01") {
      converted = "January";
    } else if (str == "02") {
      converted = "February";
    }
    //convert String Number of 01 to 12 , to Month Name
    else if (str == "03") {
      converted = "March";
    } else if (str == "04") {
      converted = "April";
    } else if (str == "05") {
      converted = "May";
    } else if (str == "06") {
      converted = "June";
    } else if (str == "07") {
      converted = "July";
    } else if (str == "08") {
      converted = "August";
    } else if (str == "09") {
      converted = "September";
    } else if (str == "10") {
      converted = "October";
    } else if (str == "11") {
      converted = "November";
    } else if (str == "12") {
      converted = "December";
    }

    return converted;
  }
}
