import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_quiz.dart';
import 'package:quiz_app/shared/constants.dart';

class SelectQuiz extends StatefulWidget {
  const SelectQuiz({Key? key}) : super(key: key);

  @override
  _SelectQuizState createState() => _SelectQuizState();
}

class _SelectQuizState extends State<SelectQuiz> {
  List<String> className = ['X', 'XII'];
  List<String> board = ['WBBSE', 'CBSE'];
  List<String> subject = ['Math', 'English'];
  List<String> mathChapter = ['Math chapter 1', 'Math chapter 2', 'Math chapter 3', 'Math chapter 4', 'Math chapter 5'];
  List<String> englishChapter = ['English chapter 1', 'English chapter 2', 'English chapter 3', 'English chapter 4', 'English chapter 5'];



  List<String> chapter = [];
  String? selectClassName;
  String? selectBoard;
  String? selectSubject;
  String? selectChapter;




  // form
  //text field state
  String noOfQuestion = "";
  String tags = "";
  String addNotes = "";

  String error = "";

  // for loading screen
  bool loading = false;


  // for form validation
  final _formKey = GlobalKey<FormState>();


  final _controllerNoOfQuestion = TextEditingController();
  final _controllerTags = TextEditingController();
  final _controllerAddNotes = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Create Quiz",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Stack(
          children: [
          //  form
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Class Dropdown
                  const Text(
                    "Class",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButtonFormField<String>(
                      decoration: textInputDecoration,
                      hint: const Text('Select class'),
                      value: selectClassName,
                      validator: (value) => value == null ? 'Select class' : null,
                      isExpanded: true,
                      items: className.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectClassName = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0,),


                  // Board dropdown
                  const Text(
                    "Board",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButtonFormField<String>(
                      decoration: textInputDecoration,
                      hint: const Text('Select board'),
                      value: selectBoard,
                      validator: (value) => value == null ? 'Select board' : null,
                      isExpanded: true,
                      items: board.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectBoard = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0,),



                  // Subject dropdown
                  const Text(
                    "Subject",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButtonFormField<String>(
                      decoration: textInputDecoration,
                      hint: const Text('Select subject'),
                      value: selectSubject,
                      validator: (value) => value == null ? 'Select subject' : null,
                      isExpanded: true,
                      items: subject.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if(val == "Math") {
                          chapter = mathChapter;
                        } else if (val == "English") {
                          chapter = englishChapter;
                        } else {
                          chapter = [];
                        }
                        setState(() {
                          // selectChapter = null;
                          selectSubject = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0,),


                  // Chapter dropdown
                  const Text(
                    "Chapter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: const Text('Select chapter'),
                      value: selectChapter,
                      validator: (value) => value == null ? 'Select chapter' : null,
                      isExpanded: true,
                      items: chapter.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectChapter = val.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0,),

                  // No of question
                  const Text(
                    "No. of Questions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(),
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: "How many question you create",
                        ),
                        keyboardType: TextInputType.number,
                        controller: _controllerNoOfQuestion,
                        validator: (val) => val!.isEmpty ? "Empty" : null,
                        onChanged: (val) {
                          setState(() {
                            noOfQuestion = val;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),


                  // tags
                  const Text(
                    "Tags",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(),
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Math, BHS",
                        ),
                        controller: _controllerTags,
                        onChanged: (val) {
                          setState(() {
                            tags = val;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),


                  // Add notes
                  const Text(
                    "Add notes (140 Words Max)",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(),
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                          hintText: "Add notes",
                        ),
                        controller: _controllerAddNotes,
                        onChanged: (val) {
                          setState(() {
                            addNotes = val;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),



                  // Next button
                  Center(
                    child: ButtonTheme(
                      minWidth: 300.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular((32.0)),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print(selectClassName);
                            print(selectBoard);
                            print(selectSubject);
                            print(selectChapter);
                            print(noOfQuestion);
                            print(tags);
                            print(addNotes);
                            Value.setString(noOfQuestion);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreateQuiz()),
                            );
                          }
                        },
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// max number of question count
class Value {
  static String value="";
  static void setString(String newValue) {
    value = newValue;
  }

  static String getString() {
    return value;
  }
}

