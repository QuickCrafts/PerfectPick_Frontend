import 'package:graphql_flutter/graphql_flutter.dart';

String getBooksQuery = '''
  query{
    GetBooks {
        idBook
        author
        genres
        pages
        rating
        title
        year
    }
}
''';

QueryOptions getBooksQueryOptions() {
  return QueryOptions(
    document: gql(getBooksQuery),
    pollInterval: Duration(seconds: 10),
  );
}

String getSongsQuery = '''
  query {
    GetSongs{
      idSong
      album
      artist
      duration
      genres
      title
      year
    }
}
''';

QueryOptions getSongsQueryOptions() {
  return QueryOptions(
    document: gql(getSongsQuery),
    pollInterval: Duration(seconds: 10),
  );
}

String getMoviesQuery = '''
  query {
    GetMovies{
    idMovie
    awards
    cast
    director
    duration
    episodes
    genre
    originalTitle
    rating
    releaseDate
    seasons
    title
    writers
    __typename
  }
}
''';

QueryOptions getMoviesQueryOptions() {
  return QueryOptions(
    document: gql(getMoviesQuery),
    pollInterval: Duration(seconds: 10),
  );
}
