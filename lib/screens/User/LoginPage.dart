import 'package:flutter/material.dart';

import '../../auth/auth_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginScreenstate();
}

class _LoginScreenstate extends State<LoginPage> {
  final _emailControlar = TextEditingController();
  final _passwordControlar = TextEditingController();

  Future signIn() async {
    await AuthHelper.signIn(
      email: _emailControlar.text.trim(),
      password: _passwordControlar.text.trim(),
    );

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return AuthUser.instance.mainScreen;
      },
    ));
  }

  Future register() async {
    await AuthHelper.register(
      email: _emailControlar.text.trim(),
      password: _passwordControlar.text.trim(),
    );

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return AuthUser.instance.mainScreen;
      },
    ));
  }

  @override
  void dispos() {
    super.dispose();
    _emailControlar.dispose();
    _passwordControlar.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تسجيل الدخول',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'اهلاً بكم في تطبيق الهلال الأحمر',
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    controller: _emailControlar,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(25)),
                      labelText: 'Uesr Name',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  // color: Colors.red[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    controller: _passwordControlar,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await signIn();
                  },
                  child: const Center(
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
