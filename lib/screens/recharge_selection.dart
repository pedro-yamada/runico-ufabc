import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';

class selecaoMetodo extends StatelessWidget {
  selecaoMetodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 300,
                      child:
                      Stack(alignment: AlignmentDirectional.center, children: const [
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
                            textAlign: TextAlign.center,),
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
                        'Débito',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,),
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
                        textAlign: TextAlign.center,),
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
                        textAlign: TextAlign.center,),
                    ),
                    onPressed: () {},
                  ),
                ],
              ))
        ]));
  }
}
