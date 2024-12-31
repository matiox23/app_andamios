import 'package:app_andamios/constants/colors.dart';
import 'package:app_andamios/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColors.btnPrincipal,
          ),
        ),
        title: const Text(
          "Registrame",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: AppColors.btnPrincipal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
              height: 180,
              color: AppColors.bgLogin,
              child: Image.asset(
                "assets/MG_LOGO.png",
                scale: 3,
              )),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingresa el nombre de Usuario";
                        }
                        if (value.length < 6) {
                          return "El nombre de usuario debe tener al menos 6 caracteres";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.00)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 17, 0),
                                  width: 2.00)),
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.00)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.00),
                          ),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 219, 217, 217)),
                          labelText: "Nombre de Usuario",
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Tu nombre de Usuario"),
                    ),
                    const Gap(20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingresa tu Correo Electronico";
                        }
                        String pattern =
                            r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                        RegExp regex = RegExp(pattern);

                        if (!regex.hasMatch(value)) {
                          return "Por favor, ingresa un correo válido";
                        }

                        if (!value.contains('.com') || !value.contains('@')) {
                          return "Por favor, ingresa un correo válido";
                        }

                        return null;
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2.00,
                                  color: Color.fromARGB(255, 255, 17, 0))),
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2.00,
                          )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            width: 2.00,
                          )),
                          hintText: "Tu Correo Electronico",
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 219, 217, 217)),
                          labelText: "Correo Electronico",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.00))),
                    ),
                    const Gap(20),
                    TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ingresa tu Contraseña";
                          }

                          if (value.length < 6) {
                            return "La contraseña debe tener al menos 6 caracteres";
                          }
                          return null;
                        },
                        obscureText: !_isPasswordVisible,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2.00,
                                    color: Color.fromARGB(255, 255, 17, 0))),
                            hintText: "Tu Contraseña",
                            labelText: "Contraseña",
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 219, 217, 217)),
                            labelStyle: const TextStyle(color: Colors.black),
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
                            focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.00)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.00)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 2.00)))),
                    const Gap(20),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.btnPrincipal,
                              ), // Indicador de carga
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor:
                                    const Color.fromARGB(187, 255, 0, 0),
                                overlayColor:
                                    const Color.fromARGB(255, 55, 54, 54),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _handleLogin();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const Home()),
                                  // );
                                }
                              },
                              child: const Text(
                                "Ingesar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  void _handleLogin() {
    setState(() {
      _isLoading = true; // Activa el estado de carga
    });

    // Simula un retraso para representar una acción como una llamada a la API
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Finaliza el estado de carga
      });

      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                    "¡Registro Exitoso!",
                    style: TextStyle(color: AppColors.messageGood),
                    textAlign: TextAlign.center,
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: AppColors.messageGood,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      // const SizedBox(height: 20),
                      // const Text(
                      //   "¡Registro Exitoso!",
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //       color: AppColors.messageGood),
                      // )
                    ],
                  ),
                  actions: [
                    Row(
                      //Centra el boton
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              overlayColor: Colors.black54,
                              backgroundColor:
                                  const Color.fromARGB(255, 241, 234, 234)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Aceptar",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
      }

      // Muestra el SnackBar con el mensaje de éxito
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Inicio de sesión exitoso')),
      // );

      // Espera 1 segundo para que el SnackBar sea visible antes de navegar
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          // Verifica que el widget aún está montado
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const HomePage()),
          );
        }
      });
    });
  }
}

// Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Form(
//                 child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: "Nombre",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                     const Gap(30),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: "Nombre",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Gap(30),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: "Nombre",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                     const Gap(30),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(
//                           labelText: "Nombre",
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Campo 1: Nombre
//               ],
//             )),
//           )
