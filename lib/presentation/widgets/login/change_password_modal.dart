import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";

class ForgotPasswordDialog extends StatefulWidget {


  const ForgotPasswordDialog()  : super();

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordDialog> {
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
      backgroundColor: modalBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 340,
        height: 340,
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
                      Text('Recover Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: modalTitleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          )),
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
                                _passwordSpacing = _isPasswordHiden ? 10 : 0;
                              });
                            },
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
                          height: 36,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Handle Change Password action
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: activeColor,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text('Change Password',
                                style: TextStyle(color: textInsideButtonColor)),
                          ),
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
    );
  }
}


