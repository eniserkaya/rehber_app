import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMSGonderPage extends StatefulWidget {
  Contact contact;

  SMSGonderPage(this.contact);

  @override
  _SMSGonderPageState createState() => _SMSGonderPageState();
}

class _SMSGonderPageState extends State<SMSGonderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Text('Send'),
          onPressed: () {
            print("SMS GONDERİLECEK " + widget.contact.displayName);
          }),
      appBar: AppBar(
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          // action button
          IconButton(
            icon: Icon(Icons.contacts),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
          child: Container(
        child: Text(
          widget.contact.displayName,
          style: TextStyle(fontSize: 150),
        ),
      )),
    );
  }
}
