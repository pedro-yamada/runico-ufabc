import 'package:flutter/material.dart';
import 'package:runico_ufabc/screens/home.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:provider/provider.dart';
import 'package:runico_ufabc/data/user_dao.dart';

// Função para gerar um token de autenticação
import 'dart:math';

// Função para gerar um token de autenticação
String gerarToken(String email, String senha) {
  final random = Random();
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final token = '$email|$senha|$timestamp|${random.nextInt(999999)}';
  return token;
}

// Função para enviar e-mail de confirmação
Future<void> enviarEmailConfirmacao(String email, String token) async {
  final smtpServer = SmtpServer('smtp.gmail.com',
      username: 'runico.ufabc@gmail.com',
      password: 'jmybslbwcpgbbgoa',
      port: 587,
      ssl: false);

  final message = Message()
    ..from = const Address('runico.ufabc@gmail.com', "Runico UFABC")
    ..recipients.add(email)
    ..subject = 'Confirmação de E-mail | RUnico UFABC'
    ..text = 'Clique no link abaixo para confirmar seu e-mail:\n\n'
        'https://runicoufabc.com/confirmacao?token=$token';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado para $email: ${sendReport.toString()}');
  } catch (e) {
    print('Erro ao enviar e-mail de confirmação: $e');
  }
}

bool RAValidator(String? value) {
  if (value != null && value.isNotEmpty) {
    int? ra = int.tryParse(value);
    if (ra == null) {
      return false;
    }
    else{
      return true;
    }
  }
  else{
    return false;
  }
}

bool emailValidator(String? email) {
  String padraoRegex = r'^[\w-]+(.[\w-]+)*@aluno.ufabc.edu.br$';
  RegExp regex = RegExp(padraoRegex);

  if (email != null && email.isNotEmpty) {
    String emailnn = email;
    if (regex.hasMatch(emailnn)) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

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
      backgroundColor: const Color(0xFFFFCC00),
      appBar: AppBar(
        title: const Text('Preencha seus dados:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (!emailValidator(value)) {
                    return 'Insira o email institucional corretamente!';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                validator: (String? value) {
                  if (!RAValidator(value)) {
                    return 'Insira o RA corretamente!';
                  }
                  return null;
                },
                controller: _raController,
                decoration: const InputDecoration(
                  labelText: 'RA',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  final email = _emailController.text;
                  final ra = _raController.text;
                  print('E-mail: $email, RA: $ra');
                  if (_formKey.currentState!.validate()){
                    final token = gerarToken(email, ra);
                    enviarEmailConfirmacao(email, token);

                    registerUserData(widget.userGoogle, context);
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

registerUserData(GoogleSignInAccount userGoogle, BuildContext context){
  String name = userGoogle.displayName ?? "";
  String emailGoogle = userGoogle.email ?? "";

  User user = User(
      name: name,
      email: emailGoogle,
      userType: 'Aluno',
      creditCount: 0);

  UserDao().save(user);

  final userProvider =
  Provider.of<UserProvider>(context, listen: false);

  userProvider.setUser(user);

  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
}
