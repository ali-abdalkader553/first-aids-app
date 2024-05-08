import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Content management/Operations_Room/Componants.dart';
import '../../Content management/User/CustomButton.dart';
import 'Or_Home.dart';

class Or_choose_center extends StatefulWidget {
  const Or_choose_center({Key? key}) : super(key: key);

  @override
  State<Or_choose_center> createState() => _Or_choose_centerState();
}

class _Or_choose_centerState extends State<Or_choose_center> {
  late int docId;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController center = TextEditingController();

  choosecenter(context) async {
    CollectionReference ormissioninformation = FirebaseFirestore.instance
        .collection("or-mission-information")
        .doc(docId.toString())
        .collection("center");
    if (formState.currentState!.validate()) {
      try {
        await ormissioninformation.add({
          "center": center.text,
        });
        nextPage(context, HomeOrRoom());
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    center.dispose();
  }

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    if (flag) {
      docId = ModalRoute.of(context)?.settings.arguments as int;
      flag = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تحديد المركز المستجيب',
        ),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildTextFormFiled(
                label: 'المركز',
                control: center,
                validat: (String value) {
                  if (value.isEmpty) {
                    return 'يرجى تحديد المركز';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              CustomButton(
                  onPressed: () {
                    choosecenter(context);
                  },
                  title: "تحديد"),
            ],
          ),
        ),
      ),
    );
  }
}
