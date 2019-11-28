import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMSGonderPage extends StatefulWidget {
  Contact contact;
  String sms;

  SMSGonderPage(this.contact);

  @override
  _SMSGonderPageState createState() => _SMSGonderPageState();
}

class _SMSGonderPageState extends State<SMSGonderPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Text('Send'),
          onPressed: _smsGonder),
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
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 300,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Göndermek istediğiniz SMS İçeriği',
                      labelStyle: TextStyle(color: Colors.red),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                    validator: (input) => input.length == 0
                        ? 'SMS Alanını boş bırakmayınız.'
                        : null,
                    onSaved: (input) => widget.sms = input,
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _smsGonder() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print("smsGıdecek!!!!!!!!!"+ widget.sms);
    }
  }
}
