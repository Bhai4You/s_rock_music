import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'News Screen',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
