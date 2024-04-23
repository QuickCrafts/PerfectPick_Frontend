import 'package:flutter/material.dart';
import 'package:perfectpick_wa/presentation/widgets/cards/card_media.dart';
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
        routes: {
          '/': (context) => MyHomePage(
                authRepository: AuthRepository(client: graphqlClient.value),
              ),
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
      backgroundColor: Colors.black,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
