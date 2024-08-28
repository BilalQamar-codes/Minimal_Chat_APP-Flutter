import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/textfield.dart';

class LoginSignup extends StatelessWidget {
  LoginSignup({super.key, required this.onTap});

  final TextEditingController emController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final void Function()? onTap;
  final authService = AuthService();
  void login(BuildContext context) async {
    try {
      await authService.signInWithPaswordandEmail(
          emController.text, pwController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.message,
              size: 130,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Welcome to my Chat Application.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextfield(
              hintText: "Email",
              obsecuretext: false,
              controller: emController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: "Password",
              obsecuretext: true,
              controller: pwController,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              btnText: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
