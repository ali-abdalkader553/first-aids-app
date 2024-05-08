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
      backgroundColor: Colors.redAccent,
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
              'اهلاً بكم في تطبيق الإسعافات الأولية',
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
                      border: InputBorder.none,
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    controller: _passwordControlar,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Password',
                    ),
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
                padding: EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await signIn();

                    Navigator.pop(context);
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
              children: [
                Text(
                  'Register now! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'if you do not register ',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
