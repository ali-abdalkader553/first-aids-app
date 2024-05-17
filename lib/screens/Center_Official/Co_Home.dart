import 'package:first_aids_app_pro1/screens/Center_Official/Co_Accepted_Missions.dart';
import 'package:first_aids_app_pro1/screens/Center_Official/Co_Completed_Missions_info.dart';
import 'package:first_aids_app_pro1/screens/Center_Official/Co_Incoming_Missions.dart';
import 'package:first_aids_app_pro1/screens/Center_Official/Un_Accepted_Mission.dart';
import 'package:flutter/material.dart';

import '../../Content management/User/componant_user_info.dart';

var nameStateController = TextEditingController();

class CoHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.red,
        child: ListView(
          children: [
            ListTile(
              title: const Text('الطلبات المقبولة'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CoAcceptableMissions()),
                );
              },
            ),
            ListTile(
              title: const Text('الطلبات المرفوضة'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CoUnAcceptableMissions()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'تطبيق مسؤول المركز',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              nextPage(context, CoIncomingMissions());
            },
            icon: Icon(
              Icons.notifications_none_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  child: InkWell(
                    child: buildSrHome(),
                    onTap: () {
                      nextPage(context, CoCompletedMissions());
                    },
                  ),
                  height: 60.0,
                ),
                separatorBuilder: (context, index) => Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildSrHome() => Row(
      children: [
        CircleAvatar(
          radius: 20.0,
          child: Icon(
            Icons.add,
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Text(
            'اسم الحالة',
          ),
        ),
      ],
    );
