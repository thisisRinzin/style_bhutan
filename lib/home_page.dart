import 'package:flutter/material.dart';

import './booking_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookingPage()));
            },
          ),
        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Padding(padding: EdgeInsets.all(24),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("You have don't have any appointments today", style: TextStyle(color: Colors.pinkAccent, fontSize: 24),),
                Divider(),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.pinkAccent,),
                  title: Text("5 PM, May 6", style: TextStyle(color: Colors.pinkAccent, fontSize: 16),),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.pinkAccent,),
                  title: Text("6:30 PM, May 15", style: TextStyle(color: Colors.pinkAccent, fontSize: 16),),
                  onTap: (){},                
                ),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.pinkAccent,),
                  onTap: (){},
                  title: Text("Set an Appointment", style: TextStyle(color: Colors.pinkAccent, fontSize: 16, fontWeight: FontWeight.w600),),
                ),
              ],
            )),
          ),

          bookButton,
        ],
      ),
    );

    return Scaffold(
          backgroundColor: Colors.white,
          body: body,
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text("Home"),
                icon: Icon(Icons.home)
              ),
              BottomNavigationBarItem(
                title: Text("My Schedule"),
                icon: Icon(Icons.access_time)
              ),
              BottomNavigationBarItem(
                title: Text("Community"),
                icon: Icon(Icons.people)
              ),
            ],
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            title: Text("Style Bhutan", style: TextStyle(color: Colors.white, fontSize: 28),),
            titleSpacing: 48,
            elevation: 0,
            backgroundColor: Colors.pinkAccent,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: (){},)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.pinkAccent,
              onPressed: () => {},
            ),
            onPressed: () {},
          ),
        );
  }
}
