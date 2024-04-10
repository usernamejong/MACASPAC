import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SciQuizScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(backgroundColor: Color(0xFF003C43)),
  ));
}

class SciQuizScreen extends StatefulWidget {
  @override
  _SciQuizScreen createState() => _SciQuizScreen();
}

class _SciQuizScreen extends State<SciQuizScreen> {
  int _indexpage = 0;
  int _totalScore = 0;
  List<Map<String, dynamic>> _setquestions = [
    {
      'questionText': '1. What is the hot middle layer of the Earth?',
      'answers': ['Inner Core', 'Outer Core', 'Mantle', 'Crust'],
      'correctAnswer': 'Inner Core',
    },
    {
      'questionText': '2. How many bones are there in an adult human body?',
      'answers': ['196', '104', '304', '206'],
      'correctAnswer': '206',
    },
    {
      'questionText': '3. What is not found in the Shark?',
      'answers': ['Fins', 'Teeth', 'Bones', 'Scale'],
      'correctAnswer': 'Bones',
    },
    {
      'questionText': '4. Which of the following is an element?',
      'answers': ['Ruby', 'Topaz', 'Diamond', 'Amethyst'],
      'correctAnswer': 'Topaz',
    },
    {
      'questionText':
          '5. It is the most abundant element in the universe is thought to be:',
      'answers': ['Hydrogen', 'Helium', 'Carbon', 'Sulfur'],
      'correctAnswer': 'Hydrogen',
    },
    {
      'questionText': '6. Oil, natural gas and coal are examples of what?',
      'answers': [
        'Geothermal Resources',
        'Renewable Resources',
        'Biofuels',
        'Fossil Fuels'
      ],
      'correctAnswer': 'Fossil Fuels',
    },
    {
      'questionText':
          '7. In a cosmic distance, What unit of distance commonly used in astronomy?',
      'answers': ['Kilometers', 'Miles', 'Kilograms', 'Light Years'],
      'correctAnswer': 'Light Years',
    },
    {
      'questionText':
          '8. Which organelle is often referred to as the "powerhouse of the cell"?',
      'answers': ['Nuclues', 'Mitochondria', 'Golgi Apparatus', 'Ribosome'],
      'correctAnswer': 'Mitochondria',
    },
    {
      'questionText':
          '9. What is the process by which plants convert sunlight into chemical energy?',
      'answers': [
        'Respiration',
        'Fermentation',
        'Photosynthesis',
        'Transpiration'
      ],
      'correctAnswer': 'Photosynthesis',
    },
    {
      'questionText':
          '10. What is the function of red blood cells in the human body?',
      'answers': [
        'Fighting Infections',
        'Transporting Oxygen',
        'Producing antibodies',
        'Breaking down food'
      ],
      'correctAnswer': 'Transporting Oxygen',
    },
  ];

  void _answerQuestion(String selectedAnswer) {
    bool isCorrect =
        _setquestions[_indexpage]['answers'].indexOf(selectedAnswer) ==
            _setquestions[_indexpage]['answers']
                .indexOf(_setquestions[_indexpage]['correctAnswer']);
    if (isCorrect) {
      incrementScore();
    }
    setState(() {
      _indexpage++;
    });
  }

  void incrementScore() {
    setState(() {
      _totalScore++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _indexpage = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
      appBar: AppBar(
        backgroundColor: Color(0xFF003C43),
        title: Text(
          'Science Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _indexpage < _setquestions.length
          ? QuizQuestion(
              questionText: _setquestions[_indexpage]['questionText'],
              answers: _setquestions[_indexpage]['answers'],
              answerQuestion: _answerQuestion,
            )
          : QuizResult(
              totalScore: _totalScore,
              resetQuiz: _resetQuiz,
              questions: _setquestions,
            ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String questionText;
  final List<String> answers;
  final Function(String) answerQuestion;

  QuizQuestion(
      {required this.questionText,
      required this.answers,
      required this.answerQuestion});

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
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              )
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

  QuizResult(
      {required this.totalScore,
      required this.resetQuiz,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
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
                            '${index + 1}: ${questions[index]['questionText']} \nCorrect Answer: ${questions[index]['correctAnswer']}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.lightGreen)),
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
