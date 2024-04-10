import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LogicQuizScreen(),
    theme: ThemeData(backgroundColor: Color(0xFF003C43)),
  ));
}

class LogicQuizScreen extends StatefulWidget {
  @override
  _LogicQuizScreenState createState() => _LogicQuizScreenState();
}

class _LogicQuizScreenState extends State<LogicQuizScreen> {
  final TextEditingController answerController = TextEditingController();
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool _isMounted = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What has keys but can\'t open locks?',
      'answer': 'Piano',
    },
    {
      'question':
          'I am not alive, but I grow, I don\'t have lungs, but need I don\'t have a mouth, but water kills me. What am I?',
      'answer': 'Fire',
    },
    {
      'question': 'What has a head, a tail, is brown, and has no legs?',
      'answer': 'Coin',
    },
    {
      'question': 'What has a face and two hands but no arms or legs?',
      'answer': 'Clock',
    },
    {
      'question': 'What has a neck but no head?',
      'answer': 'Bottle',
    },
    {
      'question':
          'I have keys but no locks. I have space but no room. You can enter, but can\'t go outside. What am I?',
      'answer': 'Keyboard',
    },
    {
      'question':
          'The person who makes it sells it. The person who buys it never uses it. The person who uses it never knows they\'re using it. What is it?',
      'answer': 'Coffin',
    },
    {
      'question': 'I am full of holes, but I can hold water. What am I?',
      'answer': 'Sponge',
    },
    {
      'question':
          'I am not alive, but I can die. I am not solid, but I can melt. I am not wet, but I can drip. What am I?',
      'answer': 'Ice',
    },
    {
      'question': 'The more you take, the more you leave behind. What am I?',
      'answer': 'Footsteps',
    },
  ];

  @override
  void initState() {
    super.initState();
    _isMounted = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  void submitAnswer() {
    if (!_isMounted) return; // Check if the widget is mounted
    String userAnswer = answerController.text.toLowerCase().trim();
    String correctAnswer =
        questions[currentQuestionIndex]['answer'].toString().toLowerCase();
    if (userAnswer == correctAnswer) {
      setState(() {
        correctAnswers++;
      });
    }
    answerController.clear();
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (!_isMounted) return; // Check if the widget is mounted
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showResults();
    }
  }

  void resetQuiz() {
    if (!_isMounted) return; // Check if the widget is mounted
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
    });
  }

  void showResults() {
    if (!_isMounted) return; // Check if the widget is mounted
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultScreen(
          totalScore: correctAnswers,
          resetQuiz: resetQuiz,
          questions: questions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
      appBar: AppBar(
        backgroundColor: Color(0xFF003C43),
        title: Text('Logic Quiz', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 150, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${currentQuestionIndex + 1}: ${questions[currentQuestionIndex]['question']}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: answerController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Type your answer here...',
                    border: OutlineInputBorder(),
                    focusColor: Colors.white),
                onSubmitted: (_) => submitAnswer(),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: submitAnswer,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final int totalScore;
  final void Function() resetQuiz;
  final List<Map<String, dynamic>> questions;

  QuizResultScreen({
    required this.totalScore,
    required this.resetQuiz,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF135D66),
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
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
            SizedBox(height: 20),
            Text(
              'Quiz Completed!',
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
            SizedBox(height: 20),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '${index + 1}: ${questions[index]['question']} \nCorrect Answer: ${questions[index]['answer']}}',
                      style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogicQuizScreen()));
                  },
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
