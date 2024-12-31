import 'package:flutter/material.dart';

class AlquilerLista extends StatefulWidget {
  const AlquilerLista({super.key});

  @override
  State<AlquilerLista> createState() => _AlquilerListaState();
}

class _AlquilerListaState extends State<AlquilerLista> {
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
    );
  }
}
