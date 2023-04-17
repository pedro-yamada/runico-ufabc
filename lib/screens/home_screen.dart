import 'package:runico_ufabc/components/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/screens/credits_selection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final userProvider = context.watch<UserProvider>();
      final user = userProvider.user;

      return Stack(
        children: [
          Container(
            color: const Color(0xFFFFCC00),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 45,
                      color: coresufabc,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  width: 300,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, ${user?.name}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: coresufabc,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'Acesso do tipo: ${user?.userType}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: coresufabc,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.black, width: 3)),
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Quantidade de Créditos:',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        user!.creditCount.toString(),
                        style: const TextStyle(fontSize: 60),
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
    });
  }
}

