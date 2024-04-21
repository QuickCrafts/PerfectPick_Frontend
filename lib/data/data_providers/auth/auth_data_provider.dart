import 'package:graphql_flutter/graphql_flutter.dart';

String loginQuery = '''
  query loginWithEmail(\$email: String!, \$password: String!) {
    loginWithEmail(email: \$email, password: \$password) {
      token
    }

  }
''';

QueryOptions loginQueryOptions(String email, String password) {
  return QueryOptions(
    document: gql(loginQuery),
    variables: {
      'email': email,
      'password': password,
    },
    pollInterval: Duration(seconds: 10),
  );
}

String googleLoginQuery= '''
  query loginWithGoogle {
    loginWithGoogle {
      url
    }
  }
''';

QueryOptions googleLoginQueryOptions() {
  return QueryOptions(
    document: gql(googleLoginQuery),
    pollInterval: Duration(seconds: 10),
  );
}

String forgotPasswordQuery = '''
  query forgotPassword(\$email: String!) {
    forgotPassword(email: \$email) {
      message
    }
  }
''';

QueryOptions forgotPasswordQueryOptions(String email) {
  return QueryOptions(
    document: gql(forgotPasswordQuery),
    variables: {
      'email': email,
    },
    pollInterval: Duration(seconds: 10),
  );
}

// recoverPassword