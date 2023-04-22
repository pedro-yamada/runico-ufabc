import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/components/menu.dart';
import 'package:runico_ufabc/data/menu_dao.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with RestorationMixin {
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());

  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  late Future<Menu?> _selectedMenuFuture;

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime(2023, 5, 5),
          // locale: const Locale('pt', 'BR'),
        );
      },
    );
  }

  @override
  String? get restorationId => 'menu_screen';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        print(_selectedDate.value.toString());
        _selectedMenuFuture = MenuDao().find(_selectedDate.value.toString());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String findString = DateTime(now.year, now.month, now.day).toString();
    _selectedMenuFuture = MenuDao().find(findString);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pratos do dia ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
                style: const TextStyle(
                    color: coresufabc, fontWeight: FontWeight.bold, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              FutureBuilder<Menu?>(
                  future: _selectedMenuFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Erro ao carregar o menu: ${snapshot.error}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final selectedMenu = snapshot.data!;
                      return Column(children: [
                        const Text(
                          'Almoço',
                          style: TextStyle(
                            color: coresufabc,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Opção com carne: ${selectedMenu.almocoCarne}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Opção sem carne: ${selectedMenu.almocoVeg}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Salada:${selectedMenu.almocoSalada}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Jantar',
                          style: TextStyle(
                            color: coresufabc,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Opção com carne: ${selectedMenu.jantaSalada}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Opção sem carne: ${selectedMenu.jantaVeg}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Salada: ${selectedMenu.jantaSalada}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: coresufabc,
                            fontSize: 20,
                          ),
                        ),
                      ]);
                    } else {
                      return const Text('Erro desconhecido');
                    }
                  }),
              const SizedBox(height: 30),
              Builder(
                  builder: (context) => ElevatedButton(
                    child: const Text(
                      'Escolha a data',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () => _restorableDatePickerRouteFuture.present(),
                  )),
              const SizedBox(height: 30)
            ]));
  }
}