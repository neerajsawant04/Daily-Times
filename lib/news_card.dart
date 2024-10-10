import 'package:flutter/material.dart';
import 'models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  void _launchURL(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        leading: Image.network(news.imageUrl),
        title: Text(
          news.title,
          style: const TextStyle(color: Color.fromARGB(255, 76, 160, 175), fontSize: 16, fontWeight: FontWeight.w400),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              news.content,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
          InkWell(
            child: const Text("Read More", style: TextStyle(color: Color.fromARGB(255, 154, 158, 160), height: 3)),
            onTap: () {
              _launchURL(news.url);
            },
          ),
        ],
      ),
    );
  }
}