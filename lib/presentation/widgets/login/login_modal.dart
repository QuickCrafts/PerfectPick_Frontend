import "dart:ui";
import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";
import "package:perfectpick_wa/presentation/widgets/login/forgot_password_modal.dart";
import 'package:perfectpick_wa/presentation/widgets/signUp/signup_modal.dart';

class LoginDialog extends StatefulWidget {
  final AuthRepository authRepository;

  const LoginDialog({Key? key, required this.authRepository}) : super(key: key);

  @override
  LoginDialogState createState() => LoginDialogState();
}

class LoginDialogState extends State<LoginDialog> {
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
            height: 533,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340,
              height: 533,
              decoration: BoxDecoration(
                color: modalBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height:
                          12), // Added padding to the top of the dialog (16 pixels
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
                            Text('Hi!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: modalTitleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            SizedBox(height: 8),
                            TextField(
                              controller: loginEmailDataController,
                              cursorColor: activeColor,
                              cursorHeight: 20,
                              style: TextStyle(color: textInsideFieldColor),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4),
                                labelText: 'Email',
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
                              controller: loginPasswordDataController,
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
                                      _passwordSpacing =
                                          _isPasswordHiden ? 10 : 0;
                                    });
                                  },
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Handle forgot password action
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ForgotPasswordDialog( authRepository: widget.authRepository,);
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Forgot your password?',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: activeColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: activeColor),
                                ),
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
                                  onPressed: () async {
                                    // Handle login action
                                    String email =
                                        loginEmailDataController.text;
                                    String password =
                                        loginPasswordDataController.text;
                                    try {
                                      String token = await widget.authRepository
                                          .emailLogin(email, password);
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text('Success'),
                                                content: Text('Token: $token'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                                      Navigator.of(context)
                                                          .pop();
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
                                  child: Text('Log In',
                                      style: TextStyle(
                                          color: textInsideButtonColor)),
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
                                  onPressed: () async {
                                    try {
                                      String link = await widget.authRepository
                                          .googleLogin();
                                      try {
                                        launchAuxiliarURL(link);
                                      } catch (e) {
                                        print(e);
                                      }
                                    } catch (e) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text('Error'),
                                                content: Text('Error: $e'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Close'),
                                                  ),
                                                ],
                                              ));
                                      print(e);
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text('or continue with ',
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
                              height: Checkbox.width * 3,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Don\'t have an account? ',
                                    style:
                                        TextStyle(color: alternativeTextColor),
                                    overflow: TextOverflow.fade,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      // Handles go to Sign Up action
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SignUpDialog(authRepository: widget.authRepository);
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: activeColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeColor),
                                    ),
                                  ),
                                ],
                              ),
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