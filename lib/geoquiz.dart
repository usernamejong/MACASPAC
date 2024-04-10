import 'package:flutter/material.dart';
import 'package:logen/home.dart';

void main() {
  runApp(MaterialApp(
    home: GeoQuizScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      backgroundColor: Color(0xFF003C43),
    ),
  ));
}

class GeoQuizScreen extends StatefulWidget {
  @override
  _GeoQuizScreen createState() => _GeoQuizScreen();
}

class _GeoQuizScreen extends State<GeoQuizScreen> {
  int _indexPage = 0;
  int _totalScore = 0;
  List<Map<String, dynamic>> _setQuestions = [
    {
      'questionText': '1. Identify the flag of Belgium',
      'answers': [
        'https://i.ibb.co/SNcKKgj/lebanon.png',
        'https://i.ibb.co/MnXNmLn/south-korea.png',
        'https://i.ibb.co/Bq35HhT/belgium.png',
        'https://i.ibb.co/0fpnHw4/greece.png',
      ],
      'correctAnswer': 'https://i.ibb.co/Bq35HhT/belgium.png',
    },
    {
      'questionText': '2. Identify the flag of Czech Republic',
      'answers': [
        'https://i.ibb.co/P5zMbt4/czech-republic.png',
        'https://i.ibb.co/23pGtHL/spain.png',
        'https://i.ibb.co/BBdP2zg/sweden.png',
        'https://i.ibb.co/3vkv4LL/iraq.png',
      ],
      'correctAnswer': 'https://i.ibb.co/P5zMbt4/czech-republic.png',
    },
    {
      'questionText': '3. Identify the flag of Lebanon',
      'answers': [
        'https://i.ibb.co/4NzKbtP/ireland.png',
        'https://i.ibb.co/ry5ZSf8/nepal.png',
        'https://i.ibb.co/sqxNNP0/south-africa.png',
        'https://i.ibb.co/SNcKKgj/lebanon.png',
      ],
      'correctAnswer': 'https://i.ibb.co/SNcKKgj/lebanon.png',
    },
    {
      'questionText': '4. Identify the flag of Angola',
      'answers': [
        'https://i.ibb.co/bKBfPbV/jamaica-1.png',
        'https://i.ibb.co/JBJYhtV/papua-new-guinea.png',
        'https://i.ibb.co/NxPsb2h/burkina-faso.png',
        'https://i.ibb.co/tZYCQyd/angola.png',
      ],
      'correctAnswer': 'https://i.ibb.co/tZYCQyd/angola.png',
    },
    {
      'questionText': '5. Identify the flag of South Korea',
      'answers': [
        'https://i.ibb.co/MnXNmLn/south-korea.png',
        'https://i.ibb.co/2MXqN62/japan.png',
        'https://i.ibb.co/P5zMbt4/czech-republic.png',
        'https://i.ibb.co/fN219cJ/netherlands.png',
      ],
      'correctAnswer': 'https://i.ibb.co/MnXNmLn/south-korea.png',
    },
    {
      'questionText': '6. Identify the flag of Iran',
      'answers': [
        'https://i.ibb.co/DWCbKpy/albania.png',
        'https://i.ibb.co/JHKMFxQ/iran.png',
        'https://i.ibb.co/f8X9gMN/chad.png',
        'https://i.ibb.co/BNHdv4w/yemen.png',
      ],
      'correctAnswer': 'https://i.ibb.co/JHKMFxQ/iran.png',
    },
    {
      'questionText': '7. Identify the flag of Greece',
      'answers': [
        'https://i.ibb.co/0fpnHw4/greece.png',
        'https://i.ibb.co/HKZF1z3/honduras.png',
        'https://i.ibb.co/DpQpWJw/israel.png',
        'https://i.ibb.co/cTS9Sy8/tunisia.png',
      ],
      'correctAnswer': 'https://i.ibb.co/0fpnHw4/greece.png',
    },
    {
      'questionText': '8. Identify the flag of Israel',
      'answers': [
        'https://i.ibb.co/r41GvFh/syria.png',
        'https://i.ibb.co/0fpnHw4/greece.png',
        'https://i.ibb.co/DpQpWJw/israel.png',
        'https://i.ibb.co/cDykyT7/indonesia.png',
      ],
      'correctAnswer': 'https://i.ibb.co/DpQpWJw/israel.png',
    },
    {
      'questionText': '9. Identify the flag of Chad',
      'answers': [
        'https://i.ibb.co/HKZF1z3/honduras.png',
        'https://i.ibb.co/0fpnHw4/greece.png',
        'https://i.ibb.co/P5zMbt4/czech-republic.png',
        'https://i.ibb.co/f8X9gMN/chad.png',
      ],
      'correctAnswer': 'https://i.ibb.co/f8X9gMN/chad.png',
    },
    {
      'questionText': '10. Identify the flag of Anguilla',
      'answers': [
        'https://i.ibb.co/QNvrdky/anguilla.png',
        'https://i.ibb.co/r41GvFh/syria.png',
        'https://i.ibb.co/6vZz0gV/bangladesh.png',
        'https://i.ibb.co/BNHdv4w/yemen.png',
      ],
      'correctAnswer': 'https://i.ibb.co/QNvrdky/anguilla.png',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    bool isCorrect =
        selectedAnswer == _setQuestions[_indexPage]['correctAnswer'];
    if (isCorrect) {
      incrementScore();
    }
    setState(() {
      _indexPage++;
    });
  }

  void incrementScore() {
    setState(() {
      _totalScore++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _indexPage = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
      appBar: AppBar(
        backgroundColor: Color(0xFF003C43),
        title: Text('Science Quiz', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: _indexPage < _setQuestions.length
          ? QuizQuestion(
              questionText: _setQuestions[_indexPage]['questionText'],
              answers: _setQuestions[_indexPage]['answers'],
              answerQuestion: _answerQuestion,
            )
          : QuizResult(
              totalScore: _totalScore,
              resetQuiz: _resetQuiz,
              questions: _setQuestions,
            ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String questionText;
  final List<String> answers;
  final Function(String) answerQuestion;

  QuizQuestion({
    required this.questionText,
    required this.answers,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 150, 10, 20),
          child: Column(
            children: [
              Text(
                questionText,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 2.0,
                ),
                itemCount: answers.length,
                itemBuilder: (BuildContext context, int index) {
                  var answer = answers[index];
                  return ElevatedButton(
                    onPressed: () => answerQuestion(answer),
                    child: Image.network(
                      answer, // Use the answer URL as the image source
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResult extends StatelessWidget {
  final int totalScore;
  final void Function() resetQuiz;
  final List<Map<String, dynamic>> questions;

  QuizResult({
    required this.totalScore,
    required this.resetQuiz,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003C43),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (totalScore >= 7)
              ClipRRect(
                child: Image.network(
                  'https://i.ibb.co/8swxksF/best.png',
                  height: 150,
                ),
              )
            else
              ClipRRect(
                child: Image.network(
                  'https://i.ibb.co/vHhnsVC/fail.png',
                  height: 150,
                ),
              ),
            Text(
              'Quiz Result:',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $totalScore',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${index + 1}: ${questions[index]['questionText']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Image.network(
                        questions[index]
                            ['correctAnswer'], // Display image instead of text
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: resetQuiz,
                  icon: Icon(Icons.refresh),
                  label: Text('Restart Quiz'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home),
                  label: Text('Homepage'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
