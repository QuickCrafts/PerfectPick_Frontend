import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'presentation/widgets/navigation/navbar.dart';
import 'presentation/widgets/navigation/how_it_works.dart';
import 'presentation/widgets/navigation/support.dart';
import 'presentation/widgets/navigation/faqs.dart';
import 'presentation/widgets/navigation/footer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'data/data_providers/client_declarator.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
      ChangeNotifierProvider(
        create: (context) => MyState(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClient,
      child: MaterialApp(
        title: 'PerfectPick',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(authRepository: AuthRepository(client: graphqlClient.value),),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  final AuthRepository authRepository;

  const MyHomePage({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: NavBar(authRepository: authRepository),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HowItWorks(authRepository: authRepository),
                  Support(authRepository: authRepository),
                  Faqs(authRepository: authRepository),
                  Footer(authRepository: authRepository),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}