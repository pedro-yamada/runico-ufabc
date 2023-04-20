import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:intl/intl.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}
class _MenuScreenState extends State<MenuScreen> {
  DateTime? _selectedDate;

  Future <void> _selectDate(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
    );

    if (newSelectedDate != null) {
      setState(() {
        _selectedDate = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Pratos de Hoje',
            style: TextStyle(
              color: coresufabc,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          SizedBox(height: 30),
          const Text(
            'Almoço',
            style: TextStyle(
              color: coresufabc,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Text(
            'Carne em cubos\nOpção sem carne:  Almôndegas de PTS ao sugo\nAcelga refogada',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: coresufabc,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          const Text(
            'Jantar',
            style: TextStyle(
              color: coresufabc,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const Text(
            'Filé de frango ao Molho de Laranja',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: coresufabc,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 40),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: coresufabc[700],
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                _selectedDate != null
                    ? DateFormat('dd/MM\nEEE').format(_selectedDate!)
                    : 'Selecione uma data',
              ),
            ),
          ),
        ],
      ),
    );
  }
}