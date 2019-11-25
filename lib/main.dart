import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List rehberList;

    rehberiGetir().then((rehber){
      rehberList = rehber.toList();

      Contact contact = rehberList[100];
      print("displayName budur =======" + contact.displayName);
    });

    return MaterialApp(
      title: 'Rehber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Rehber'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[

          ],),
        ),
      ),
    );
  }

  Future<Iterable<Contact>> rehberiGetir() async {

    Iterable<Contact> contacts = await ContactsService.getContacts();
    return contacts;
  }
}
