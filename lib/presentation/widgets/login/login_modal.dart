import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: modalBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Image.asset(
        "lib/presentation/images/PerfectPickName.png",
        width: 200,
        height: 50,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Hi!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: modalTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ),
          TextField(
            cursorColor: activeColor,
            style: TextStyle(color: textInsideFieldColor),
            decoration: InputDecoration(
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
          TextField(
            cursorColor: activeColor,
            style: TextStyle(color: textInsideFieldColor),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: labelColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: activeColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: inactiveColor),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
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
          ),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            height: 50,
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
        TextButton(
          onPressed: () {
            // Handle continue with Google action
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('or continue with ',
                      style: TextStyle(color: alternativeTextColor)),
                  Image.asset(
                    "lib/presentation/images/google_icon.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text('Don\'t have an account? ',
                    style: TextStyle(color: alternativeTextColor)),
                Text('Sign Up',
                    style: TextStyle(
                        color: activeColor,
                        decoration: TextDecoration.underline,
                        decorationColor: activeColor)),
              ],
            ))
      ],
    );
  }
}
