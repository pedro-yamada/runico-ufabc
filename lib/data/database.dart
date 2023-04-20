import 'user_dao.dart';
import 'menu_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'runico01.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(UserDao.createTableSQL);
    db.execute(MenuDao.createTableSQL);
  }, version: 2);
}