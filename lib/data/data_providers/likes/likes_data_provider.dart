import 'package:graphql_flutter/graphql_flutter.dart';

String specificLikeQuery = '''
  query SpecificLike(\$userToken: String!, \$id: Int!, \$mediaID: String!, \$mediaType: String!) {
    specificLike(userToken: \$userToken, id: \$id, mediaID: \$mediaID, mediaType: \$mediaType) {
      media_id
      user_id
      type
      like_type
    }
  }
''';

QueryOptions specificLikeQueryOptions(
    String userToken, int id, String mediaID, String mediaType) {
  return QueryOptions(
    document: gql(specificLikeQuery),
    variables: {
      'userToken': userToken,
      'id': id,
      'mediaID': mediaID,
      'mediaType': mediaType,
    },
    pollInterval: Duration(seconds: 10),
  );
}

String wishlistByUserIdQuery = '''
  query wishlistByUserId(\$token: String!, \$id: Int!) {
    wishlistByUserId(token: \$token, id: \$id) {
      media_id
      user_id
      type
      like_type
    }
  }
''';

QueryOptions wishlistByUserIdQueryOptions(String token, int id) {
  return QueryOptions(
    document: gql(wishlistByUserIdQuery),
    variables: {
      'token': token,
      'id': id,
    },
    pollInterval: Duration(seconds: 10),
  );
}
