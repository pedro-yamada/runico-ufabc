import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
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
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    )),
                // const SizedBox(height: 50.0),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF006633)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () {
                              signInGoogle(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(0.0),
                              height: 60.0,
                              //MediaQuery.of(context).size.width * .08,
                              width: 300.0,
                              //MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                color: coresufabc,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: <Widget>[
                                  LayoutBuilder(
                                      builder: (context, constraints) {
                                    print(constraints);
                                    return Container(
                                      height: constraints.maxHeight,
                                      width: constraints.maxHeight,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/images/google.png'),
                                      ),
                                    );
                                  }),
                                  const Expanded(
                                    child: Text(
                                      'Google',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
        .showSnackBar(const SnackBar(content: Text('Login Falhou')));
  } else {
    if (await verifyUser(userGoogle.email)) {
      List<User> users = await UserDao().find(userGoogle.email);
      User user = users[0];
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(User(
          name: user.name,
          email: user.email,
          userType: user.userType,
          creditCount: user.creditCount));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login(
                userGoogle: userGoogle,
              )));
    }
  }
}
