import 'package:graphql_flutter/graphql_flutter.dart';

String getBooksQuery = '''
  query GetBooks {
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

QueryOptions getBooksQueryQueryOptions() {
  return QueryOptions(
    document: gql(getBooksQuery),
    pollInterval: Duration(seconds: 10),
  );
}