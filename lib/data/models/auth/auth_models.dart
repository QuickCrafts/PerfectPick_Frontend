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
class ForgotPasswordModel{
  String email;

  ForgotPasswordModel({
    required this.email
  });

  ForgotPasswordModel.fromJson(Map<String, dynamic> json):
    email = json['email'];
  

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }

  bool validate(){
    return email.isNotEmpty;
  }
}

class ForgotPasswordResponseModel {
  String message;

  ForgotPasswordResponseModel({required this.message});

  ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json)
      : message = json['forgotPassword']['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forgotPassword'] = {'message': message};
    return data;
  }

  bool validate() {
    return message.isNotEmpty;
  }
}

class SignUpModel{
  String email;
  String password;
  String firstName;
  String lastName;
  String birthdate;
  bool role;

  SignUpModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.role
  });

  SignUpModel.fromJson(Map<String, dynamic> json):
        email = json['email'] , password = json['password'], firstName = json['firstName'], lastName = json['lastName'], birthdate = '2005-02-21', role = false;


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthdate'] = birthdate;
    data['role'] = role;
    return data;
  }

  bool validate(){
    return firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty && password.isNotEmpty && birthdate.isNotEmpty;
  }
}

class SignUpResponseModel {
  int token;

  SignUpResponseModel({required this.token});

  SignUpResponseModel.fromJson(Map<String, dynamic> json)
      : token = json['signUpUser']['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signUpUser'] = {'token': token};
    return data;
  }

  bool validate() {
    return token.toString().isNotEmpty;
  }
}

class CreateCompanyModel{
  String name;
  String email;

  CreateCompanyModel({
    required this.name,
    required this.email
  });

  CreateCompanyModel.fromJson(Map<String, dynamic> json):
        name = json['name'], email = json['email'];


  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }

  bool validate(){
    return name.isNotEmpty && email.isNotEmpty;
  }
}

class CreateCompanyResponseModel {
  int id;

  CreateCompanyResponseModel({required this.id});

  CreateCompanyResponseModel.fromJson(Map<String, dynamic> json)
      : id = json['createCompany']['companyId'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createCompany'] = {'companyId': id};
    return data;
  }

  bool validate() {
    return id.toString().isNotEmpty;
  }
}