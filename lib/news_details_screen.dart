import 'package:flutter/material.dart';
import 'models/news.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs

class NewsDetailsScreen extends StatelessWidget {
  final News news;

  const NewsDetailsScreen({super.key, required this.news});

  // Method to launch URLs
  void _launchURL(String url) async {
    final Uri url0 = Uri.parse(url);
    if (!await launchUrl(url0, mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView( // Allows scrolling for longer content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(news.imageUrl), // News image
            const SizedBox(height: 10),
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news.description, // Show description or summary
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              news.content, // Full content of the news article
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            InkWell(
              child: const Text(
                "Read Full Article",
                style: TextStyle(color: Colors.blue, fontSize: 16, height: 2),
              ),
              onTap: () {
                _launchURL(news.url); // Launch the URL when tapped
              },
            ),
          ],
        ),
      ),
    );
  }
}