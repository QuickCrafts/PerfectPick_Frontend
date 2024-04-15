import "dart:ui";

import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import 'package:perfectpick_wa/presentation/widgets/login/login_modal.dart';
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";

class SignUpDialog extends StatefulWidget {

  final AuthRepository authRepository;

  const SignUpDialog({Key? key, required this.authRepository}) : super(key: key);

  @override
  SignUpDialogState createState() => SignUpDialogState();
}

class SignUpDialogState extends State<SignUpDialog> {
  bool _isPasswordHiden = true;
  double _passwordSpacing = 10;
  final loginEmailDataController = TextEditingController();
  final loginPasswordDataController = TextEditingController();

  @override
  void dispose() {
    loginEmailDataController.dispose();
    loginPasswordDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 340,
            height: 590,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340,
              height: 590,
              decoration: BoxDecoration(
                color: modalBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
            child: Column(
            children: [
              SizedBox(height: 12), // Added padding to the top of the dialog (16 pixels
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "lib/presentation/images/PerfectPickName.png",
                  width: 262,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        Text('Register',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: modalTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                cursorColor: activeColor,
                                cursorHeight: 20,
                                style: TextStyle(color: textInsideFieldColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  labelText: 'First name*',
                                  labelStyle: TextStyle(color: labelColor),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: activeColor),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: inactiveColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40, width: 10),
                            Expanded(
                              child: TextField(
                                cursorColor: activeColor,
                                cursorHeight: 20,
                                style: TextStyle(color: textInsideFieldColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  labelText: 'Last name*',
                                  labelStyle: TextStyle(color: labelColor),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: activeColor),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: inactiveColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          cursorColor: activeColor,
                          cursorHeight: 20,
                          style: TextStyle(color: textInsideFieldColor),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4),
                            labelText: 'Email*',
                            labelStyle: TextStyle(color: labelColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: activeColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: inactiveColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          cursorColor: activeColor,
                          cursorHeight: 20,
                          style: TextStyle(
                              color: textInsideFieldColor,
                              letterSpacing: _passwordSpacing),
                          obscureText: _isPasswordHiden,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: labelColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: activeColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: inactiveColor),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHiden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: activeColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHiden = !_isPasswordHiden;
                                  _passwordSpacing = _isPasswordHiden ? 10 : 0;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: [
                              Text(
                                'By selecting Sign up below, I agree to ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: alternativeTextColor,
                                    fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  //Handles go to Terms of Service action
                                },
                                child:
                                  Text(
                                    'Terms of Service ',
                                    style: TextStyle(
                                        color: activeColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: activeColor),
                                  ),
                              ),
                              Text(
                                'and ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: alternativeTextColor,
                                    fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                  //Handles go to Log In action
                                },
                                child:
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        color: activeColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: activeColor),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 1.5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 82,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle login action

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: activeColor,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Sign Up',
                                  style: TextStyle(color: textInsideButtonColor)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 1.5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () {
                                // Handle continue with Google action
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('or using ',
                                          style: TextStyle(
                                              color: alternativeTextColor,
                                              fontSize: 16)),
                                      Image.asset(
                                        "lib/presentation/images/google_icon.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 2,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(color: alternativeTextColor),
                                  overflow: TextOverflow.fade,
                                ),
                                InkWell(
                                  onTap: () {
                                    //Navigator.of(context).pop();
                                    //Handles go to Log In action
                                    //showDialog(
                                    //  context: context,
                                    //  builder: (context) {
                                    //    return LoginDialog(authRepository: authRepository,);
                                    //  },
                                    //);
                                  },
                                  child: Text('Log In',
                                      style: TextStyle(
                                          color: activeColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeColor)),
                                ),
                              ],
                            )
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      ],
      ),
    );
  }
}