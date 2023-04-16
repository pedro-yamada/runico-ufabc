import 'package:flutter/cupertino.dart';
import 'package:runico_ufabc/components/menu.dart';
import 'package:runico_ufabc/data/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:runico_ufabc/components/user.dart';

class MenuDao {
  static String createTableSQL = 'CREATE TABLE $_tablename('
      '$_date PRIMARY KEY TEXT,'
      '$_almocoCarne TEXT, '
      '$_almocoVeg TEXT, '
      '$_almocoSalada TEXT, '
      '$_jantaCarne TEXT,'
      '$_jantaVeg TEXT,'
      '$_jantaSalada TEXT)';

  static const String _tablename = 'menuTable';
  static const String _date = 'date';
  static const String _almocoCarne = 'almocoCarne';
  static const String _almocoVeg = 'almocoVeg';
  static const String _almocoSalada = 'almocoSalada';
  static const String _jantaCarne = 'jantaCarne';
  static const String _jantaVeg = 'jantaVeg';
  static const String _jantaSalada = 'jantaSalada';

  // save(User user) async {
  //   print('Logando Usuario no banco');
  //   final Database database = await getDatabase();
  //   var itemExists = await find(user.email);
  //   Map<String, dynamic> userMap = toMap(user);
  //   if (itemExists.isEmpty) {
  //     print('A tarefa não existia!');
  //     return await database.insert(_tablename, userMap);
  //   } else {
  //     print('O usuario já existia!');
  //   }
  // }

  // Map<String, dynamic> toMap(User user) {
  //   print('Convertendo User em Map');
  //
  //   final Map<String, dynamic> userMap = Map();
  //
  //   userMap[_name] = user.name;
  //   userMap[_email] = user.email;
  //   userMap[_userType] = user.userType;
  //   userMap[_creditCount] = user.creditCount;
  //
  //   return userMap;
  // }
  //
  // Future<List<User>> find(String userEmail) async {
  //   print('Acessando find');
  //   final Database database = await getDatabase();
  //   final List<Map<String, dynamic>> result = await database
  //       .query(_tablename, where: '$_email = ?', whereArgs: [userEmail]);
  //   print('Usuario Encontrado: id:$_id, nome:$_name, email:$_email');
  //   return toList(result);
  // }
  //
  // delete(int userid) async {
  //   print('Deletando usuario de id: $userid');
  //   final Database database = await getDatabase();
  //   return database
  //       .delete(_tablename, where: '$_id = ?', whereArgs: [userid]);
  // }
  //
  // List<User> toList(List<Map<String, dynamic>> mapaDeUsuario) {
  //   print('convertendo toList :');
  //   final List<User> users = [];
  //   for (Map<String, dynamic> linha in mapaDeUsuario) {
  //     final User user = User(name: linha[_name], email: linha[_email], userType: linha[_userType], creditCount: linha[_creditCount]);
  //     users.add(user);
  //   }
  //   print('Lista de Usuarios $users');
  //   return users;
  // }
}
