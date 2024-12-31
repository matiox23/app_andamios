import 'package:app_andamios/presentation/pages/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String text; // Parámetro para el texto del botón

  const ButtonLogin({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color.fromARGB(187, 255, 0, 0),
                overlayColor: const Color.fromARGB(255, 55, 54, 54),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )));
  }
}
