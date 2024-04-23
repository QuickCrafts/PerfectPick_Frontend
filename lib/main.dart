import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:perfectpick_wa/data/repositories/auth/media_repository.dart';
import 'package:perfectpick_wa/presentation/widgets/media/mediaList.dart';
import 'presentation/widgets/navigation/navbar.dart';
import 'presentation/widgets/navigation/how_it_works.dart';
import 'presentation/widgets/navigation/support.dart';
// import 'presentation/widgets/navigation/faqs.dart';
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
        routes: {
          '/':(context) => MyHomePage(authRepository: AuthRepository(client: graphqlClient.value), mediaRepository: MediaRepository(media: graphqlClient.value),),
        },
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final AuthRepository authRepository;
  final MediaRepository mediaRepository;

  const MyHomePage({super.key, required this.authRepository , required this.mediaRepository});

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
                  MediaList(mediaRepository: mediaRepository),
                  // Faqs(authRepository: authRepository),
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
