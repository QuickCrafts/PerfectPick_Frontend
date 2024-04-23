import 'package:flutter/material.dart';
import 'package:perfectpick_wa/presentation/pages/ads_landing.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/card_media.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/home.dart';
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
  final AuthRepository mainAuthRepository =
      AuthRepository(client: graphqlClient.value);
  MyApp({super.key});

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
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(authRepository: mainAuthRepository),
          '/ads': (context) =>
              AdsLandingPage(authRepository: mainAuthRepository),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AuthRepository authRepository;

  const MyHomePage({super.key, required this.authRepository});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> keys = {
    "home": GlobalKey(),
    "howItWorks": GlobalKey(),
    "support": GlobalKey(),
    "faqs": GlobalKey(),
    "footer": GlobalKey(),
  };

  AuthRepository get authRepository => widget.authRepository;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    final GlobalKey? key = keys[section];
    if (key == null) return;
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF260629),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: NavBar(
                authRepository: authRepository,
                onSectionSelected: _scrollToSection),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Home(authRepository: authRepository, key: keys["home"]),
                  HowItWorks(
                    authRepository: authRepository,
                    key: keys["howItWorks"],
                  ),
                  Support(
                    authRepository: authRepository,
                    key: keys["support"],
                  ),
                  Faqs(authRepository: authRepository, key: keys["faqs"]),
                  Footer(authRepository: authRepository, key: keys["footer"]),
                  CardMedia(
                      userID: 1,
                      name:
                          'un texto largo largo largo largo largo largo larguisimo',
                      genre: 'otro texto largo largo largo larguísimo',
                      author:
                          'ni se diga mas, mas texto largo largo largo larguísimo',
                      mediaType: 'SON',
                      mediaID: '1')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
