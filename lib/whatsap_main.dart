import 'package:flutter/material.dart';
import 'package:watsapclone/screens/calls_page.dart';
import 'package:watsapclone/screens/camera_page.dart';
import 'package:watsapclone/screens/chats_page.dart';
import 'package:watsapclone/screens/status_page.dart';

class WhatsapMain extends StatefulWidget {
  const WhatsapMain({Key? key}) : super(key: key);

  @override
  State<WhatsapMain> createState() => _WhatsapMainState();
}

class _WhatsapMainState extends State<WhatsapMain>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _showMessage = true;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      _showMessage = _tabController.index != 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whatsap Clone'),
        centerTitle: true,
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            icon: Icon(Icons.camera),
          ),
          Tab(
            text: 'Chats',
          ),
          Tab(
            text: 'Status',
          ),
          Tab(
            text: 'Calls',
          ),
        ]),
      ),
      body: TabBarView(children: [
        CameraPage(),
        ChatsPage(),
        StatusPage(),
        CallsPage(),
      ]),
      floatingActionButton: _showMessage
          ? FloatingActionButton(child: Icon(Icons.message), onPressed: () {})
          : null,
    );
  }
}
