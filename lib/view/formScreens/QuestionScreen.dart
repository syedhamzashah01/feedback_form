import 'package:feedback_form/components/button.dart';
import 'package:feedback_form/constant.dart';
import 'package:feedback_form/view/formScreens/AnswerScreen.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final String? department;

  QuestionScreen({
    required this.department,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Map<String, dynamic>> _questions = [];
  List<TextEditingController> _answerControllers = [];

  // Map containing department-specific questions
  final Map<String, List<String>> departmentQuestions = {
    'Computer Science': [
      "How confident do you feel about your programming skills after completing the practical work and labs?",
      "Did the lab sessions help you understand theoretical concepts better? If not, what changes would you suggest?",
      "Was the practical work aligned with the skills taught in lectures? How could it be improved?",
      "Were the labs adequately equipped for all required experiments? What additional resources would be helpful?",
      "How effectively did the practical assignments prepare you for real-world applications? What could enhance this experience?",
      "How well did the method used in practical work align with your learning style? Are there any adjustments you would suggest for better alignment?",
      "Did the approach to practical assignments support incremental learning and skill-building? What changes could improve this progression?",
      "Were the challenges presented in the practical work appropriately challenging and relevant to the theoretical content? How could the difficulty level be adjusted?",
      "How effectively did the method used for practical assignments integrate with the overall course structure? Are there any changes that could enhance this integration?",
      "Was there a clear connection between the objectives of the practical work and your personal learning goals? How could this connection be made more explicit or effective?"
    ],
    'Information Technology': [
      'Is the IT infrastructure adequate for your learning needs?',
      'How would you rate the network management courses?',
      'Are you satisfied with the practical exposure provided in IT labs?',
      'How effective are the IT resources in supporting your coursework?',
      'Do you feel the IT courses cover relevant industry standards and technologies?',
      'How would you assess the quality of support from IT staff and faculty?',
      'Are there any challenges with accessing or using the IT resources?',
      'How do you rate the availability and reliability of IT services such as Wi-Fi and technical support?',
      'Do you think additional IT resources or facilities would benefit your learning experience?',
      'How satisfied are you with the integration of emerging technologies in the curriculum?'
    ],
    'Mathematics': [
      'How effective are the mathematics tutorials?',
      'Do you find the mathematics course materials comprehensive?',
      'How would you rate the mathematical problem-solving sessions?',
      'How engaging are the mathematics tutorials?',
      'Do you find the explanations in the tutorials clear and understandable?',
      'How well do the course materials help you grasp complex mathematical concepts?',
      'How useful are the practice exercises and examples provided?',
      'How would you rate the variety of problems covered in the sessions?',
      'Are the tutorials interactive and aligned with different learning styles?',
      'How effective are the problem-solving sessions in enhancing your skills?'
    ],
    'English': [
      'How engaging are the English literature classes?',
      'Is the language lab helpful in improving your language skills?',
      'How would you rate the English grammar and composition sessions?',
      'How effective are the English literature assignments in enhancing your understanding of the material?',
      'Do you feel the English literature classes are fostering critical thinking and analytical skills?',
      'How accessible are the English instructors for extra help or clarification on course material?',
      'Are the resources provided (books, articles, online materials) sufficient for your needs?',
      'How well do the English classes integrate modern language usage and contemporary literature?',
      'Are there opportunities for you to engage in discussions and debates during English classes?',
      'How satisfied are you with the feedback you receive on your writing and language skills?',
    ],
    'Urdu': [
      'How effective are the Urdu language courses?',
      'Are the Urdu literature classes engaging?',
      'How would you rate the grammar sessions in Urdu?',
      'Do the Urdu language classes improve your speaking skills?',
      'How well do the Urdu courses cover reading comprehension?',
      'Are the writing exercises in Urdu helpful?',
      'Do you feel the Urdu lessons are well-structured?',
      'Are the instructors proficient in teaching Urdu?',
      'Is the course material for Urdu easy to understand?',
      'Would you recommend these Urdu language courses to others?'
    ],
    'Economics': [
      'How well do you understand the concept of supply and demand?',
      'Can you explain the role of inflation in an economy?',
      'What are your thoughts on the impact of government regulation on businesses?',
      'How do you view the balance between economic growth and environmental sustainability?',
      'What is your opinion on income inequality and its effects on society?',
      'How familiar are you with different types of economic systems (e.g., capitalism, socialism)?',
      'What are the primary factors that you think drive economic development in a country?',
      'How do interest rates influence your personal financial decisions?',
      'What role do you think technology plays in modern economics?',
      'How do you perceive the global economic situation and its potential impact on local economies?',
    ]
  };
  int _currentQuestionIndex = 0;
  List<String> _answers = [];
  final _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize answers list to hold empty answers for all questions
    _answers = List.generate(
        departmentQuestions[widget.department]!.length, (index) => '');
  }

  @override
  Widget build(BuildContext context) {
    final questions = departmentQuestions[widget.department]!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: _previousQuestion,
              icon: Icon(Icons.arrow_left, size: 35,color: Colors.white,),
            ),
          backgroundColor: Color(0xff336699),
            title: Text(
          '${widget.department} Questions',
          style: TextStyle(color: Colors.white),
        )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 13),
                  Text(questions[_currentQuestionIndex]),
                  SizedBox(height: 5,),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _answerController,
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: 'Write your Answer',
                      border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1
                            )
                        ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1
                        )
                      )
                    ),
                    onChanged: (text) {
                      _answers[_currentQuestionIndex] = text;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentQuestionIndex > 0)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Color(0xff336699)),
                          onPressed: _previousQuestion,
                          child: Text(
                            'Previous',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff336699),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: _currentQuestionIndex < questions.length - 1
                            ? _nextQuestion
                            : _submitAnswers,
                        child: Text(
                            _currentQuestionIndex < questions.length - 1
                                ? '  Next  '
                                : ' Submit ',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _answerController.text = _answers[_currentQuestionIndex];
    });
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestionIndex--;
      _answerController.text = _answers[_currentQuestionIndex];
    });
  }

  void _submitAnswers() {
    final questions = departmentQuestions[
        widget.department]!; // Assuming questions are correctly retrieved

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Submission Complete", style: H2),
          content: Container(
            height: 100,
            child: Column(
              children: [
                Text("Your answers have been submitted successfully."),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationScreen(
                          questions: questions, // Pass the questions
                          answers: _answers, // Pass the answers
                        ),
                      ),
                    );
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
