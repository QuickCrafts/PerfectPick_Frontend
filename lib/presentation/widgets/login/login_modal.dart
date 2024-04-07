import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";

class LoginDialog extends StatefulWidget {
  @override
  LoginDialogState createState() => LoginDialogState();
}

class LoginDialogState extends State<LoginDialog> {
  bool _isPasswordHiden = true;
  double _passwordSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: modalBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 340,
        height: 533,
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
                      Text('Hi!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: modalTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
                      SizedBox(height: 8),
                      TextField(
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
                      TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: Text(
                          'Forgot your password?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: activeColor,
                              decoration: TextDecoration.underline,
                              decorationColor: activeColor),
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
                            child: Text('Log In',
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
                          height: 60,
                          child: TextButton(
                            onPressed: () {
                              // Handle continue with Google action
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
                        child: TextButton(
                            onPressed: () {},
                            child: Wrap(
                              children: [
                                Text(
                                  'Don\'t have an account? ',
                                  style: TextStyle(color: alternativeTextColor),
                                  overflow: TextOverflow.fade,
                                ),
                                Text('Sign Up',
                                    style: TextStyle(
                                        color: activeColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: activeColor)),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
