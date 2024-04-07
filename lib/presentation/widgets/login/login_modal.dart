import "package:flutter/material.dart";

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.15),
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ),
          TextField(
            cursorColor: Color(0xFFE625A7),
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE625A7)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 105, 21, 77)),
              ),
            ),
          ),
          TextField(
            cursorColor: Color(0xFFE625A7),
            style: TextStyle(color: Colors.white),
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE625A7)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 105, 21, 77)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                // Handle forgot password action
              },
              child: Text(
                'Forgot your passwords?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFFE625A7),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFE625A7)),
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
                backgroundColor: Color(0xFFE625A7),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Log In', style: TextStyle(color: Colors.white)),
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
                      style: TextStyle(color: Colors.grey)),
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
                    style: TextStyle(color: Colors.grey)),
                Text('Sign Up',
                    style: TextStyle(
                        color: Color(0xFFE625A7),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFE625A7))),
              ],
            ))
      ],
    );
  }
}
