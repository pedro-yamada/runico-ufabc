import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:provider/provider.dart';

class selecaoMetodo extends StatelessWidget {
  final double payment_value;
  final int credits;

  const selecaoMetodo(
      {Key? key, required this.payment_value, required this.credits})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF006633),
        ),
        body: Stack(children: <Widget>[
          Container(
            color: const Color(0xFFFFCC00),
            height: MediaQuery.of(context).size.height,
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: const [
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 250,
                          color: Colors.black12,
                        ),
                        Text(
                          'Selecione o método de pagamento',
                          style: TextStyle(
                              fontSize: 42,
                              color: coresufabc,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ])),
              Container(
                width: 280,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Quantidade de créditos: ${credits.toString()}',
                    style: TextStyle(fontSize: 18),),
                    Text('Valor total: R\$${payment_value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),)
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
                  child: Text(
                    'Crédito',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  userProvider.addCredits(credits);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006633),
                ),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: Text(
                    'Débito',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006633),
                ),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: Text(
                    'PIX',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006633),
                ),
                child: SizedBox(
                  width: 250,
                  height: 50,
                  child: Text(
                    'VR',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ))
        ]));
  }
}
