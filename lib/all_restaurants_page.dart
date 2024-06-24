import 'package:flutter/material.dart';
import 'reservation_dialog.dart';

class AllRestaurantsPage extends StatelessWidget {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Restaurante A',
      openingDays: 'Seg à Sex',
      openingHours: '11:00 - 22:00',
      imageUrl: 'https://example.com/restaurant_a_image.jpg',
    ),
    Restaurant(
      name: 'Restaurante B',
      openingDays: 'Seg à Sáb',
      openingHours: '12:00 - 23:00',
      imageUrl: 'https://example.com/restaurant_b_image.jpg',
    ),
    // Adicione mais restaurantes conforme necessário
  ];

  AllRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos os Restaurantes'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return _buildRestaurantCard(context, restaurants[index]);
        },
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Restaurant restaurant) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            restaurant.imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'Dias de Funcionamento: ${restaurant.openingDays}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  'Horário de Funcionamento: ${restaurant.openingHours}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                // Exibir o popup de reserva ao clicar no botão "Realizar Reserva"
                showDialog(
                  context: context,
                  builder: (context) => ReservationDialog(restaurant: restaurant),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF7D0A0A), // Cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ),
 // Tamanho do botão
                ),
              child: const Text('Realizar Reserva'),
            ),
          ),
        ],
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String openingDays;
  final String openingHours;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.openingDays,
    required this.openingHours,
    required this.imageUrl,
  });
}
