class LoginModel{
  String email;
  String password;

  LoginModel({
    required this.email, 
    required this.password
    });

  LoginModel.fromJson(Map<String, dynamic> json):
    email = json['email'] , password = json['password'];
  

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  bool validate(){
    return email.isNotEmpty && password.isNotEmpty;
  }
}

class LoginResponseModel {
  String token;

  LoginResponseModel({required this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : token = json['loginWithEmail']['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loginWithEmail'] = {'token': token};
    return data;
  }

  bool validate() {
    return token.isNotEmpty;
  }
}