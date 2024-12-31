import 'package:app_andamios/constants/colors.dart';
import 'package:app_andamios/presentation/widgets/drop_down_menu_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class RegistroAlquiler extends StatefulWidget {
  const RegistroAlquiler({super.key});

  @override
  State<RegistroAlquiler> createState() => _RegistroAlquilerState();
}

class _RegistroAlquilerState extends State<RegistroAlquiler> {
  final TextEditingController _dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 590,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 225, 224, 224).withOpacity(0.2),
              blurRadius: 10, // Define cuánto se difumina la sombra.
              offset: const Offset(0,
                  3)) // 0: No hay desplazamiento horizontal (la sombra está centrada horizontalmente debajo del widget).
          //3: La sombra está desplazada 3 píxeles hacia abajo en el eje vertical.
        ],
        color: const Color.fromARGB(31, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese un nombre';
                            }
                            // Validar que solo tenga letras y espacios
                            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return 'Solo se permite texto';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 17, 0),
                              ),
                            ),
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 163, 163, 162)),
                            hintText: 'Nombre del Cliente',
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Cliente',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese la fecha';
                            }
                            return null;
                          },
                          onTap: _selectDate,
                          controller: _dateController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 17, 0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            prefixIcon: Icon(Icons.calendar_month),
                            hintStyle: TextStyle(fontSize: 14),
                            filled: true,
                            hintText: 'Fecha',
                            labelText: 'Fecha',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese la Dirección';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 0),
                            )),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 17, 0),
                            )),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 163, 163, 162)),
                            hintText: 'Dirección',
                            prefixIcon: Icon(Icons.store_outlined),
                            labelText: 'Dirección',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 350,
                      width: 600,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 225, 224, 224)
                                    .withOpacity(0.2),
                                blurRadius:
                                    10, // Define cuánto se difumina la sombra.
                                offset: const Offset(0, 3))
                          ],
                          color: const Color.fromARGB(31, 241, 238, 238),
                          borderRadius: BorderRadius.circular(20),
                          border: const Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 2.00),
                              left: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(color: Colors.black),
                              right: BorderSide(
                                color: Colors.black,
                              ))),
                      child: Column(
                        children: [
                          const DropDownMenuProducts(),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Ingrese la cantidad";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                      filled: true,
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            width: 1.0),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.hintColor),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      hintText: 'Cantidad',
                                      prefixIcon: Icon(
                                          Icons.production_quantity_limits),
                                      labelText: 'Cantidad',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ingrese los días";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  cursorColor: Colors.grey,
                                  decoration: const InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.hintColor),
                                    hintText: 'Días',
                                    labelStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(Icons.calendar_month),
                                    labelText: 'Días',
                                  ),
                                )),
                              ],
                            ),
                          ),
                          const Gap(10),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ingrese el precio";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: const InputDecoration(
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.hintColor),
                                    hintText: 'Precio',
                                    prefixIcon: Icon(Icons.monetization_on),
                                    labelText: 'S/. Precio',
                                  ),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Ingrese la cantidad";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: const InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.hintColor),
                                    hintText: 'Importe',
                                    prefixIcon: Icon(Icons.monetization_on),
                                    labelText: 'Importe',
                                  ),
                                ))
                              ],
                            ),
                          ),
                          const Gap(10),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontSize: 14),
                                    hintText: 'Total',
                                    prefixIcon:
                                        Icon(Icons.monetization_on_sharp),
                                    labelText: 'Total',
                                  ),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  width: 20,
                                  child: TextButton(
                                      style: ButtonStyle(
                                        shape: WidgetStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        overlayColor: WidgetStateProperty.all(
                                            const Color.fromARGB(
                                                255, 248, 146, 146)),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                AppColors.btnPrincipal),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Procesando datos')),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        "Agregar",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      )),
                                ))
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //Seleccionar Fecha
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
