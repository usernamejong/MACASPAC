import 'package:flutter/material.dart';
import 'package:logen/geoquiz.dart';
import 'package:logen/logicquiz.dart';
import 'package:logen/main.dart';
import 'package:logen/sciquiz.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3FEF7),
      appBar: AppBar(
        backgroundColor: Color(0xFF77B0AA),
        title: Text(
          'HomePage',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFE3FEF7),
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF77B0AA),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://i.ibb.co/SnHdfbh/user-1.png',
                    height: 75,
                  ),
                ),
                Text(
                  '$userName',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Welcome to Mini Quiz Game',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text(
                          'About App',
                        ),
                        content: Text(
                          'The Mini Quiz Game is made by: MACASPAC ROMEL JAMES',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('K')),
                        ]);
                  });
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('App Info'),
                Icon(
                  Icons.info_outline,
                  color: Color(0xff000000),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text(
                          'Are you sure you want to logout?',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Back')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginApp()));
                              },
                              child: Text('Yes')),
                        ]);
                  });
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Logout'),
                Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: ListView(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://i.ibb.co/xJcpJHq/map-1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Instruction'),
                            content: Text(
                                'True or False: Identify the question carefully.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => GeoQuizScreen()),
                                    ),
                                  );
                                },
                                child: Text('Enter'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Geography Quiz\n 10 questions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://scontent.fcrk1-5.fna.fbcdn.net/v/t1.15752-9/419667751_1121809049264106_7115683903236362013_n.png?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGs-7s_fXkxe2nJO139tXCGSWPsht1m5HFJY-yG3WbkcZY-ZujPLFv_h1ss9d9RFGvrys6Cf0oXIWcU0Rab5XcK&_nc_ohc=50pzhLsK6MgAX_fr4Nu&_nc_ht=scontent.fcrk1-5.fna&oh=03_AdSZKxeTQc3bDET6HIpzQN3ntJF0nMUkZi84-LdjPN47BA&oe=6627BECA'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Instruction'),
                            content: Text(
                                'Multiple choice: Read the questions carefully. Press the correct answer.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => SciQuizScreen()),
                                    ),
                                  );
                                },
                                child: Text('Enter'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Science Quiz\n 10 questions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://scontent.fcrk1-3.fna.fbcdn.net/v/t1.15752-9/431178506_1143351116861615_8025919244352123149_n.png?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHmSsa7nAhudqkJVepW3GAzFUVLUkSeW1YVRUtSRJ5bVsfNPo6XyC1_u4HKR5jrU1zD2VT7GuezFnrGyInw05qv&_nc_ohc=-FEe8yk1R7MAX-sUG1W&_nc_ht=scontent.fcrk1-3.fna&oh=03_AdRoysrddxu3iDZUEfwLj4kmmKy12eHo-CwyQgY2Xh46Cw&oe=6627A48D'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Instruction'),
                            content: Text(
                                'Identification: Read the questions carefully. Input the correct answer.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => LogicQuizScreen()),
                                    ),
                                  );
                                },
                                child: Text('Enter'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Logic Quiz\n 10 questions',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
