import 'package:runico_ufabc/data/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:runico_ufabc/components/user.dart';

class UserDao {
  static String createTableSQL = 'CREATE TABLE $_tablename ('
      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_userType TEXT, '
      '$_creditCount INTEGER)';

  static const String _tablename = 'user_table';
  static const String _id = 'user_id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _userType = 'user_type';
  static const String _creditCount = 'credit_count';

  save(User user) async {
    print('Logando Usuario no banco');
    final Database database = await getDatabase();
    var itemExists = await find(user.email);
    Map<String, dynamic> userMap = toMap(user);
    if (itemExists.isEmpty) {
      print('O usuario não existia!');
      return await database.insert(_tablename, userMap);
    } else {
      print('O usuario já existia!');
    }
  }

  update(User user) async {
    final Database database = await getDatabase();
    var itemExists = await find(user.email);
    Map<String, dynamic> userMap = toMap(user);
    if (itemExists.isEmpty) {
      print('O usuario não existia!');
    } else {
      database.update(_tablename, toMap(user),
          where: '$_email = ?', whereArgs: [user.email]);
    }
  }

  Map<String, dynamic> toMap(User user) {
    print('Convertendo User em Map');

    final Map<String, dynamic> userMap = Map();

    userMap[_name] = user.name;
    userMap[_email] = user.email;
    userMap[_userType] = user.userType;
    userMap[_creditCount] = user.creditCount;

    return userMap;
  }

  Future<List<User>> find(String userEmail) async {
    print('Acessando find');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_email = ?', whereArgs: [userEmail]);
    print('Usuario Encontrado: id:$_id, nome:$_name, email:$_email');
    return toList(result);
  }

  delete(String userEmail) async {
    print('Deletando usuario de email: $userEmail');
    final Database database = await getDatabase();
    return database
        .delete(_tablename, where: '$_email = ?', whereArgs: [userEmail]);
  }

  List<User> toList(List<Map<String, dynamic>> mapaDeUsuario) {
    print('convertendo toList :');
    final List<User> users = [];
    for (Map<String, dynamic> linha in mapaDeUsuario) {
      final User user = User(name: linha[_name], email: linha[_email], userType: linha[_userType], creditCount: linha[_creditCount]);
      users.add(user);
    }
    print('Lista de Usuarios $users');
    return users;
  }
}
