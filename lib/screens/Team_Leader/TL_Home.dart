import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Content management/Operations_Room/Componants.dart';
import '../../Content management/User/CustomButton.dart';

class TlHomescreen extends StatefulWidget {
  const TlHomescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TlHomescreen> createState() => _TlHomescreen();
}

class _TlHomescreen extends State<TlHomescreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController team_leader = TextEditingController();
  TextEditingController scout = TextEditingController();
  TextEditingController first_paramedic = TextEditingController();
  TextEditingController second_paramedic = TextEditingController();
  TextEditingController third_paramedic = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController car_num = TextEditingController();

  teaminfo(context) async {
    var id = DateTime.now().millisecondsSinceEpoch;
    CollectionReference ormissioninformation =
        FirebaseFirestore.instance.collection("ambulance-team");
    if (formState.currentState!.validate()) {
      try {
        await ormissioninformation.doc(id.toString()).set({
          "team_leader": team_leader.text,
          "scout": scout.text,
          "first_paramedic": first_paramedic.text,
          "second_paramedic": second_paramedic.text,
          "third_paramedic": third_paramedic.text,
          "driver": driver.text,
          "car_num": car_num.text,
        });

        Navigator.of(context).pushNamed("patientinformation", arguments: id);
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    team_leader.dispose();
    scout.dispose();
    first_paramedic.dispose();
    second_paramedic.dispose();
    third_paramedic.dispose();
    driver.dispose();
    car_num.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قائد الفريق',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'يرجى ادخال المعلومات',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'اسم قائد الفريق',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال الصفة';
                          }
                          return null;
                        },
                        control: team_leader,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'الكشاف',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال الاسم';
                          }
                          return null;
                        },
                        control: scout,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                buildTextFormFiled(
                  onTap: () {},
                  text: TextInputType.text,
                  label: 'المسعف الاول',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال الرقم';
                    }
                    return null;
                  },
                  control: first_paramedic,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Text(
                      'المسعف الثاني',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    buildTextFormFiled(
                      onTap: () {},
                      text: TextInputType.text,
                      label: 'المسعف الثاني',
                      validat: (String value) {
                        if (value.isEmpty) {
                          return 'يرجى ادخال الاسم';
                        }
                        return null;
                      },
                      control: second_paramedic,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'المسعف الثالث',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: third_paramedic,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'السائق',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: driver,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.number,
                            label: 'رقم السيارة',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: car_num,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          onPressed: () {
                            teaminfo(context);
                          },
                          title: "next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
