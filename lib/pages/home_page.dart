// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _authController =
      Get.find(); // Obtener el controlador de autenticación
  int _selectedIndex = 0;

  // Lista de las cuatro páginas
  final List<Widget> _pages = [
    Page2(),
    Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              _authController.signOut(); // Llamar al método de cerrar sesión
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Mostrar la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Página 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Página 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Página 4',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).primaryColor, // Color cuando está seleccionado
        unselectedItemColor: Colors.grey, // Color cuando no está seleccionado
        onTap: _onItemTapped,
      ),
    );
  }
}

// Ejemplo de las páginas

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página 3'),
    );
  }
}