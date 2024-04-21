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
    final String? potentialToken;

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
      //sadddddddddddddddddddddddddddddddddddddddddddddddd
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
}



