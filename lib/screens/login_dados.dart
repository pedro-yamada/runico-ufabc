import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:runico_ufabc/components/user.dart';

class Login_dados extends StatefulWidget {
  const Login_dados(
      {Key? key, required this.userGoogle})
      : super(key: key);

  final GoogleSignInAccount userGoogle;

  @override
  _MyFormDataPageState createState() => _MyFormDataPageState();
}

class _MyFormDataPageState extends State<Login_dados> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _raController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _raController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC00),
      appBar: AppBar(
        title: Text('Preencha seus dados:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _raController,
                decoration: InputDecoration(
                  labelText: 'RA',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  final ra = _raController.text;
                  String name = widget.userGoogle.displayName ?? "";
                  String emailGoogle = widget.userGoogle.email ?? "";

                  final userProvider = Provider.of<UserProvider>(context, listen: false);
                  userProvider.setUser(User(
                      name: name,
                      email: emailGoogle,
                      userType: 'Aluno',
                      creditCount: 0));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => HomePage(),
                      ));
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}