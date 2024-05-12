import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_aids_app_pro1/screens/Team_Leader/TL_Home.dart';
import 'package:flutter/material.dart';

import '../../Content management/Operations_Room/Componants.dart';
import '../../Content management/User/CustomButton.dart';

class patientinfo extends StatefulWidget {
  const patientinfo({Key? key}) : super(key: key);

  @override
  State<patientinfo> createState() => _patientinfo();
}

class _patientinfo extends State<patientinfo> {
  late int docid;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController patient_name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController blood_type = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController illness_history = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController symptoms = TextEditingController();
  TextEditingController awarness = TextEditingController();
  TextEditingController breathing_type = TextEditingController();
  TextEditingController breathing = TextEditingController();
  TextEditingController heartbeat = TextEditingController();
  TextEditingController oxygenation = TextEditingController();
  TextEditingController oxygenation_with_support = TextEditingController();
  TextEditingController support_ratio = TextEditingController();
  TextEditingController blood_pressure = TextEditingController();
  TextEditingController diabetes = TextEditingController();

  patientinformation(context) async {
    CollectionReference ormissioninformation = FirebaseFirestore.instance
        .collection("ambulance-team")
        .doc(docid.toString())
        .collection("patient-info");
    if (formState.currentState!.validate()) {
      try {
        await ormissioninformation.add({
          "patient_name": patient_name.text,
          "age": age.text,
          "sex": sex.text,
          "phone": phone.text,
          "blood_type": blood_type.text,
          "from": from.text,
          "to": to.text,
          "illness_history": illness_history.text,
          "details": details.text,
          "symptoms": symptoms.text,
          "awarness": awarness.text,
          "breathing_type": breathing_type.text,
          "breathing": breathing.text,
          "heartbeat": heartbeat.text,
          "oxygenation": oxygenation.text,
          "oxygenation_with_support": oxygenation_with_support.text,
          "support_ratio": support_ratio.text,
          "blood_pressure": blood_pressure.text,
          "diabetes": diabetes.text,
        });
        navigateFinish(context, TlHomescreen());
      } catch (e) {
        print("Error  $e");
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    patient_name.dispose();
    age.dispose();
    sex.dispose();
    phone.dispose();
    blood_type.dispose();
    from.dispose();
    to.dispose();
    illness_history.dispose();
    details.dispose();
    symptoms.dispose();
    awarness.dispose();
    breathing_type.dispose();
    breathing.dispose();
    heartbeat.dispose();
    oxygenation.dispose();
    oxygenation_with_support.dispose();
    support_ratio.dispose();
    blood_pressure.dispose();
    diabetes.dispose();
  }

  bool flag = true;

  @override
  Widget build(BuildContext context) {
    if (flag) {
      docid = ModalRoute.of(context)?.settings.arguments as int;
      flag = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تحديد المركز المستجيب',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                        label: 'اسم المريض',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال الاسم';
                          }
                          return null;
                        },
                        control: patient_name,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.number,
                        label: 'العمر',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال العمر';
                          }
                          return null;
                        },
                        control: age,
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
                  label: 'الجنس',
                  validat: (String value) {
                    if (value.isEmpty) {
                      return 'يرجى ادخال المعلومة';
                    }
                    return null;
                  },
                  control: sex,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    buildTextFormFiled(
                      onTap: () {},
                      text: TextInputType.number,
                      label: 'رقم الهاتف',
                      validat: (String value) {
                        if (value.isEmpty) {
                          return 'يرجى ادخال رقم الهاتف';
                        }
                        return null;
                      },
                      control: phone,
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
                            label: 'زمرة الدم',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: blood_type,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'الوجهة من',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: from,
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
                            label: 'الوجهة الى',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: to,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'سوابق مرضية/جراحية',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: illness_history,
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
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'الاعراض والعلامات',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: symptoms,
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
                        label: 'الوعي ',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال المعلومة';
                          }
                          return null;
                        },
                        control: awarness,
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
                            label: 'نمط التنفس',
                            validat: (String value) {
                              if (value.isEmpty) {
                                return 'يرجى ادخال المعلومة';
                              }
                              return null;
                            },
                            control: breathing_type,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: buildTextFormFiled(
                            onTap: () {},
                            text: TextInputType.text,
                            label: 'التنفس(مرة/دقيقة)',
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
                        label: 'النبض',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: heartbeat,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'الاكسجة',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: oxygenation,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'تدعيم o2',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: oxygenation_with_support,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'نسبة التدعيم',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: support_ratio,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'ضغط الدم',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: blood_pressure,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      child: buildTextFormFiled(
                        onTap: () {},
                        text: TextInputType.text,
                        label: 'السكر',
                        validat: (String value) {
                          if (value.isEmpty) {
                            return 'يرجى ادخال تفاصيل الحالة';
                          }
                          return null;
                        },
                        control: diabetes,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          onPressed: () {
                            patientinformation(context);
                          },
                          title: "حفظ"),
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
