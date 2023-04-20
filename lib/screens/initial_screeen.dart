import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/login.dart';
import 'package:runico_ufabc/api/google_signin_api.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:runico_ufabc/data/user_dao.dart';
import 'package:runico_ufabc/screens/home.dart';
import 'package:provider/provider.dart';

class InititalScreen extends StatefulWidget {
  const InititalScreen({Key? key}) : super(key: key);

  @override
  State<InititalScreen> createState() => _InititalScreenState();
}

class _InititalScreenState extends State<InititalScreen> {

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
                        onPressed: () async {
                          signInGoogle(context);
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

Future<bool> verifyUser(userEmail) async {
  var itemExists = await UserDao().find(userEmail);
  if (itemExists.isEmpty) {
    return false;
  } else {
    return true;
  }
}

Future signInGoogle(context) async {
  final userGoogle = await GoogleSignInAPI.login();

  if (userGoogle == null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Login Falhou')));
  } else {

    // Retire o comentário caso queira testar o login
    // UserDao().delete(userGoogle.email);

    if (await verifyUser(userGoogle.email)) {
      List<User> users = await UserDao().find(userGoogle.email);
      User user = users[0];
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(User(
          name: user.name,
          email: user.email,
          userType: user.userType,
          creditCount: user.creditCount));

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login(userGoogle: userGoogle,) ));
    }
  }
}