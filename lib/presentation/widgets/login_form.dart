import 'package:app_andamios/constants/colors.dart';
import 'package:app_andamios/presentation/widgets/button.dart';
import 'package:app_andamios/presentation/widgets/forgot_password_button.dart';
import 'package:app_andamios/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            height: 180,
            color: AppColors.bgLogin,
            child: Image.asset(
              "assets/MG_LOGO.png",
              scale: 3,
            ),
          ),

          Transform.translate(
            offset: const Offset(
                0, -35), // Desplaza el Container 20 píxeles hacia arriba
            child: Container(
              height: 20, // Altura ajustada
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7FD), // Rosa claro personalizado
                // Color extraído de la imagen
                // Color del fondo
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      50), // Redondear esquina superior izquierda
                  topRight:
                      Radius.circular(50), // Redondear esquina superior derecha
                ),
              ),
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
                        style: TextStyle(
                            color: AppColors.btnPrincipal,
                            fontWeight: FontWeight.bold)),
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
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2.00,
                                color: Color.fromARGB(255, 255, 17, 0))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.00,
                        )),
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
                            borderSide: BorderSide(
                                width: 2.00,
                                color: Color.fromARGB(255, 255, 17, 0))),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                  ),
                  const ButtonLogin(text: "Registrame"),
                  const Gap(20),
                  const ForgotPassword()
                ],
              ),
            ),
          ),
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

      // Muestra el SnackBar con el mensaje de éxito
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text(
                    style: TextStyle(
                        color: Color.fromARGB(207, 25, 164, 48),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    "Bienvenido",
                    textAlign: TextAlign.center,
                  ),
                  content: const Text(
                    "Has iniciado sesión correctamente",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: const Color.fromARGB(255, 79, 78, 78),
                          ),
                          onPressed: () {
                            // _formKey.currentState
                            //     ?.reset(); // Limpia los campos del formulario

                            Navigator.of(context).pop();
                          },
                          child: const Text("Aceptar",
                              style: TextStyle(
                                color: Color.fromARGB(137, 0, 0, 0),
                              )),
                        ),
                      ],
                    )
                  ],
                ));
      }
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
