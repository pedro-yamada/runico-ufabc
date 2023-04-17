import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/login_dados.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC00),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0),
            Text(
              'Você é:',
              style: TextStyle(fontSize: 24.0, color: Color(0xFF006633)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => Login_dados(),
                    ));
              },
              child: Text('Aluno'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Não Aluno'),
            ),
          ],
        ),
      ),
    );
  }
}