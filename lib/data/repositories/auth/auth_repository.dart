import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:perfectpick_wa/data/data_providers/auth/auth_data_provider.dart'; // Import the file with the query
import 'package:perfectpick_wa/data/models/auth/auth_models.dart'; // Import your incoming model
import 'dart:convert';

class AuthRepository {
  final GraphQLClient client;

  AuthRepository({required this.client});

  Future<String> emailLogin(String email, String password) async {
    final String? potentialToken;

    LoginModel incomingModel = LoginModel(email: email, password: password);
    if (!incomingModel.validate()) {
      throw Exception('Invalid input');
    }

    final QueryOptions options = loginQueryOptions(email, password);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['loginWithEmail'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['loginWithEmail'];
    final response = jsonDecode(data['token']);
    potentialToken = response['token'];
    if (potentialToken == null) {
      final potentialMessage = response['message'];
      if (potentialMessage != null) {
        throw Exception(potentialMessage);
      } else {
        throw Exception('Unknown error occurred.');
      }
    }

    LoginResponseModel outcomingModel =
        LoginResponseModel(token: potentialToken);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }

    return outcomingModel.token;
  }

  Future<String> googleLogin() async {
    final String? potentialLink;

    final QueryOptions options = googleLoginQueryOptions();
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['loginWithGoogle'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['loginWithGoogle'];
    potentialLink = data['url'];
    if (potentialLink == null) {
      throw Exception('No link received from the GraphQL query.');
    }
    final String link = data['url'];

    return link;
  }

  Future<String> forgotPassword(String email) async {
    final String? potentialMessage;

    ForgotPasswordModel incomingModel = ForgotPasswordModel(email: email);
    if (!incomingModel.validate()) {
      throw Exception('Invalid input');
    }

    final QueryOptions options = forgotPasswordQueryOptions(email);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['forgotPassword'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }
    

    // Check result data
    final data = result.data!['forgotPassword'];
    final response = data['message'];
    if (response == null) {
        throw Exception(response);
    }

    ForgotPasswordResponseModel outcomingModel =
        ForgotPasswordResponseModel(message: response);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }

    return outcomingModel.message;
  }

  Future<int> emailSignUp(String email, String password, String firstName, String lastName, String birthdate, bool role) async{
    final int? potentialId;

    SignUpModel incomingModel = SignUpModel(email: email, password: password, firstName: firstName, lastName: lastName, birthdate: birthdate, role: role);
    if (!incomingModel.validate()) {
      throw Exception('Invalid input');
    }

    final QueryOptions options = signUpQueryOptions(email, password, firstName, lastName, birthdate, role);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['signUpUser'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }


    // Check result data
    final data = result.data!['signUpUser'];
    final response = jsonDecode(data['message']);
    print(response);
    potentialId = response['id'];
    if (potentialId == null) {
      final potentialMessage = response['message'];
      if (potentialMessage != null) {
        throw Exception(potentialMessage);
      } else {
        throw Exception('Unknown error occurred.');
      }
    }

    SignUpResponseModel outcomingModel =
    SignUpResponseModel(token: potentialId);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }

    return outcomingModel.token;
  }

  Future<String> googleSignUp() async {
    final String? potentialLink;

    final QueryOptions options = googleSignUpQueryOptions();
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['loginWithGoogle'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['loginWithGoogle'];
    potentialLink = data['url'];
    if (potentialLink == null) {
      throw Exception('No link received from the GraphQL query.');
    }
    final String link = data['url'];

    return link;
  }

  Future<int> createCompany(String name, String email) async{
    final int? potentialId;

    CreateCompanyModel incomingModel = CreateCompanyModel(name: name, email: email);
    if (!incomingModel.validate()) {
      throw Exception('Invalid input');
    }

    final QueryOptions options = createCompanyQueryOptions(name, email);
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['signUpUser'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }


    // Check result data
    final data = result.data!['createCompany'];
    final response = jsonDecode(data['message']);
    print(response);
    potentialId = response['id'];
    if (potentialId == null) {
      final potentialMessage = response['message'];
      if (potentialMessage != null) {
        throw Exception(potentialMessage);
      } else {
        throw Exception('Unknown error occurred.');
      }
    }

    CreateCompanyResponseModel outcomingModel =
    CreateCompanyResponseModel(id: potentialId);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }

    return outcomingModel.id;
  }
}



