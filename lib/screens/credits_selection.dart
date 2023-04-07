import 'package:flutter/material.dart';
import 'package:runico_ufabc/resources/colors.dart';
import 'package:runico_ufabc/screens/recharge_selection.dart';

class selecaoCreditos extends StatefulWidget {
  selecaoCreditos({Key? key}) : super(key: key);

  @override
  State<selecaoCreditos> createState() => _selecaoCreditosState();
}

class _selecaoCreditosState extends State<selecaoCreditos> {

  TextEditingController controladorInput = TextEditingController(text: '0');

  double valor_pagamento = 0;
  double cotacao = 5.95;

  void calculaValor(String qt_creditos){
      if (qt_creditos.isNotEmpty){
        valor_pagamento = int.parse(qt_creditos) * cotacao;
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF006633),
        ),
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              color: const Color(0xFFFFCC00),
              height: MediaQuery.of(context).size.height,
            ),
            Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 300,
                    child:
                        Stack(alignment: AlignmentDirectional.center, children: const [
                      Icon(
                        Icons.wallet,
                        size: 200,
                        color: Colors.black12,
                      ),
                      Text(
                        'Recarga de Créditos',
                        style: TextStyle(
                            fontSize: 42,
                            color: coresufabc,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ])),
                SizedBox(
                  height: 75,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('Quantidade de créditos:', style: TextStyle(
                      fontSize: 24,
                      color: coresufabc,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 50,
                        height: 60,
                        decoration: BoxDecoration(
                          color: coresufabc,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()
                        ),
                        child: IconButton(onPressed: (){
                          int valor = int.parse(controladorInput.text) - 1;
                          if (valor >= 0){
                            controladorInput.text = valor.toString();
                          }
                          else{
                            controladorInput.text = '0';
                          }
                          calculaValor(controladorInput.text);
                          setState(() {});
                        }, icon: const Icon(Icons.arrow_downward, size: 30,color: Colors.white,))),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: TextFormField(
                      onChanged: (text) {
                        setState(() {calculaValor(controladorInput.text);});
                      },
                      keyboardType: TextInputType.number,
                      controller: controladorInput,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
              ),
                    ),
                    Container(
                      width: 50,
                      height: 60,
                      decoration: BoxDecoration(
                          color: coresufabc,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()
                      ),
                        child: IconButton(onPressed: (){
                          int valor = int.parse(controladorInput.text) + 1;
                          controladorInput.text = valor.toString();
                          calculaValor(controladorInput.text);
                          setState(() {});
                        }, icon: const Icon(Icons.arrow_upward, size: 30, color: Colors.white,)))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('Valor Final:', style: TextStyle(
                        fontSize: 24,
                        color: coresufabc,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 220,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text('R\$ ${valor_pagamento.toStringAsFixed(2)}', style: TextStyle(fontSize: 24),),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contextNew) => selecaoMetodo(),
                      ));
                }, child: Text('Prosseguir',  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold)))
              ],
            ))
          ]),
        ));
  }
}
