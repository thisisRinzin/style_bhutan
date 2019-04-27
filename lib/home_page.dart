import 'package:flutter/material.dart';

import './booking_page.dart';


class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    final welcome = Hero(
      tag: 'hero',
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Welcome to Style Bhutan',
            style: TextStyle(fontSize: 29.0, color: Colors.pinkAccent),
          )),
    );

    final service = Padding(
      padding: EdgeInsets.fromLTRB(25.0, 100.0, 25.0, 25.0),
      child: Text(
        'Book our services now!', 
        style: TextStyle(fontSize: 28.0, color: Colors.pinkAccent),
      ),
    );

    final bookButton = Padding(
      padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: Center(
        child: Container(
          height: 200,
          width: 200,
          child: RaisedButton(
            elevation: 2.0,
            shape: CircleBorder(),
            color: Colors.pinkAccent,
            child: Text(
              "Book now",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BookingPage()
              ));
            },
          ),
        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[welcome, service, bookButton,],

      ),
    );

    return Scaffold(
      body: body,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Style Bhutan",
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: IconButton(
          icon: Icon(Icons.schedule),
          color: Colors.white,
          onPressed: () => {},
        ),
        onPressed: () {},
      ),
    );
  }
}
