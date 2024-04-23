import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import 'package:perfectpick_wa/presentation/widgets/login/login_modal.dart';
import 'package:perfectpick_wa/presentation/widgets/navigation/how_it_works.dart';
import 'package:perfectpick_wa/presentation/widgets/signUp/signup_modal.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";

class NavBar extends StatelessWidget {
  final AuthRepository authRepository;
  final Function(String) onSectionSelected;

  const NavBar({Key? key, required this.authRepository, required this.onSectionSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopNavBar(authRepository: authRepository, onSectionSelected: (string) {
            onSectionSelected(string);
          });
        } else {
          return MobileNavBar(authRepository: authRepository, onSectionSelected: (string) {
            onSectionSelected(string);
          });
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  final AuthRepository authRepository;
  final Function(String) onSectionSelected;

  const DesktopNavBar({Key? key, 
  required this.authRepository,
  required this.onSectionSelected,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color:
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          InkWell(
            onTap: ()  {
              onSectionSelected("home");
            },
            child: Image.asset(
              "lib/presentation/images/PerfectPickName.png",
              width: 201,
              height: 24,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              onSectionSelected("home");
            },
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(width: 5),
          TextButton(
            onPressed: () {
              onSectionSelected("howItWorks");
            },
            child: Text(
              'How it works',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(width: 5),
          TextButton(
            onPressed: () {
              onSectionSelected("faqs");
            },
            child: Text(
              'About us',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(width: 5),
          TextButton(
            onPressed: () {
              onSectionSelected("support");
            },
            child: Text(
              'Support',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LoginDialog(
                    authRepository: authRepository,
                  );
                },
              );
            },
            child: Text(
              'Log in',
              style: TextStyle(color: activeColor, fontSize: 18),
            ),
          ),
          SizedBox(width: 5),
          Text("|", style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(width: 5),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SignUpDialog(
                    authRepository: authRepository,
                  );
                },
              );
            },
            child: Text(
              'Sign up',
              style: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  final AuthRepository authRepository;
  final Function(String) onSectionSelected;

  const MobileNavBar({Key? key, required this.authRepository, required this.onSectionSelected,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(38, 6, 41, 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    onSectionSelected("home");
                  },
                  child: Image.asset(
                    "lib/presentation/images/PerfectPickStar.png",
                    width: 35,
                    height: 35,
                  ),
                ),
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.menu, color: activeColor),
                  onPressed: () {
                    showMenu(
                      color: Color.fromRGBO(38, 6, 41, 1),
                      context: context,
                      position: RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                      items: [
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("home");
                          },
                          value: 1,
                          child: 
                          Text(
                            'Home', 
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("howItWorks");
                          },
                          value: 2,
                          child: 
                          Text(
                            'How it works',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("faqs");
                          },
                          value: 1,
                          child: 
                          Text(
                            'About us', 
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            onSectionSelected("support");
                          },
                          value: 2,
                          child: 
                          Text(
                            'Support',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return LoginDialog(authRepository: authRepository);
                    },
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(color: activeColor, fontSize: 18),
                ),
              ),
              SizedBox(width: 5),
              Text("|", style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(width: 5),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SignUpDialog(authRepository: authRepository);
                    },
                  );
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(color: Colors.yellow, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
