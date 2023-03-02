import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

void main() async{
  // runApp(const MyApp());
  // fun();
  final username = 'bms20202543';
  final password = 'Ur7xEJg5';
  final url = Uri.parse('https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90');
  
  final credentials = '$username:$password';
  final encodedCredentials = base64.encode(utf8.encode(credentials));
  
  final response = await http.get(url, headers: {
    'Authorization': 'Basic $encodedCredentials'
  });
  
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лента новостей'),
          backgroundColor: Colors.green,
        ),
        body: Card(
          child: Text('data'),
        ),
      ),
    );
  }
}

void fun () {
  HttpOverrides.global = MyHttpOverrides();
  http.get(Uri.parse('http://kubsau.ru/api/getNews')).then((response) {
  print("Response status: ${response.statusCode}");
  final body = Bidi.stripHtmlIfNeeded(response.body);
  print("Response body: $body");
}).catchError((error){
  print("Error: $error");
});
}
class MyHttpOverrides extends HttpOverrides {
  
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = 
        (X509Certificate cert, String host, int port) =>true ;
  }
  
}