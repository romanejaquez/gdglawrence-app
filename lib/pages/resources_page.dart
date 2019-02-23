import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_lawrence/controls/spinning_control.dart';
import 'package:gdg_lawrence/models/resource_model.dart';
import 'package:gdg_lawrence/shared/factory.dart';
import 'package:gdg_lawrence/shared/repository.dart';
import 'package:gdg_lawrence/shared/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ResourcesPageState();
  }
}

class ResourcesPageState extends State<ResourcesPage> {

  List<ResourceModel> resources;
  List<Widget> resourceWidgets;

  @override
  void initState() {
    super.initState();

    Repository.getAllResources().then((e) {
      setState(() {
          resources = e;
          resourceWidgets = List<Widget>();
          
          for(var i = 0; i < resources.length; i++) {
            resourceWidgets.add(Factory.getResourceWidget(resources[i], onSelectedResource));
          }
      });
    });
  }

  void onSelectedResource(ResourceModel resource) async {
    await launch(resource.link);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.googleGreen,
        title: Text("Resources"),
        elevation: 0.0,
      ),
      body: Container(
        child: Container(
          child: resources != null ? ListView(
            children: resourceWidgets,
          ) : Center(
            child: SpinningControl(
              color1: Utils.googleGreen,
              color2: Utils.googleGreen,
              color3: Utils.googleGreen,
              color4: Utils.googleGreen
            ),
          ),
        ),
      )
    );
  }
}