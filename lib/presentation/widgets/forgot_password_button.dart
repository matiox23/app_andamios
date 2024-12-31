import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text(
          "¿Olvidaste tu Contraseña?",
          style: TextStyle(
              color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
