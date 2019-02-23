import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/contact_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {

  List<ContactModel> contacts;
  List<Widget> contactWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllContactInfo().then((e) {
      setState(() {
          contacts = e;
          contactWidgets = List<Widget>();
          
          for(var i = 0; i < contacts.length; i++) {
            contactWidgets.add(Factory.getContactInfoRow(contacts[i], onSelectedResource));
          }
      });
    });
  }

  void onSelectedResource(ContactModel resource) async {
    await launch(resource.url);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Contact Us"),
        backgroundColor: Utils.googleBlue,
      ),
      body: Container(
        child: Container(
          child: contacts != null ? ListView(
            children: contactWidgets,
          ) : Center(
            child: SpinningControl(
              color1: Utils.googleBlue,
              color2: Utils.googleBlue,
              color3: Utils.googleBlue,
              color4: Utils.googleBlue
            ),
          ),
        ),
      )
    );
  }
}