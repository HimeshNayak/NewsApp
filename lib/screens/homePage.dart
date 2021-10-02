import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/articles.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> newsList = [];

  Future<List<dynamic>> getNewsMap() async {
    await http
        .read(
      Uri.parse('https://hubblesite.org/api/v3/news'),
    )
        .then(
      (value) {
        newsList = jsonDecode(value);
      },
    );
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink;
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<dynamic>>(
          future: getNewsMap(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return buildNewsList(snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildNewsList(List<dynamic>? newsList) {
    return ListView.builder(
      itemCount: newsList?.length,
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Article(
            news: newsList?[item],
          ),
        );
      },
    );
  }
}
