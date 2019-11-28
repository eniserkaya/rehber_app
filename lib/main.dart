import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rehber_app/sms_gonder_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _rehberList = new List();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool izin = false;

  @override
  void initState() {
    izinIste().then((izinVerdiMi) {
      if (izinVerdiMi) {
        rehberiGetir().then((rehber) {
          var rehberList = rehber.toList();

          setState(() {
            _rehberList = rehberList;
            izin = izinVerdiMi;
          });
        });
      } else {
        setState(() {
          izin = izinVerdiMi;
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('İzin vermediğiniz için üzüldük'),
            duration: Duration(seconds: 3),
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rehber',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Rehber'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _rehberList.length > 0
              ? ListView.builder(
                  itemCount: _rehberList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact kisi = _rehberList?.elementAt(index);
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SMSGonderPage(kisi)));
                      },
                      leading: (kisi.avatar != null && kisi.avatar.length > 0)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(kisi.avatar))
                          : CircleAvatar(child: Text(kisi.initials())),
                      title: Text(kisi.displayName),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Future<bool> izinIste() async {
    var result = await PermissionHandler()
        .requestPermissions([PermissionGroup.contacts]);
    if (result[PermissionGroup.contacts] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
}

Future<Iterable<Contact>> rehberiGetir() async {
  Iterable<Contact> contacts = await ContactsService.getContacts();
  return contacts;
}
