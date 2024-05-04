import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class Home extends StatelessWidget {
  final AuthRepository authRepository;
  final GlobalKey homeKey = GlobalKey(debugLabel: "Home");

  Home({Key? key, required this.authRepository, GlobalKey<State<StatefulWidget>>? homeKey}) : super(key: key);

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
          image: AssetImage('lib/presentation/images/ads_home_background.png'),
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
      'Impact everyone with personalized ads',
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
      'Base your products on our analytics to have a better influence to your users',
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
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 18),
      ),
      child: Text('Requiere a demo'),
    );
  }
}

class MobileHome extends StatelessWidget {
  final AuthRepository authRepository;
  final GlobalKey<State<StatefulWidget>> homeKey;

  const MobileHome({Key? key, required this.authRepository, required this.homeKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: homeKey,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/presentation/images/ads_home_background.png'),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 62),
              buildAwesomeRecommendationsText(),
              SizedBox(height: 36),
              buildDescriptionText(),
              SizedBox(height: 62),
              buildRecommendButton(),
              SizedBox(height: 62),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAwesomeRecommendationsText() {
    return Text(
      'Impact everyone with personalized ads',
      style: TextStyle(
        fontSize: 24, 
        color: textInsideButtonColor,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildDescriptionText() {
    return Text(
      'Base your products on our analytics to have a better influence to your users',
      style: TextStyle(
        fontSize: 18, 
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
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), 
        textStyle: TextStyle(fontSize: 14),
      ),
      child: Text('Require a demo'),
    );
  }
}