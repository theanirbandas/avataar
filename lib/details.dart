import 'package:avtaar/model/lesson.dart';
import 'package:flutter/material.dart';

import 'model/data.dart';

class Details extends StatelessWidget {

  final Lesson lesson;

  const Details(this.lesson, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded), 
          color: Colors.blueGrey[900],
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: Center(
        child: Text(
          lesson.title,
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
      ),
    );
  }
}