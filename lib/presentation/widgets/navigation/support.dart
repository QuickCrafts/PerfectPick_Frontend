import 'package:flutter/material.dart';
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import 'package:url_launcher/url_launcher_string.dart';

class Support extends StatelessWidget {
  final AuthRepository authRepository;

  const Support({Key? key, required this.authRepository}) : super(key: key);

   @override

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 830) {
          return DesktopSupport(authRepository: authRepository);
        } else {
          return MobileSupport(authRepository: authRepository);
        }
      },
    );
  }
}

void goToSocialMedia(pos) async {
  const url = [
    'https://quickcrafts.co', // QuickCrafts main page
    'https://web.facebook.com', // PerfectPick fb
    'https://www.instagram.com', // PerfectPick ig
    'https://www.tiktok.com', // PerfectPick tk
    'https://twitter.com'
  ]; // PerfectPick tw
  if (await canLaunchUrlString(url[pos])) {
    await launchUrlString(url[pos]);
  } else {
    throw 'The URL $url can not be opened';
  }
}

class DesktopSupport extends StatelessWidget {
  final AuthRepository authRepository;

  
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  DesktopSupport({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            activeColor.withOpacity(0.6),
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
          ],
          stops: [0.1, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                //.copyWith(right: 50),
                child: Image.asset(
                  "lib/presentation/images/support_contact_us.png",
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: 430,
                      height: 307,
                      decoration: BoxDecoration(
                        color: modalBackgroundColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          TextField(
                            controller: nameController,
                            cursorColor: activeColor,
                            cursorHeight: 20,
                            style: TextStyle(color: textInsideFieldColor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 4),
                              labelText: 'Name',
                              labelStyle: TextStyle(color: modalTitleColor),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: activeColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: inactiveColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: emailController,
                            cursorColor: activeColor,
                            cursorHeight: 20,
                            style: TextStyle(color: textInsideFieldColor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 4),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: modalTitleColor),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: activeColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: inactiveColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: messageController,
                            cursorColor: activeColor,
                            cursorHeight: 20,
                            style: TextStyle(color: textInsideFieldColor),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 4),
                              labelText: 'Message',
                              labelStyle: TextStyle(color: modalTitleColor),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: activeColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: inactiveColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Checkbox.width * 1.5,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 82,
                              height: 36,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // Handle login action
                                  String email = emailController.text;
                                  String name = nameController.text;
                                  String message = messageController.text;
                                  try {
                                    print("Email: $email, Name: $name, Message: $message");
                                    String messageReceived = await authRepository.sendContactUs(email, name, message);
                                    print(messageReceived);
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text('Success'),
                                              content:
                                                  Text('Message: $messageReceived'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Close'),
                                                ),
                                              ],
                                            ));
                                  } catch (e) {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text('Error'),
                                              content: Text('Error: $e'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Close'),
                                                ),
                                              ],
                                            ));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: activeColor,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text('Send',
                                    style: TextStyle(
                                        color: textInsideButtonColor)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileSupport extends StatelessWidget {
  final AuthRepository authRepository;

  const MobileSupport({Key? key, required this.authRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            activeColor.withOpacity(0.6),
            Color.fromRGBO(38, 6, 41, 0.5), // Updated color to match the image
          ],
          stops: [0.1, 0.9],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            //.copyWith(right: 50),
            child: Image.asset(
              "lib/presentation/images/support_contact_us.png",
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 400,
            height: 307,
            decoration: BoxDecoration(
              color: modalBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  cursorColor: activeColor,
                  cursorHeight: 20,
                  style: TextStyle(color: textInsideFieldColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: modalTitleColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: activeColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: inactiveColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: activeColor,
                  cursorHeight: 20,
                  style: TextStyle(color: textInsideFieldColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: modalTitleColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: activeColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: inactiveColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  cursorColor: activeColor,
                  cursorHeight: 20,
                  style: TextStyle(color: textInsideFieldColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 4),
                    labelText: 'Message',
                    labelStyle: TextStyle(color: modalTitleColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: activeColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: inactiveColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: Checkbox.width * 1.5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 82,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Handle login action

                        try {
                          String message = "Contact us";
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Success'),
                                    content: Text('Message: $message'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  ));
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Error: $e'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: activeColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Send',
                          style: TextStyle(color: textInsideButtonColor)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
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
        ],
      ),
    );
  }
}
