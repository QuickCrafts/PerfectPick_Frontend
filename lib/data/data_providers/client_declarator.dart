import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apigatewayUrl = dotenv.env["PERFECTPICK_APIGATEWAY_URL"]!;

final HttpLink httpLink = HttpLink(apigatewayUrl);

final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

