import "package:flutter/material.dart";
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/teammember_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeamPageState();
  }
}

class TeamPageState extends State<TeamPage> {

  List<TeamMember> teammembers;
  List<Widget> teamMemberWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllTeamMembers().then((e) {
      setState(() {
          teammembers = e;
          teamMemberWidgets = List<Widget>();
          
          for(var i = 0; i < teammembers.length; i++) {
            teamMemberWidgets.add(Factory.getTeamMemberCard(teammembers[i], onSelectedResource));
          }
      });
    });
  }

  void onSelectedResource(TeamSocialLink resource) async {
    await launch(resource.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Utils.googleGreen,
        title: Text("Our Team"),
      ),
      body: Container(
        color: Colors.grey[300],
        child: teammembers != null ? ListView(
          children: teamMemberWidgets,
        ) : Center(
          child: SpinningControl(
            color1: Utils.googleGreen,
            color2: Utils.googleGreen,
            color3: Utils.googleGreen,
            color4: Utils.googleGreen
          ),
        ),
      )
    );
  }
}