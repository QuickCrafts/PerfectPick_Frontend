import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class HowItWorks extends StatelessWidget {
  final AuthRepository authRepository;

  const HowItWorks({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return DesktopHowItWorks(authRepository: authRepository);
        } else {
          return MobileHowItWorks(authRepository: authRepository);
        }
      },
    );
  }
}

class DesktopHowItWorks extends StatelessWidget {
  final AuthRepository authRepository;

  const DesktopHowItWorks({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
            activeColor.withOpacity(0.6),
          ],
          stops: [0.3, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    "lib/presentation/images/how_it_works_device.png",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Select your preferences",
                    style: TextStyle(
                        color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "Tell us what you like and dislike to customize your recommendations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textInsideFieldColor, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor,
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: Transform.translate(
                  offset: Offset(0, 51),
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/presentation/images/how_it_works_recommend_button.png",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Click on Recommend me",
                        style: TextStyle(
                            color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Or in our star to generate a  book, movie and song recommendation",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeColor,
                        ),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                                color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -28),
                child: Column(
                  children: [
                    Image.asset(
                      "lib/presentation/images/how_it_works_selection.png",
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Select best media for you",
                      style: TextStyle(
                          color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Go through everything you might like to read, watch or listen",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: textInsideFieldColor, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activeColor,
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    // Go to Download on AppleStore
                  },
                  child: Image.asset(
                  "lib/presentation/images/how_it_works_download_apple.png",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    // Go to Download on PlayStore
                  },
                  child: Image.asset(
                    "lib/presentation/images/how_it_works_download_android.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileHowItWorks extends StatelessWidget {
  final AuthRepository authRepository;

  const MobileHowItWorks({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
            activeColor.withOpacity(0.6),
          ],
          stops: [0.3, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Image.asset(
            "lib/presentation/images/how_it_works_device.png",
          ),
          SizedBox(height: 20),
          Text(
            "Select your preferences",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "Tell us what you like and dislike to customize your recommendations",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textInsideFieldColor, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activeColor,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                    color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 80),
          Image.asset(
            "lib/presentation/images/how_it_works_recommend_button.png",
          ),
          SizedBox(height: 20),
          Text(
            "Click on Recommend me",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "Or in our star to generate a  book, movie and song recommendation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textInsideFieldColor, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activeColor,
            ),
            child: Center(
              child: Text(
                "2",
                style: TextStyle(
                    color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 80),
          Image.asset(
            "lib/presentation/images/how_it_works_selection.png",
          ),
          SizedBox(height: 20),
          Text(
            "Select best media for you",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "Go through everything you might like to read, watch or listen",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textInsideFieldColor, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: activeColor,
            ),
            child: Center(
              child: Text(
                "3",
                style: TextStyle(
                    color: textInsideFieldColor, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // Go to Download on AppleStore
            },
            child: Image.asset(
              "lib/presentation/images/how_it_works_download_apple.png",
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              // Go to Download on PlayStore
            },
            child: Image.asset(
              "lib/presentation/images/how_it_works_download_android.png",
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}