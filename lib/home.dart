import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _logradouro = "";
  String _complemento = "";
  String _bairro = "";
  String _cidade = "";
  String _uf = "";
  String _ddd = "";

  var buscou = false;

  TextEditingController cepController = TextEditingController();

  _recuperaCep() async{

    //String cep = "01001000";
    String url = "http://viacep.com.br/ws/${cepController.text}/json/";

    http.Response response;
    response = await http.get(url);
    Map <String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String cidade = retorno["localidade"];
    String uf = retorno["uf"];
    String ddd = retorno["ddd"];

    //print("resposta: "+response.body);

    setState(() {
      _logradouro = logradouro;
      _complemento = complemento;
      _bairro = bairro;
      _cidade = cidade;
      _uf = uf;
      _ddd = ddd;
      buscou = true;
    });
  }

  _limparDados(){
    setState(() {
      buscou = false;
      _logradouro = "";
      _complemento = "";
      _bairro = "";
      _cidade = "";
      _uf = "";
      _ddd = "";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca CEP"),
        actions: [
          IconButton(onPressed: (){_limparDados();}, icon: Icon(Icons.refresh))
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cepController,
                decoration: InputDecoration(
                    labelText: "Insira um CEP. Ex.: 01001000",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  _recuperaCep();
                },
                child: Text("Buscar CEP")
            ),
            SizedBox(height: 20,),
            buscou == false ? Container() :
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logradouro: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_logradouro, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Complemento: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_complemento, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bairro: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_bairro, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cidade: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_cidade, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("UF: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_uf, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DDD: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(_ddd, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue),)
                      ],
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
