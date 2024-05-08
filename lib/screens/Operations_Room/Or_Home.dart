import 'package:first_aids_app_pro1/screens/Operations_Room/Or_Acceptable_missions.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Or_Incoming_missions.dart';
import 'package:first_aids_app_pro1/screens/Operations_Room/Or_Unacceptable_mission.dart';
import 'package:flutter/material.dart';

import '../../Content management/Operations_Room/Componants.dart';
import 'OR_Add_Mission.dart';

class HomeOrRoom extends StatefulWidget {
  const HomeOrRoom({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeOrRoom> createState() => _HomeOrRoom();
}

class _HomeOrRoom extends State<HomeOrRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
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
                      builder: (context) => const AcceptableMissions()),
                );
              },
            ),
            ListTile(
              title: const Text('الطلبات المرفوضة'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UnAcceptableMissions()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'تطبيق غرفة العمليات',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextBottom(
              width: double.infinity,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrAddMission()),
                );
              },
              text: 'اضافة مهمة',
              color: Colors.red,
              radius: 20.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            buildTextBottom(
              width: double.infinity,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrIncomingMission()),
                );
              },
              text: 'المهمات الواردة',
              color: Colors.red,
              radius: 20.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            buildTextBottom(
              width: double.infinity,
              onPressed: () {
                ;
              },
              text: 'المهمات المنجزة',
              color: Colors.red,
              radius: 20.0,
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
