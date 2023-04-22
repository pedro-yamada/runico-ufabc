import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/screens/home_menu.dart';
import 'package:runico_ufabc/screens/home_screen.dart';
import 'package:runico_ufabc/api/google_signin_api.dart';
import 'initial_screeen.dart';
import 'package:runico_ufabc/data/user_dao.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:provider/provider.dart';

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
    const MenuScreen(),
    const HomeScreen(),
    const Text(
      'Loggout',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Sair'),
              content: Text('Tem certeza que deseja sair?'),
              actions: [
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: Text('Sair'),
                  onPressed: () {
                    // Retire o comentário caso queira testar o login
                    // final userProvider = Provider.of<UserProvider>(context, listen: false);
                    // final user = userProvider.user;
                    // UserDao().delete(user!.email);
                    //

                    GoogleSignInAPI.loggout();
                    Navigator.of(context)
                        .pushReplacement(
                        MaterialPageRoute(builder: (context) => InititalScreen()));
                  },
                ),
              ],
            ),
          );
    }
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC00),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Sair'),
        ],
        backgroundColor: coresufabc,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
