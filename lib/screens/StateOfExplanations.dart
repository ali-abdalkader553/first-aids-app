/*import 'package:first_aids_app_pro1/screens/DataStateOfExplanations.dart';
import 'package:flutter/material.dart';

import 'DiseasesExplanations.dart';




class StateOfExplanations extends StatelessWidget {
  const StateOfExplanations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('State of explanations'),
      ),

      body: ListView(

        children:[ Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'State 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations(),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'State 2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('State 3', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      width: 150,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                            );
                          },
                          child:
                          Container(decoration:
                          BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                            child:
                            Center(
                                child:
                                Text('State 4', style:
                                TextStyle(color: Colors.white)
                                )
                            ),
                          )
                      )
                  )
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('State 5', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      width: 150,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                            );
                          },
                          child:
                          Container(decoration:
                          BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                            child:
                            Center(
                                child:
                                Text('State 6', style:
                                TextStyle(color: Colors.white)
                                )
                            ),
                          )
                      )
                  )
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('State 7', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      width: 150,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DataStateOfExplanations(firstaidid: '',)),
                            );
                          },
                          child:
                          Container(decoration:
                          BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                            child:
                            Center(
                                child:
                                Text('State 8', style:
                                TextStyle(color: Colors.white)
                                )
                            ),
                          )
                      )
                  )
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DataStateOfExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('State 9', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      width: 150,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DataStateOfExplanations()),
                            );
                          },
                          child:
                          Container(decoration:
                          BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                            child:
                            Center(
                                child:
                                Text('State 10', style:
                                TextStyle(color: Colors.white)
                                )
                            ),
                          )
                      )
                  )
                ],
              ),




            ],
          ),
        ),
        ],
      ),
    );
  }
}
*/