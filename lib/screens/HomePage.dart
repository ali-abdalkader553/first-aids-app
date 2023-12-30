import 'package:flutter/material.dart';
import 'CommonDiseasesPage.dart';
import 'EmergencyNumbersPage.dart';
import 'FirstAidsPage.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepOrangeAccent,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstAidPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'First Aids',
                      style: TextStyle(color: Colors.white),

                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmergencyNumberPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Emergency Number',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommonDiseasesPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Common Diseases',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width :250, height :50,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()  ),
                  );
                },
                child: Container(
                  decoration:BoxDecoration(
                      color:Colors.purple,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}