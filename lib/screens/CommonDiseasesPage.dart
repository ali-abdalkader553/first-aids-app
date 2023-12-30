import 'package:flutter/material.dart';

import 'DiseasesExplanations.dart';




class CommonDiseasesPage extends StatelessWidget {
  const CommonDiseasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Common Diseases'),
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
                          MaterialPageRoute(builder: (context) => DiseasesExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Button 1',
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
                          MaterialPageRoute(builder: (context) => DiseasesExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Button 2',
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
                          MaterialPageRoute(builder: (context) => DiseasesExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('Button 3', style: TextStyle(color: Colors.white)),
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
                              MaterialPageRoute(builder: (context) => DiseasesExplanations()),
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
                                Text('Button 4', style:
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
                          MaterialPageRoute(builder: (context) => DiseasesExplanations()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:
                          Text('Button 3', style: TextStyle(color: Colors.white)),
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
                              MaterialPageRoute(builder: (context) => DiseasesExplanations()),
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
                                Text('Button 4', style:
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
