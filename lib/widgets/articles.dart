import 'package:flutter/material.dart';
import '../screens/articleScreen.dart';

class Article extends StatelessWidget {
  final dynamic news;
  Article({@required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            news['name'],
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    heading: news['name'],
                    url: news['url'],
                  ),
                ),
              );
            },
            child: Text('View Article'),
          ),
        ],
      ),
    );
  }
}
