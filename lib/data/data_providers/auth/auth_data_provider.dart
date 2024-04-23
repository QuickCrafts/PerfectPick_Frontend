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

String signUpQuery = '''
  mutation signUpUser(\$email: String!, \$password: String!, \$firstName: String!, \$lastName: String!, \$birthdate: String!, \$role: Boolean!){
    signUpUser(email: \$email, password: \$password, firstName: \$firstName, lastName: \$lastName, birthdate: \$birthdate, role: \$role){
      message
    }
  }
''';

QueryOptions signUpQueryOptions(String email, String password, String firstName, String lastName, String birthdate, bool role) {
  return QueryOptions(
    document: gql(signUpQuery),
    variables: {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'birthdate': birthdate,
      'role': role,
    },
    pollInterval: Duration(seconds: 10),
  );
}

String googleSignUpQuery= '''
  query loginWithGoogle {
    loginWithGoogle {
      url
    }
  }
''';

QueryOptions googleSignUpQueryOptions() {
  return QueryOptions(
    document: gql(googleSignUpQuery),
    pollInterval: Duration(seconds: 10),
  );
}

String createCompanyQuery = '''
  mutation CreateCompany(\$name: String!, \$email: String!){
    CreateCompany(name: \$name, email: \$email){
      companyId
    }
  }
''';

QueryOptions createCompanyQueryOptions(String name, String email) {
  return QueryOptions(
    document: gql(createCompanyQuery),
    variables: {
      'name': name,
      'email': email
    },
    pollInterval: Duration(seconds: 10),
  );
}


String verifyIDQuery = ''' 
  query verifyIdentity(\$token: String!){
    verifyIdentity(userToken: \$token){
      id
    }
  }
''';

QueryOptions verifyIDQueryOptions(String token) {
  return QueryOptions(
    document: gql(verifyIDQuery),
    variables: {
      'token': token
    },
    pollInterval: Duration(seconds: 10),
  );
}