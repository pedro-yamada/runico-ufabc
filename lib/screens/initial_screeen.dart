import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/login.dart';

class InititalScreen extends StatelessWidget {
  const InititalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFCC00),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'RÚnico UFABC:',
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006633)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.0),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006633)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  color: const Color(0xFFFFCC00),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF006633),
                        ),
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(22),
                                        border: Border.all(
                                            color: Colors.black, width: 1)),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Image.network(
                                      'https://img.freepik.com/icones-gratis/procurar_318-265146.jpg'),
                                ],
                              ),
                              Text(
                                'Google',
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (contextNew) => Login(),
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
            )));
  }
}