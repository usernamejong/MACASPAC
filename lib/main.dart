import 'package:flutter/material.dart';
import 'package:logen/home.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3FEF7),
      appBar: AppBar(
        backgroundColor: Color(0xFF77B0AA),
        title: Text('Mini Quiz Game',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://scontent.fcrk1-3.fna.fbcdn.net/v/t1.15752-9/431111024_1441785949761302_8626038208963779296_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFYfQJ-EcolXB2RCRdtWkFDzGqYgOq6QPjMapiA6rpA-LYRVDGTR_xjp8VSz1JjUuB9m3YEh66BhAW2K5qJ0sz4&_nc_ohc=DZZ_URG3OXUAX8qB-Bn&_nc_ht=scontent.fcrk1-3.fna&oh=03_AdQAKoqoferSdLNPnGR2lVFZdjLXOH9mciB3c8-xrMsKwA&oe=6627A48F',
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          userName: _nameController.text,
                        ),
                      ),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
