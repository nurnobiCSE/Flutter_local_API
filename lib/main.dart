import 'package:dio/dio.dart';
import 'package:fluterapp/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connect Flutter with Django',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
var stringResponse;
var mapRespone = {};
List data = [];
class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future apicall()async{
    http.Response response;
    response = await http.get(Uri.parse("http://192.168.0.111:8080/api/productadd/"));
    if(response.statusCode ==200){
      setState(() {
        stringResponse = response.body;
        var toJson = json.decode(response.body);
        data = toJson;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    print("................/////////////");
    print(data);
    return Scaffold(
        appBar: AppBar(
          title: Text("hello APfI"),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child: Center(
                child: Text(data[index]['id'].toString()),
              ),
            );
          }

        ));
  }
}
