import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:perfectpick_wa/data/data_providers/media/media_data_provider.dart';
import 'package:perfectpick_wa/data/models/media/media_models.dart';

class MediaRepository {
  final GraphQLClient client;
  MediaRepository({required this.client});

  Future<List<BooksModel>> getBooks() async {
    final List<BooksModel> potentialList;

    final QueryOptions options = getBooksQueryOptions();
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['GetBooks'];
      if (data != null && data is List<Object?>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['GetBooks'];
    final List<BooksModel>? response;
    if (data.every((element) => element is Map<String, dynamic>)) {
    } else {
      throw ('Invalid data format received from the GraphQL query.');
    }
    response = data
        .map<BooksModel>((mapElement) => BooksModel.fromJson(mapElement))
        .toList();
    if (response == null) {
      throw Exception('No books received from the GraphQL query.');
    }
    potentialList = response;
    BooksResponseModel outcomingModel =
        BooksResponseModel(books: potentialList);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }
    return outcomingModel.books;
  }

  Future<List<SongsModel>> getSongs() async {
    final List<SongsModel> potentialList;

    final QueryOptions options = getSongsQueryOptions();
    final QueryResult result = await client.query(options);

    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['GetSongs'];
      if (data != null && data is List<Object?>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }

    // Check result data
    final data = result.data!['GetSongs'];
    final List<SongsModel>? response;
    if (data.every((element) => element is Map<String, dynamic>)) {
    } else {
      throw ('Invalid data format received from the GraphQL query.');
    }
    response = data
        .map<SongsModel>((mapElement) => SongsModel.fromJson(mapElement))
        .toList();
    if (response == null) {
      throw Exception('No books received from the GraphQL query.');
    }
    potentialList = response;
    SongsResponseModel outcomingModel =
        SongsResponseModel(songs: potentialList);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }
    return outcomingModel.songs;
  }

  Future<List<MoviesModel>> getMovies() async {
    final List<MoviesModel> potentialList;

    final QueryOptions options = getMoviesQueryOptions();
    final QueryResult result = await client.query(options);
    if (result.hasException) {
      // Handle the exception
      print('GraphQL exception: ${result.exception.toString()}');
    } else if (result.data == null) {
      // Handle the case when result.data is null
      print('No data received from the GraphQL query.');
    } else {
      final data = result.data!['GetMovies'];
      
      if (data != null && data is List<Object?>) {
      } else {
        print('Invalid data format received from the GraphQL query.');
      }
    }
    
    // Check result data
    final data = result.data!['GetMovies'];
    final List<MoviesModel>? response;
    if (data.every((element) => element is Map<String, dynamic>)) {
    } else {
      throw ('Invalid data format received from the GraphQL query.');
    }
    response = data
        .map<MoviesModel>((mapElement) => MoviesModel.fromJson(mapElement))
        .toList();
    if (response == null) {
      throw Exception('No books received from the GraphQL query.');
    }
    potentialList = response;
    MoviesResponseModel outcomingModel =
        MoviesResponseModel(movies: potentialList);
    if (!outcomingModel.validate()) {
      throw Exception('Invalid output');
    }
    
    return outcomingModel.movies;
  }
}
