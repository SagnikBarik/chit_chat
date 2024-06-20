import 'package:chit_chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:chit_chat/components/my_button.dart';
import 'package:chit_chat/components/my_textField.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) {
    final auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        auth.registerWithEmailPassword(
          _emailController.text,
          _passwordController.text,
          _usernameController.text,
        );
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
        builder: (context) => const AlertDialog(
          title: Text("Passwords dont match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.chat,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Let Create an Account!",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              MyTextField(
                hintText: "Username",
                controller: _usernameController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Email",
                controller: _emailController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Password",
                isObsecured: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              MyTextField(
                hintText: "Confirm Password",
                isObsecured: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 20),
              MyButton(
                text: "Register",
                onTap: () => register(context),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
