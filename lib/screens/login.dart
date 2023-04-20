import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/home.dart';
import 'package:runico_ufabc/screens/login_dados.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:runico_ufabc/data/user_dao.dart';

class Login extends StatelessWidget {
  const Login({Key? key, required this.userGoogle}) : super(key: key);

  final GoogleSignInAccount userGoogle;

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
                      builder: (contextNew) => Login_dados(
                        userGoogle: userGoogle,
                      ),
                    ));
              },
              child: Text('Aluno'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Verificando se é nulo, caso contrário retornam string vazia
                String name = userGoogle.displayName ?? "";
                String email = userGoogle.email ?? "";

                User user = User(
                    name: name,
                    email: email,
                    userType: 'Externo',
                    creditCount: 0);

                UserDao().save(user);

                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                userProvider.setUser(user);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (contextNew) => HomePage(),
                    ));
              },
              child: Text('Não Aluno'),
            ),
          ],
        ),
      ),
    );
  }
}
