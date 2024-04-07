import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/widgets/login/login_modal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'PerfectPick',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('Hello World!:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                  return LoginDialog();
                },
              );
            }, child: Text("Open Login Modal")),
          ElevatedButton(
            onPressed: () {
              appState.current = WordPair.random();
            },
            child: Text('Botón de prueba'),
          ),
        ],
      ),
    );
  }
}