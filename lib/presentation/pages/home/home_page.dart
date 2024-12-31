import 'package:app_andamios/constants/colors.dart';
import 'package:app_andamios/presentation/pages/alquiler/alquiler_page.dart';
import 'package:app_andamios/presentation/widgets/registro_alquiler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(
        child: ListView(
      children: const [
        Divider(
          height: 10,
        ),
        Text(
          "Registro de Alquiler",
          style: TextStyle(
              color: AppColors.btnPrincipal,
              fontSize: 30,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        RegistroAlquiler()
      ],
    )),
    Center(
        child: ListView(
      children: const [
        Divider(height: 10),
        Center(
            child: Text(
          textAlign: TextAlign.center,
          "Andamios Alquilados",
          style: TextStyle(
              fontSize: 30,
              color: AppColors.btnPrincipal,
              fontWeight: FontWeight.bold),
        )),
        AlquilerPage()
      ],
    )),
    const Center(child: Text('Perfil Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambia el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.btnPrincipal,
          ),
        ),
        centerTitle: true,
        title: const Text('Inicio'),
      ),
      body: _pages.elementAt(_selectedIndex), // Selecciona la página actual
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Alquiler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor:
              AppColors.btnPrincipal, //Selecciona el índice actual y su estado
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
