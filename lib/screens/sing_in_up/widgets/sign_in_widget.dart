import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/data/services/my_firebase_auth.dart';
import 'package:persona_application/widgets/login_text_field.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  bool isPass = true;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  void passPress() {
    setState(() {
      isPass = !isPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 70, bottom: 40),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTextField(
              name: 'Email',
              keyType: TextInputType.emailAddress,
              icons: CupertinoIcons.at,
              valueController: emailController,
              validator: (value) {
                if (value!.trim().isEmpty || value.trim() == "") {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 22),
            LoginTextFieldPass(
              name: 'Password',
              keyType: TextInputType.text,
              icons: CupertinoIcons.lock,
              valueController: passController,
              fun: passPress,
              isPass: isPass,
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Text(
                "Forgot passcode?",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  MyFireBaseAuth().signInEmailandPassword(
                      emailController.text.trim(),
                      passController.text,
                      context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
              ),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
