import 'package:runico_ufabc/components/menu.dart';
import 'package:runico_ufabc/data/database.dart';
import 'package:sqflite/sqflite.dart';

class MenuDao {
  static String createTableSQL = 'CREATE TABLE $_tablename('
      '$_date TEXT PRIMARY KEY,'
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

  Future<void> insertMenuList(List<Menu> menuList) async {
    final Database database = await getDatabase();
    final batch = database.batch();

    for (final menu in menuList) {
      batch.insert(
        MenuDao._tablename,
        toMap(menu),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  Map<String, dynamic> toMap(Menu menu) {
    print('Convertendo Menu em Map');

    final Map<String, dynamic> MenuMap = {};

    MenuMap[_date] = (menu.date).toString();
    MenuMap[_almocoCarne] = menu.almocoCarne;
    MenuMap[_almocoVeg] = menu.almocoVeg;
    MenuMap[_almocoSalada] = menu.almocoSalada;
    MenuMap[_jantaCarne] = menu.jantaCarne;
    MenuMap[_jantaVeg] = menu.jantaVeg;
    MenuMap[_jantaSalada] = menu.jantaSalada;

    return MenuMap;
  }

  Future<Menu> find(String menuDate) async {
    print('Acessando find para cardapio');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tablename, where: '$_date = ?', whereArgs: [menuDate]);
    print('Cardapio encontrado: $result');
    List<Menu> listResult = toList(result);
    Menu finalResult = listResult[0];
    return finalResult;
  }

  List<Menu> toList(List<Map<String, dynamic>> menuMap) {
    print('convertendo toList :');
    final List<Menu> menus = [];
    for (Map<String, dynamic> linha in menuMap) {
      final Menu menu = Menu(
          date: DateTime.parse(linha[_date]),
          almocoCarne: linha[_almocoCarne],
          almocoVeg: linha[_almocoVeg],
          almocoSalada: linha[_almocoSalada],
          jantaCarne: linha[_jantaCarne],
          jantaVeg: linha[_jantaVeg],
          jantaSalada: linha[_jantaSalada]);
      menus.add(menu);
    }
    print('Lista de Cardapios $menus');
    return menus;
  }

  beginInitialMenu() {
    final List<Menu> listMenus = [
      Menu(
        date: DateTime(2023, 04, 22),
        almocoCarne: 'Bife acebolado',
        almocoVeg: 'Estrogonofe de palmito',
        almocoSalada: 'Mix de folhas verdes',
        jantaCarne: 'Frango grelhado',
        jantaVeg: 'Escondidinho de cogumelos',
        jantaSalada: 'Salada de tomate e pepino',
      ),
      Menu(
        date: DateTime(2023, 04, 23),
        almocoCarne: 'Strogonoff de carne',
        almocoVeg: 'Lasanha de berinjela',
        almocoSalada: 'Salada de grão-de-bico',
        jantaCarne: 'Filé de peixe grelhado',
        jantaVeg: 'Arroz integral com legumes',
        jantaSalada: 'Salada de rúcula e tomate seco',
      ),
      Menu(
        date: DateTime(2023, 04, 24),
        almocoCarne: 'Feijoada',
        almocoVeg: 'Hambúrguer de lentilha',
        almocoSalada: 'Salada de alface e tomate',
        jantaCarne: 'Espetinho de frango',
        jantaVeg: 'Arroz com lentilha',
        jantaSalada: 'Salada de beterraba',
      ),
      Menu(
        date: DateTime(2023, 4, 25),
        almocoCarne: 'Arroz, feijão, bife acebolado, batata frita',
        almocoVeg: 'Arroz, feijão, omelete de espinafre',
        almocoSalada: 'Alface, tomate, cenoura, beterraba',
        jantaCarne: 'Lasanha de carne, salada de alface',
        jantaVeg: 'Lasanha de berinjela, salada de alface',
        jantaSalada: 'Alface, tomate, rúcula',
      ),
      Menu(
        date: DateTime(2023, 4, 26),
        almocoCarne: 'Arroz, feijão, frango grelhado, purê de batata',
        almocoVeg: 'Arroz, feijão, escondidinho de cogumelos',
        almocoSalada: 'Repolho, cenoura, pepino, tomate',
        jantaCarne: 'Hambúrguer de carne, batata frita',
        jantaVeg: 'Hambúrguer de grão-de-bico, batata frita',
        jantaSalada: 'Repolho, cenoura, pepino, tomate',
      ),
      Menu(
        date: DateTime(2023, 4, 27),
        almocoCarne: 'Arroz, feijão, estrogonofe de carne, batata palha',
        almocoVeg: 'Arroz, feijão, estrogonofe de cogumelos, batata palha',
        almocoSalada: 'Alface, couve, tomate, beterraba',
        jantaCarne: 'Pizza de mussarela, salada de alface',
        jantaVeg: 'Pizza de cogumelos, salada de alface',
        jantaSalada: 'Alface, tomate, rúcula',
      ),
      Menu(
        date: DateTime(2023, 4, 28),
        almocoCarne: 'Arroz, feijão, bife a milanesa, fritas',
        almocoVeg:
            'Arroz, feijão, quibe de abóbora com queijo, legumes cozidos',
        almocoSalada: 'Beterraba, couve, alface, tomate',
        jantaCarne: 'Macarrão à carbonara, salada de alface',
        jantaVeg: 'Macarrão com molho branco, salada de alface',
        jantaSalada: 'Alface, tomate, rúcula',
      ),
      Menu(
          date: DateTime(2023, 4, 29),
          almocoCarne: 'Frango Assado',
          almocoVeg: 'Berinjela Grelhada',
          almocoSalada: 'Salada Mista',
          jantaCarne: 'Sopa de Legumes com Carne',
          jantaVeg: 'Sopa de Legumes',
          jantaSalada: 'Salada de Tomate'),
      Menu(
          date: DateTime(2023, 4, 30),
          almocoCarne: 'Costela com Batatas',
          almocoVeg: 'Grão-de-bico Refogado',
          almocoSalada: 'Salada de Folhas Verdes',
          jantaCarne: 'Strogonoff de Carne',
          jantaVeg: 'Strogonoff de Cogumelos',
          jantaSalada: 'Salada de Alface e Cenoura'),
      Menu(
          date: DateTime(2023, 5, 1),
          almocoCarne: 'Peixe Grelhado com Legumes',
          almocoVeg: 'Escondidinho de Grão-de-bico',
          almocoSalada: 'Salada de Cenoura Ralada',
          jantaCarne: 'Arroz com Carne Moída',
          jantaVeg: 'Arroz com Lentilha',
          jantaSalada: 'Salada de Beterraba'),
      Menu(
          date: DateTime(2023, 5, 2),
          almocoCarne: 'Bife à Parmegiana',
          almocoVeg: 'Ratatouille',
          almocoSalada: 'Salada de Tomate e Pepino',
          jantaCarne: 'Hambúrguer com Fritas',
          jantaVeg: 'Hambúrguer de Grão-de-bico',
          jantaSalada: 'Salada de Repolho'),
      Menu(
          date: DateTime(2023, 5, 3),
          almocoCarne: 'Frango à Milanesa',
          almocoVeg: 'Quibe de Abóbora',
          almocoSalada: 'Salada de Alface e Tomate',
          jantaCarne: 'Macarrão com Carne Moída',
          jantaVeg: 'Macarrão com Brócolis',
          jantaSalada: 'Salada de Rúcula'),
      Menu(
          date: DateTime(2023, 5, 4),
          almocoCarne: 'Carne Assada com Batatas',
          almocoVeg: 'Cuscuz Marroquino',
          almocoSalada: 'Salada de Cenoura e Beterraba',
          jantaCarne: 'Pizza de Calabresa',
          jantaVeg: 'Pizza de Muçarela',
          jantaSalada: 'Salada de Folhas Verdes'),
      Menu(
          date: DateTime(2023, 5, 5),
          almocoCarne: 'Feijoada',
          almocoVeg: 'Feijoada Vegetariana',
          almocoSalada: 'Couve Refogada',
          jantaCarne: 'Sanduíche de Carne Assada',
          jantaVeg: 'Bolinho de espinafre',
          jantaSalada: 'Tabule')
    ];
    insertMenuList(listMenus);
  }
}
