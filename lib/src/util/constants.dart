Map<String, String> kHeaders(token) => {
      "Accept": "application/json",
      'content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };

Map<String, String> kHeadersPlain() => {
      "Accept": "application/json",
      'content-type': 'application/json',
      
    };
