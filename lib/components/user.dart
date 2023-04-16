import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String userType;
  int creditCount;

  User({
    required this.name,
    required this.email,
    required this.userType,   // 'Aluno' ou 'Externo'
    required this.creditCount,
  });
}

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
  void addCredits(int credits) {
    if (user?.creditCount != null){
      user?.creditCount += credits;
    }
    notifyListeners();
  }
}
