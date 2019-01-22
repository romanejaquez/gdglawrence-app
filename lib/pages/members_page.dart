import 'package:flutter/material.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/member_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';

class MembersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MembersPageState();
  }
}

class MembersPageState extends State<MembersPage> {

  List<MemberModel> members;
  List<Widget> memberWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllMembers().then((e) {
      setState(() {
          members = e;
          memberWidgets = List<Widget>();
          
          for(var i = 0; i < members.length; i++) {
            memberWidgets.add(Factory.getMemberWidget(members[i]));
          }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.googleBlue,
        title: Text("Members"),
        elevation: 0.0,
      ),
      body: Container(
        child: Container(
          child: members != null ? ListView(
            children: memberWidgets,
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