import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {

    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Número invalido, digite números maiores que 0 e utilize (.)!!";
      });
    }else{
      if( (precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina!";
        });
      }else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool!";
        });
      }
    }

  }

  void _limparCampo(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [

              //Logo
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),

              // Texto
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opção para abastecer o seu carro!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço do Álcool, ex: 3.09"
                ),
                style:  TextStyle(
                  fontSize: 20,
                ),
                controller: _controllerAlcool,
              ),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço da Gasolina, ex: 6.59"
                ),
                style:  TextStyle(
                  fontSize: 20,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 13),
                child: RaisedButton(
                  child: Text("Limpar",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.grey,
                  padding: EdgeInsets.all(13),
                  onPressed: _limparCampo,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13),
                child: RaisedButton(
                  child: Text("Calcular",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  padding: EdgeInsets.all(13),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
