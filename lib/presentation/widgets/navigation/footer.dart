import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:perfectpick_wa/presentation/widgets/Legal/Privacy_policy_page.dart';
import 'package:perfectpick_wa/presentation/widgets/Legal/terms_of_service_page.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/support.dart';

class Footer extends StatelessWidget {
  final AuthRepository authRepository;

  const Footer({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopFooter(authRepository: authRepository);
        } else {
          return MobileFooter(authRepository: authRepository);
        }
      },
    );
  }
}

class DesktopFooter extends StatelessWidget {
  final AuthRepository authRepository;

  const DesktopFooter({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color:
        Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
      ),
      child: Column(
        children: [
          SizedBox(height: 95),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            InkWell(
              onTap: () {
                goToSocialMedia(1);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryLight,
                ),
                child: Center(
                  child: Image.asset(
                    "lib/presentation/images/facebook_black.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                goToSocialMedia(2);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryLight,
                ),
                child: Center(
                  child: Image.asset(
                    "lib/presentation/images/instagram_black.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                goToSocialMedia(3);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryLight,
                ),
                child: Center(
                  child: Image.asset(
                    "lib/presentation/images/tiktok_black.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {
                goToSocialMedia(4);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryLight,
                ),
                child: Center(
                  child: Image.asset(
                    "lib/presentation/images/twitter_black.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
            ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Get App',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/ads");
                  },
                  child: Text(
                    'Advertising',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'PerfectPick Admin',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Help',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TermsOfServicePage()),
                    );
                  },
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                    );
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                Text(
                  'A ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Transform.translate(
                  offset: Offset(0, -5),
                  child: InkWell(
                    onTap: () {
                      goToSocialMedia(0);
                    },
                    child: Image.asset(
                      "lib/presentation/images/Text3.png",
                      width: 120,
                      height: 24,
                    ),
                  ),
                ),
                Text(
                  ' product',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileFooter extends StatelessWidget {
  final AuthRepository authRepository;

  const MobileFooter({Key? key, required this.authRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color:
        Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  goToSocialMedia(1);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryLight,
                  ),
                  child: Center(
                    child: Image.asset(
                      "lib/presentation/images/facebook_black.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  goToSocialMedia(2);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryLight,
                  ),
                  child: Center(
                    child: Image.asset(
                      "lib/presentation/images/instagram_black.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  goToSocialMedia(3);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryLight,
                  ),
                  child: Center(
                    child: Image.asset(
                      "lib/presentation/images/tiktok_black.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  goToSocialMedia(4);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryLight,
                  ),
                  child: Center(
                    child: Image.asset(
                      "lib/presentation/images/twitter_black.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Get App',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Advertising',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'PerfectPick Admin',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Help',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Wrap(
              children: [
                Text(
                  'A ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Transform.translate(
                  offset: Offset(0, -5),
                  child: InkWell(
                    onTap: () {
                      goToSocialMedia(0);
                    },
                    child: Image.asset(
                      "lib/presentation/images/Text3.png",
                      width: 120,
                      height: 24,
                    ),
                  ),
                ),
                Text(
                  ' product',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}