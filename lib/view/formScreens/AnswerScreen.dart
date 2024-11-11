import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For clipboard copy (optional)
import 'package:printing/printing.dart'; // To print or save the PDF
import 'package:pdf/pdf.dart'; // For generating PDFs
import 'package:pdf/widgets.dart' as pw; // For using widgets in the PDF

class ConfirmationScreen extends StatefulWidget {
  final List<String> questions;
  final List<String> answers;

  ConfirmationScreen({required this.questions, required this.answers});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  late List<String> _answers; // To allow editing of answers

  @override
  void initState() {
    super.initState();
    // Initialize answers for editing
    _answers = List.from(widget.answers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          icon: Icon(Icons.arrow_left, size: 35,color: Colors.white,),
        ),
         backgroundColor:Color(0xff336699),
         title: Text("Confirmation",style: TextStyle(color: Colors.white),),
        actions: [
          // Print Icon Button
          IconButton(
            icon: Icon(Icons.print, color: Colors.white,),
            onPressed: _printAnswers, // Call the print function
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.questions[index],style: TextStyle(fontSize: 18),),
            subtitle: Text(_answers[index],style: TextStyle(fontSize: 15),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Edit Icon Button
                IconButton(
                  icon: Icon(Icons.edit, color: Color(0xff336699),),
                  onPressed: () => _editAnswer(index), // Edit answer at index
                ),
                // Delete Icon Button
                IconButton(
                  icon: Icon(Icons.delete,color: Color(0xff336699),),
                  onPressed: () => _deleteAnswer(index), // Delete answer at index
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Function to delete an answer
  void _deleteAnswer(int index) {
    setState(() {
      _answers[index] = ''; // Clear the answer at the given index
    });
  }

  // Function to edit an answer
  void _editAnswer(int index) {
    TextEditingController _controller = TextEditingController();
    _controller.text = _answers[index]; // Set current answer in the controller

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Answer'),
          content: TextField(
            controller: _controller,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Your Answer',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _answers[index] = _controller.text; // Update the answer
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to print or download the answers
  void _printAnswers() async {
    // Generate the PDF with questions and answers
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4, // Standard A4 size page
        margin: pw.EdgeInsets.all(20), // Add margins if necessary
        build: (pw.Context context) {
          return [
            pw.ListView.builder(
              itemCount: widget.questions.length,
              itemBuilder: (context, index) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Question ${index + 1}: ${widget.questions[index]}',
                        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 10), // Add space between question and answer
                    pw.Text('Answer: ${_answers[index]}',
                        style: pw.TextStyle(fontSize: 12)),
                    pw.Divider(), // Add a divider between each question and answer
                    pw.SizedBox(height: 20), // Space before the next question
                  ],
                );
              },
            ),
          ];
        },
      ),
    );

    // Print or save the PDF using the printing package
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

}
