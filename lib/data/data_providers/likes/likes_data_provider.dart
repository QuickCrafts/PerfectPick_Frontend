import 'package:graphql_flutter/graphql_flutter.dart';

String specificLikeQuery = '''
  query SpecificLike(\$userToken: String!, \$id: Int!, \$mediaID: String!, \$mediaType: String!) {
    SpecificLike(userToken: \$userToken, id: \$id, mediaID: \$mediaID, mediaType: \$mediaType) {
      mediaId
      userId
      type
      likeType
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
      mediaId
      userId
      type
      likeType
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

String likeMediaQuery = '''
  mutation likeMedia(\$token: String!, \$id: Int!, \$mediaId: String!, \$type: String!) {
    likeMedia(token: \$token, id: \$id, mediaId: \$mediaId, type: \$type) {
      # Aquí puedes devolver los datos que necesites
      # En este ejemplo devolvemos un mensaje
      message
    }
  }
''';

String dislikeMediaQuery = '''
  mutation dislikeMedia(\$token: String!, \$id: Int!, \$mediaId: String!, \$type: String!) {
    dislikeMedia(token: \$token, id: \$id, mediaId: \$mediaId, type: \$type) {
      # Aquí puedes devolver los datos que necesites
      # En este ejemplo devolvemos un mensaje
      message
    }
  }
''';

String deletePreferenceQuery = '''
  mutation deletePreference(\$token: String!, \$id: Int!, \$mediaId: String!, \$type: String!) {
    deletePreference(token: \$token, id: \$id, mediaId: \$mediaId, type: \$type) {
      # Aquí puedes devolver los datos que necesites
      # En este ejemplo devolvemos un mensaje
      message
    }
  }
''';

MutationOptions likeMediaMutationOptions(
    String token, int id, String mediaId, String type) {
  return MutationOptions(
    document: gql(likeMediaQuery),
    variables: {
      'token': token,
      'id': id,
      'mediaId': mediaId,
      'type': type,
    },
  );
}

MutationOptions dislikeMediaMutationOptions(
    String token, int id, String mediaId, String type) {
  return MutationOptions(
    document: gql(dislikeMediaQuery),
    variables: {
      'token': token,
      'id': id,
      'mediaId': mediaId,
      'type': type,
    },
  );
}

MutationOptions deletePreferenceMutationOptions(
    String token, int id, String mediaId, String type) {
  return MutationOptions(
    document: gql(deletePreferenceQuery),
    variables: {
      'token': token,
      'id': id,
      'mediaId': mediaId,
      'type': type,
    },
  );
}
