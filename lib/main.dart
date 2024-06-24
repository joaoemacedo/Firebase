import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/register_page.dart';
import 'package:flutter_application_1/restaurant_home_page.dart';
import 'all_restaurants_page.dart'; // Importe a tela de todos os restaurantes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Reserve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/restaurantHome': (context) => const RestaurantHomePage(restaurantName: 'Nome do Restaurante'),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Reserve'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restaurant_menu),
            onPressed: () {
              // Ação do ícone
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFF7D0A0A), // Cor do texto do botão branco
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                ),
                minimumSize: const Size(200, 50), // Tamanho do botão
              ),
              onPressed: () {
                // Navegar para a tela de todos os restaurantes
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllRestaurantsPage()),
                );
              },
              child: const Text('Fazer Reserva'),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                ),
                minimumSize: const Size(200, 50), // Tamanho do botão
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Seu Restaurante'),
            ),
          ],
        ),
      ),
    );
  }
}
