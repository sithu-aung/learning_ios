class AuthResponse {
  String? message;
  String? apiToken;
  User? user;
  int? code;

  AuthResponse({this.message, this.apiToken, this.user, this.code});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    apiToken = json['api_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['api_token'] = apiToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class User {
  String? userId;
  String? userName;
  String? email;
  String? phone;
  String? dob;
  int? age;
  String? state;
  int? isEmailVerified;
  String? lastLogin;
  String? userType;
  String? profession;
  String? updatedAt;
  String? createdAt;
  String? sId;

  User(
      {this.userId,
      this.userName,
      this.email,
      this.phone,
      this.dob,
      this.age,
      this.state,
      this.isEmailVerified,
      this.lastLogin,
      this.userType,
      this.profession,
      this.updatedAt,
      this.createdAt,
      this.sId});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    age = json['age'];
    state = json['state'];
    isEmailVerified = json['is_email_verified'];
    lastLogin = json['last_login'];
    userType = json['user_type'];
    profession = json['profession'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    data['age'] = age;
    data['state'] = state;
    data['is_email_verified'] = isEmailVerified;
    data['last_login'] = lastLogin;
    data['user_type'] = userType;
    data['profession'] = profession;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['_id'] = sId;
    return data;
  }
}
