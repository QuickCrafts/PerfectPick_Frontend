import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/presentation/widgets/Demo/Demo.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class HowToImpact extends StatelessWidget {
  final AuthRepository authRepository;

  const HowToImpact({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1020) {
          return DesktopHowToImpact(authRepository: authRepository);
        } else {
          return MobileHowToImpact(authRepository: authRepository);
        }
      },
    );
  }
}

class DesktopHowToImpact extends StatelessWidget {
  final AuthRepository authRepository;

  const DesktopHowToImpact({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 615,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            secondaryMain.withOpacity(0.6),
            activeColor.withOpacity(0.6),
          ],
          stops: [0.3, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "lib/presentation/images/how_to_impact_mobile.png",
                    ),
                    SizedBox(height: 20),
                    Text(
                      "See what users like",
                      style: TextStyle(
                          color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "See our analytics related with media and take better decisions",
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
                  padding: EdgeInsets.fromLTRB(30, 0, 50, 0),
                  child: Transform.translate(
                    offset: Offset(0, 34),
                    child: Column(
                      children: [
                        Image.asset(
                          "lib/presentation/images/how_to_impact_pen.png",
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Prepare your ads",
                          style: TextStyle(
                              color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          width: 250,
                          child: Text(
                            "Create personalized ads based on our users analytics",
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
                  offset: Offset(0, 7),
                  child: Column(
                    children: [
                      Image.asset(
                        "lib/presentation/images/how_to_impact_laptop.png",
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Publish focused",
                        style: TextStyle(
                            color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Publish your ads to certain users to impact better and get clients",
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
          ),
          SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 36,
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DemoDialog(
                          authRepository: authRepository,
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: activeColor,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Require a demo',
                      style: TextStyle(color: textInsideButtonColor)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileHowToImpact extends StatelessWidget {
  final AuthRepository authRepository;

  const MobileHowToImpact({Key? key, required this.authRepository})
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
            secondaryMain.withOpacity(0.6),
            activeColor.withOpacity(0.6),
          ],
          stops: [0.3, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Image.asset(
            "lib/presentation/images/how_to_impact_mobile.png",
          ),
          SizedBox(height: 20),
          Text(
            "See what users like",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "See our analytics related with media and take better decisions",
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
            "lib/presentation/images/how_to_impact_pen.png",
          ),
          SizedBox(height: 20),
          Text(
            "Prepare your ads",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "Create personalized ads based on our users analytics",
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
            "lib/presentation/images/how_to_impact_laptop.png",
          ),
          SizedBox(height: 20),
          Text(
            "Publish focused",
            style: TextStyle(
                color: textInsideFieldColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 250,
            child: Text(
              "Publish your ads to certain users to impact better and get clients",
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
          SizedBox(
            width: 180,
            height: 36,
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DemoDialog(
                      authRepository: authRepository,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: activeColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Require a demo',
                  style: TextStyle(color: textInsideButtonColor)),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}