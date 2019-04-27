import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  static DateTime _date = DateTime.now();
  static TimeOfDay _time = TimeOfDay.now();

  String updatedDate = '${_date.day}-${_date.month}-${_date.year}';
  String updatedTime = '${_time.hour} : ${_time.minute}';

  List _services = [
    "Male haircut",
    "Female haircut",
    "Manicure",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedServices;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _selectedServices = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String service in _services) {
      items.add(new DropdownMenuItem(value: service, child: new Text(service)));
    }
    return items;
  }

  Future<Null> _selectDate(BuildContext context) async {
    final _datePicked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: _date,
        lastDate: DateTime(2020));
    if (_datePicked != null && _datePicked != _date) {
      setState(() {
        _date = _datePicked;
        updatedDate = '${_date.day}-${_date.month}-${_date.year}';
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final _timePicked =
        await showTimePicker(context: context, initialTime: _time);
    if (_timePicked != null && _timePicked != _time) {
      setState(() {
        _time = _timePicked;
        updatedTime = '${_time.hour} : ${_time.minute}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final address = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Enter your address',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final discription = Padding(
      padding: EdgeInsets.all(20),
      child: Text("Let's fill in some details...",
          style: TextStyle(color: Colors.pinkAccent, fontSize: 24)),
    );

    final dateField = ListTile(
      leading: Icon(
        Icons.date_range,
        color: Colors.pinkAccent,
      ),
      title: Text(
        updatedDate,
        style: TextStyle(color: Colors.pinkAccent),
      ),
      onTap: () async {
        _selectDate(context);
      },
    );

    final timeField = ListTile(
      leading: Icon(
        Icons.date_range,
        color: Colors.pinkAccent,
      ),
      title: Text(
        updatedTime,
        style: TextStyle(color: Colors.pinkAccent),
      ),
      onTap: () async {
        _selectTime(context);
      },
    );
    // Padding(
    //   padding: EdgeInsets.all(10),
    //   child: Row(
    //     children: <Widget>[
    //       IconButton(
    //         icon: Icon(
    //           Icons.date_range,
    //           color: Colors.pinkAccent,
    //         ),
    //         onPressed: () async {
    //           _selectDate(context);
    //         },
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(25),
    //         child: Text(updatedDate),
    //       )
    //     ],
    //   ),
    // );

    // final timeField = Padding(
    //   padding: EdgeInsets.all(10),
    //   child: Row(
    //     children: <Widget>[
    //       IconButton(
    //         icon: Icon(
    //           Icons.date_range,
    //           color: Colors.pinkAccent,
    //         ),
    //         onPressed: () {
    //           _selectTime(context);
    //         },
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(25),
    //         child: Text(updatedTime),
    //       )
    //     ],
    //   ),
    // );

    final submitButton = Padding(
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          "Submit",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        color: Colors.pinkAccent,
        onPressed: () {},
      ),
    );

    final dropDownButton = Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Service : ",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 18),
              ),
              DropdownButton(
                style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                value: _selectedServices,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Book Appointment",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text("Booking..."), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("My Schedule"), icon: Icon(Icons.access_time)),
          BottomNavigationBarItem(
              title: Text("Community"), icon: Icon(Icons.people)),
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              discription,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: dateField,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: timeField,
              ),
              dropDownButton,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: address,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(48, 16, 48, 0),
                child: SizedBox(
                  width: double.infinity, // match_parent
                  child: submitButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String services) {
    setState(() {
      _selectedServices = services;
    });
  }
}
