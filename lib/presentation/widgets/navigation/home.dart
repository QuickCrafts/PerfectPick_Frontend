import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class Home extends StatelessWidget {
  final AuthRepository authRepository;
  final GlobalKey homeKey = GlobalKey(debugLabel: "Home");

  Home({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return DesktopHome(authRepository: authRepository, homeKey: homeKey);
        } else {
          return MobileHome(authRepository: authRepository, homeKey: homeKey);
        }
      },
    );
  }
}

class DesktopHome extends StatelessWidget {
  final AuthRepository authRepository;
  final GlobalKey<State<StatefulWidget>> homeKey;

  const DesktopHome({Key? key, required this.authRepository, required this.homeKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: homeKey,
      height: 900,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/presentation/images/home_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(38, 6, 41, 0.5),
              activeColor.withOpacity(0.6),
            ],
            stops: [0.3, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildAwesomeRecommendationsText(),
              SizedBox(height: 16),
              buildDescriptionText(),
              SizedBox(height: 32),
              buildRecommendButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAwesomeRecommendationsText() {
    return Text(
      'Awesome recommendations for you free time',
      style: TextStyle(
        fontSize: 64,
        color: textInsideButtonColor,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescriptionText() {
    return Text(
      'Books, movies and music you need to enjoy according with your preferences',
      style: TextStyle(
        fontSize: 36,
        color: textInsideButtonColor.withOpacity(0.8),

      ),
      
      textAlign: TextAlign.center,
    );
  }

  Widget buildRecommendButton() {
    return ElevatedButton(
      onPressed: () {
        // Add button click logic here
      },
      child: Text('Recommend me'),
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}

class MobileHome extends StatelessWidget {
  final AuthRepository authRepository;
  final GlobalKey<State<StatefulWidget>> homeKey;

  const MobileHome({Key? key, required this.authRepository, required this.homeKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeKey,
      appBar: AppBar(
        title: Text("PerfectPick"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              // Add logout logic here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildAwesomeRecommendationsText(),
            SizedBox(height: 16),
            buildDescriptionText(),
            SizedBox(height: 32),
            buildRecommendButton(),
          ],
        ),
      ),
    );
  }

  Widget buildAwesomeRecommendationsText() {
    return Text(
      'Awesome recommendations for you free time',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescriptionText() {
    return Text(
      'Books, movies and music you need to enjoy according with your preferences',
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  Widget buildRecommendButton() {
    return ElevatedButton(
      onPressed: () {
        // Add button click logic here
      },
      child: Text('Recommend me'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}