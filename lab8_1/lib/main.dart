import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:lab8_1/new.dart';
import 'package:html/parser.dart';

Future<List<New>> fetchNews(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
      Bidi.stripHtmlIfNeeded(response.body);
      String html = parse(response.body).body!.text;
  return compute(parseNews, html);
}


List<New> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<New>((json) => New.fromJson(json)).toList();
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Лента новостей';
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
      ),
      body: FutureBuilder<List<New>>(
          future: fetchNews(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ошибка'),
              );
            } else if (snapshot.hasData) {
              return NewsList(news: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);

  final List<New> news;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(children: [
                          Image.network(news[index].icon),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${news[index].date}',
                                    style: TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '${news[index].title}',
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Flexible(child: Text('${news[index].text}',textAlign: TextAlign.start,)),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ]),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
