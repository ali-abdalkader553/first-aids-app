import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Content management/Operations_Room/Componants.dart';
import 'Or_Home.dart';

class AddOrInformation extends StatefulWidget {
  const AddOrInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOrInformation> createState() => _AddOrInformationState();
}

class _AddOrInformationState extends State<AddOrInformation> {
  late int docId;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController requestername = TextEditingController();
  TextEditingController rejectreasone = TextEditingController();
  TextEditingController latereasone = TextEditingController();
  TextEditingController bossnotes = TextEditingController();

  addorminformation(context) async {
    CollectionReference ormissioninformation = FirebaseFirestore.instance
        .collection("or-mission-rejected-information")
        .doc(docId.toString())
        .collection("orminfo");
    if (formState.currentState!.validate()) {
      try {
        await ormissioninformation.add({
          "orminfo": requestername.text,
          "rejectreasone": rejectreasone.text,
          "latereasone": latereasone.text,
          "bossnotes": bossnotes.text,
        });
        navigateFinish(context, HomeOrRoom());
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    requestername.dispose();
    rejectreasone.dispose();
    latereasone.dispose();
    bossnotes.dispose();
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
          'معلومات خاصة بغرفة العمليات',
        ),
      ),
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildTextFormFiled(
                        label: 'اسم متلقي البلاغ',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال البيانات';
                          }
                          return null;
                        },
                        control: requestername,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                buildTextFormFiled(
                  label: 'سبب الرفض ان وجد',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال البيانات';
                    }
                    return null;
                  },
                  control: rejectreasone,
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextFormFiled(
                  label: 'سبب تأخير الفريق ان وجد',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال البيانات';
                    }
                    return null;
                  },
                  control: latereasone,
                ),
                SizedBox(
                  height: 15.0,
                ),
                buildTextFormFiled(
                  label: 'ملاحظات قائد القطاع',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال البيانات';
                    }
                    return null;
                  },
                  control: bossnotes,
                ),
                SizedBox(
                  height: 30.0,
                ),
                buildTextBottom(
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        addorminformation(context);
                      }
                    },
                    text: 'ok',
                    color: Colors.blue,
                    width: double.infinity,
                    radius: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
