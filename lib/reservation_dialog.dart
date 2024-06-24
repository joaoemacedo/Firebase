import 'package:flutter/material.dart';
import 'package:flutter_application_1/all_restaurants_page.dart';

class ReservationDialog extends StatefulWidget {
  final Restaurant restaurant;

  const ReservationDialog({super.key, required this.restaurant});

  @override
  _ReservationDialogState createState() => _ReservationDialogState();
}

class _ReservationDialogState extends State<ReservationDialog> {
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  final TextEditingController _observationsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Realizar Reserva em ${widget.restaurant.name}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Data da Reserva',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                          ),
                          const Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Horário da Reserva',
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_selectedTime.hour}:${_selectedTime.minute}',
                          ),
                          const Icon(Icons.access_time),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 3,
              controller: _observationsController,
              decoration: const InputDecoration(
                labelText: 'Observações',
                hintText: 'Informe suas preferências...',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o diálogo
          },
          style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ), // Tamanho do botão
                ),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            // Mostrar diálogo de confirmação com os dados preenchidos
            showDialog(
              context: context,
              builder: (context) => ConfirmationDialog(
                restaurant: widget.restaurant,
                name: 'Nome do Cliente',
                email: 'cliente@example.com',
                phone: '123456789',
                date: _selectedDate,
                time: _selectedTime,
                observations: _observationsController.text,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ), // Tamanho do botão
                ),
          child: const Text('Reservar'),
        ),
      ],
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final Restaurant restaurant;
  final String name;
  final String email;
  final String phone;
  final DateTime date;
  final TimeOfDay time;
  final String observations;

  const ConfirmationDialog({super.key, 
    required this.restaurant,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.time,
    required this.observations,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmação de Reserva'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Restaurante: ${restaurant.name}'),
            Text('Data: ${date.day}/${date.month}/${date.year}'),
            Text('Horário: ${time.hour}:${time.minute}'),
            Text('Nome: $name'),
            Text('Email: $email'),
            Text('Telefone: $phone'),
            Text('Observações: $observations'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o diálogo de confirmação
            _showReservationSuccessDialog(context);
          },
          style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ), // Tamanho do botão
                ),
          child: const Text('Confirmar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o diálogo de confirmação
          },
          style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ), // Tamanho do botão
                ),
          child: const Text('Editar'),
        ),
      ],
    );
  }

  void _showReservationSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reserva Realizada com Sucesso'),
        content: const Text('Sua reserva foi confirmada.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fechar o diálogo de sucesso
              Navigator.of(context).pop(); // Fechar o diálogo de reserva
            },
            style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF7D0A0A), side: const BorderSide(color: Color(0xFF7D0A0A)), // Borda do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Cantos levemente arredondados
                  ), // Tamanho do botão
                ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
