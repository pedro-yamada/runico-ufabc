import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/screens/credits_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const Text('Cardapio',style: optionStyle,),
    Builder(builder: (context) {
      return Stack(
        children: [
          Container(
            color: Color(0xFFFFCC00),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.black, width: 3)),
                  width: 250,
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Quantidade de Créditos:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '12',
                        style: TextStyle(fontSize: 60),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006633),
                  ),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.monetization_on_outlined),
                        Text(
                          'Recarregar',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contextNew) => selecaoCreditos(),
                        ));
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          )
        ],
      );
    }),
    Text(
      'Loggout',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 45,
              color: Color(0xFFFFCC00),
            ),
          ),
        ),
        backgroundColor: const Color(0xFF006633),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout'
          ),
        ],
        backgroundColor: coresufabc,
        currentIndex: _selectedIndex,
        unselectedItemColor : Colors.white,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
