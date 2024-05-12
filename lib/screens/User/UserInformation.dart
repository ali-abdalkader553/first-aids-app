import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/Content%20management/User/componant_user_info.dart';
import 'package:first_aids_app_pro1/auth/auth_helper.dart';
import 'package:first_aids_app_pro1/auth/notification_helper.dart';
import 'package:flutter/material.dart';

import '../../Content management/User/CustomButton.dart';

class InformationUser extends StatelessWidget {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name_of_the_mission_requester = TextEditingController();
  TextEditingController who_is_the_requester = TextEditingController();
  TextEditingController number_of_mission_requester = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController breathing = TextEditingController();
  TextEditingController awareness = TextEditingController();
  TextEditingController patiant_name = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController history_of_illness = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController building_number = TextEditingController();
  TextEditingController to = TextEditingController();

  CollectionReference missioninformation =
      FirebaseFirestore.instance.collection("mission-information");

  addmissoninfo(context) async {
    if (formState.currentState!.validate()) {
      try {
        await missioninformation.add({
          "name_of_the_mission_requester": name_of_the_mission_requester.text,
          "who_is_the_requester": who_is_the_requester.text,
          "number_of_mission_requester": number_of_mission_requester.text,
          "details": details.text,
          "breathing": breathing.text,
          "awareness": awareness.text,
          "patiant_name": patiant_name.text,
          "sex": sex.text,
          "age": age.text,
          "weight": weight.text,
          "history_of_illness": history_of_illness.text,
          "from": from.text,
          "building_number": building_number.text,
          "to": to.text,
        });
        Navigator.pop(context);
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name_of_the_mission_requester.dispose();
    who_is_the_requester.dispose();
    name_of_the_mission_requester.dispose();
    details.dispose();
    breathing.dispose();
    awareness.dispose();
    patiant_name.dispose();
    sex.dispose();
    age.dispose();
    weight.dispose();
    history_of_illness.dispose();
    from.dispose();
    building_number.dispose();
    to.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
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
                        label: 'صفة طالب المهمة',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال الصفة';
                          }
                          return null;
                        },
                        control: who_is_the_requester,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'اسم طالب المهمة',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال الاسم';
                          }
                          return null;
                        },
                        control: name_of_the_mission_requester,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                buildTextFormFiled(
                  onTap: () {},
                  text: TextInputType.number,
                  label: 'رقم طالب المهمة',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال الرقم';
                    }
                    return null;
                  },
                  control: number_of_mission_requester,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Text(
                      'تفاصيل الحالة',
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
                      label: 'تفاصيل الحالة',
                      validat: (String value) {
                        if (value.isEmpty) {
                          return 'يرجى ادخال تفاصيل الحالة';
                        }
                        return null;
                      },
                      control: details,
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
                            label: 'التنفس',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: breathing,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'الوعي',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: awareness,
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
                    Text(
                      'معلومات المصاب',
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
                      children: [
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'اسم المصاب',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: patiant_name,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'الجنس',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: sex,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.number,
                            label: 'العمر',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: age,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.number,
                            label: 'الوزن',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: weight,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'سوابق مرضية',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: history_of_illness,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Text(
                      'عنوان السكن والواجهة',
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
                      children: [
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'الوجهة من',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: from,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.number,
                            label: 'رقم الطابق',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال تفاصيل الحالة';
                              }
                              return null;
                            },
                            control: building_number,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'الوجهة الى',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: to,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                CustomButton(
                    onPressed: () {
                      addmissoninfo(context);
                      NotificationHelper.sendNotificationToAllUserType(
                        userType: UserType.operationRoom,
                        title: 'مهمة جديدة',
                        body: "",
                      );
                    },
                    title: "Add")

                /* Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: ()
                    {
                      if(formState.currentState!.validate())
                      {
                      }
                    },
                    child: Text(
                      'طلب الاسعاف',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
