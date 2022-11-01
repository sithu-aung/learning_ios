class JsonArrayConversion {

  static List<double> convertJson(List<dynamic> json) {
    return json.map((e) => e as double).toList();  
  }

  static List<List<double>> convertJson2(List<dynamic> json) {
    return json.map((e) {
      if (e is List<dynamic>) {
        return convertJson(e);
      } else {
        return [] as List<double>;
      }    
    }).toList();
  }

  static List<List<List<double>>> convertJson3(List<dynamic> json) {
    return json.map((e) {
      if (e is List<dynamic>) {
        return convertJson2(e);
      } else {
        return [] as List<List<double>>;
      }    
    }).toList();
  }

  static List<List<List<List<double>>>> convertJson4(List<dynamic> json) {
    return json.map((e) {
      if (e is List<dynamic>) {
        return convertJson3(e);
      } else {
        return [] as List<List<List<double>>>;
      }    
    }).toList();
  }

}