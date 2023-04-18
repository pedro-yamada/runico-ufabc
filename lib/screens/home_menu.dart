import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: coresufabc[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              child: const Text('28/02\nSEG'))
        ]));
  }
}
