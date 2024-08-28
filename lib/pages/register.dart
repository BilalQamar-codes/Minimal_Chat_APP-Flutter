import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/services/auth/auth_service.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/textfield.dart';

class Register extends StatelessWidget {
  final TextEditingController emController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmpwController = TextEditingController();
  final Function()? onTap;
  final authService = AuthService();
  void register(BuildContext context) async {
    if (pwController.text == confirmpwController.text) {
      try {
        await authService.signUpWithPaswordandEmail(
            emController.text, pwController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords do not match."),
        ),
      );
    }
  }

  Register({super.key, required this.onTap});
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
              size: 70,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Let's create an account fo you.",
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
              height: 10,
            ),
            MyTextfield(
              hintText: "Confirm Password",
              obsecuretext: true,
              controller: confirmpwController,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              btnText: "Register",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    "Login now",
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
