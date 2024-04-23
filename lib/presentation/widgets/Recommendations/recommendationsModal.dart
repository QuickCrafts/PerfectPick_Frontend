
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RecommendationsWidget extends StatefulWidget {
  final String userId;

  const RecommendationsWidget({Key? key, required this.userId}) : super(key: key);

  @override
  _RecommendationsWidgetState createState() => _RecommendationsWidgetState();
}

class _RecommendationsWidgetState extends State<RecommendationsWidget> {
  static const String fetchRecommendationsQuery = """
    query GetRecommendations(\$userId: String!) {
      getRecommendationsForUser(userId: \$userId) {
        movies
        books 
        songs
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(fetchRecommendationsQuery),
        variables: {
          'userId': widget.userId,
        },
      ),
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        final recommendations = result.data?['getRecommendationsForUser'];

        // Extract movies, books, and songs IDs.
        print("we are here");
        final List<dynamic> movies = recommendations['movies'] as List<dynamic>;
        final List<dynamic> books = recommendations['books'] as List<dynamic>;
        final List<dynamic> songs = recommendations['songs'] as List<dynamic>;

        return ListView(
          children: [
            Text('Movies', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var movieId in movies) Text('Movie ID: $movieId'),
            SizedBox(height: 20),
            Text('Books', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var bookId in books) Text('Book ID: $bookId'),
            SizedBox(height: 20),
            Text('Songs', style: TextStyle(fontWeight: FontWeight.bold)),
            for (var songId in songs) Text('Song ID: $songId'),
          ],
        );
      },
    );
  }
}

