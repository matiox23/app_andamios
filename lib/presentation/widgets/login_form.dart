import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 180,
            color: const Color.fromARGB(255, 221, 220, 220),
            child: Image.asset(
              "assets/mg_logo_main.png",
              scale: 3,
            ),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "Bienvenido a ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "MG ",
                        style:
                            TextStyle(color: Color.fromARGB(187, 255, 0, 0))),
                    TextSpan(text: "SOLUTECH")
                  ])),
          // const Padding(padding: EdgeInsets.all(15))
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.00, color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.00, color: Colors.red)),
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                        prefixIcon: Icon(
                          Icons.person,
                          // Cambia dinámicamente el color del ícono
                        ), //Texto cuando no esta seleccionado
                        labelText: "Nombre de Usuario",
                        hintText: "Tu Nombre de Usuario",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 219, 217, 217),
                        ),
                        enabledBorder: OutlineInputBorder(
                            // Borde cuando no está enfocado
                            borderSide: BorderSide(width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            // Borde cuando está enfocado
                            borderSide: BorderSide(
                          color: Colors.grey, // Color por defecto

                          width: 2.0,
                        ))
                        // enabledBorder:

                        ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese su nombre de Usuario";
                      }
                      return null;
                    },
                  ),
                  const Gap(40),
                  TextFormField(
                    cursorColor: Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingresa tu contraseña";
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                        focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.00,
                        )),
                        errorBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.00, color: Colors.red)),
                        labelText: "Contraseña",
                        hintText: "Tu Contraseña",
                        labelStyle: const TextStyle(color: Colors.black),
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 219, 217, 217),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                          color: Colors.grey, // El color del ícono es fijo

                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        )),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.0,
                        ))),
                  ),
                  const Gap(30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color.fromARGB(187, 255, 0, 0),
                        overlayColor: const Color.fromARGB(255, 55, 54, 54),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          /// do something
                        }
                      },
                      child: const Text(
                        "Ingesar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
