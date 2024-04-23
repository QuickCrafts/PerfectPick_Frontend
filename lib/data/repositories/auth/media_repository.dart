import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:perfectpick_wa/data/data_providers/auth/auth_data_provider.dart'; // Import the file with the query
import 'package:perfectpick_wa/data/data_providers/media/media_data_provider.dart';
import 'package:perfectpick_wa/data/models/auth/auth_models.dart'; // Import your incoming model
import 'dart:convert';

import 'package:perfectpick_wa/data/models/media/media_models.dart';

class MediaRepository {
  final GraphQLClient media;

  MediaRepository({required this.media});

  Future<List<BooksModel>> getBooks() async {
    final List<BooksModel>? potentialList;

    final QueryOptions options = getBooksQueryQueryOptions();
    final QueryResult result = await media.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['GetBooks'];
      if (data != null && data is Map<String, dynamic>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['GetBooks'];
    final response = jsonDecode(data['books']);
    potentialList = response['books'];
    if (potentialList == null) {
      final potentialList = response['books'];
      if (potentialList != null) {
        throw Exception(potentialList);
      } else {
        throw Exception('Unknown error occurred.');
      }
    }

    BooksResponseModel outcomingModel =
        BooksResponseModel(books: potentialList);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }

    return outcomingModel.books;
  }
}



