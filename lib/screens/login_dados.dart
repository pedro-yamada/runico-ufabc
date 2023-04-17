import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/home.dart';

class Login_dados extends StatefulWidget {
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
                  print('E-mail: $email, RA: $ra');
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