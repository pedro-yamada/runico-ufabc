import 'package:flutter/material.dart';

class Menu {
  final DateTime date;
  final String almocoCarne;
  final String almocoVeg;
  final String almocoSalada;

  final String jantaCarne;
  final String jantaVeg;
  final String jantaSalada;

  const Menu({
    required this.date,
    required this.almocoCarne,
    required this.almocoVeg,
    required this.almocoSalada,
    required this.jantaCarne,
    required this.jantaVeg,
    required this.jantaSalada
  });
}
