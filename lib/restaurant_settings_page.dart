import 'package:flutter/material.dart';

class RestaurantSettingsPage extends StatefulWidget {
  const RestaurantSettingsPage({super.key});

  @override
  _RestaurantSettingsPageState createState() => _RestaurantSettingsPageState();
}

class _RestaurantSettingsPageState extends State<RestaurantSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  String restaurantName = '';
  String state = '';
  String city = '';

  bool sunday = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;
  bool saturday = false;

  TimeOfDay? openingTime;
  TimeOfDay? closingTime;
  int tables = 0;
  int maxPeoplePerReservation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações do Restaurante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 10),
              const Text(
                'Informações Básicas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome do Restaurante',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.red, fontSize: 16), // Cor do texto e tamanho da fonte
                onChanged: (value) {
                  setState(() {
                    restaurantName = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.red, fontSize: 16), // Cor do texto e tamanho da fonte
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.red, fontSize: 16), // Cor do texto e tamanho da fonte
                onChanged: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Configurações de Reserva',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('Domingo'),
                value: sunday,
                onChanged: (value) {
                  setState(() {
                    sunday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Segunda-feira'),
                value: monday,
                onChanged: (value) {
                  setState(() {
                    monday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Terça-feira'),
                value: tuesday,
                onChanged: (value) {
                  setState(() {
                    tuesday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Quarta-feira'),
                value: wednesday,
                onChanged: (value) {
                  setState(() {
                    wednesday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Quinta-feira'),
                value: thursday,
                onChanged: (value) {
                  setState(() {
                    thursday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Sexta-feira'),
                value: friday,
                onChanged: (value) {
                  setState(() {
                    friday = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Sábado'),
                value: saturday,
                onChanged: (value) {
                  setState(() {
                    saturday = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text('Hora de Abertura'),
                trailing: Text(openingTime != null ? openingTime!.format(context) : 'Selecione'),
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null && picked != openingTime) {
                    setState(() {
                      openingTime = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: const Text('Hora de Fechamento'),
                trailing: Text(closingTime != null ? closingTime!.format(context) : 'Selecione'),
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null && picked != closingTime) {
                    setState(() {
                      closingTime = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantidade de Mesas',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.red, fontSize: 16), // Cor do texto e tamanho da fonte
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    tables = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantidade Máxima de Pessoas por Reserva',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(color: Colors.red, fontSize: 16), // Cor do texto e tamanho da fonte
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    maxPeoplePerReservation = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), backgroundColor: Colors.white, // Cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ),
                  minimumSize: const Size(double.infinity, 50), // Tamanho do botão
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Salvar as configurações
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Configurações salvas com sucesso!')),
                    );
                  }
                },
                child: const Text('Salvar Configurações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
