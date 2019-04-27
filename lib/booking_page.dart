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
    "Boys haircut",
    "Ladies haircut",
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
      child: Text("Book a service",
          style: TextStyle(color: Colors.pinkAccent, fontSize: 50)),
    );

    final dateField = Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: Colors.pinkAccent,
            ),
            onPressed: () async {
              _selectDate(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(updatedDate),
          )
        ],
      ),
    );

    final timeField = Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: Colors.pinkAccent,
            ),
            onPressed: () {
              _selectTime(context);
            },
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(updatedTime),
          )
        ],
      ),
    );

    final submitButton = Padding(
      padding: EdgeInsets.all(15),
      child: RaisedButton(
        child: Text("Submit"),
        color: Colors.pinkAccent,
      ),
    );

    final dropDownButton = Padding(
      padding: EdgeInsets.all(20),
      child: Center(child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Service : "),
          DropdownButton(
            value: _selectedServices,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          )
        ],
      ),)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              discription,
              dateField,
              timeField,
              dropDownButton,
              address,
              submitButton
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
