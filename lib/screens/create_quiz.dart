import 'package:flutter/material.dart';
import 'package:quiz_app/shared/constants.dart';
import 'package:quiz_app/shared/loading.dart';
import 'package:quiz_app/screens/select_quiz.dart';

class CreateQuiz extends StatefulWidget {

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {


  // number of questions
  int countQuestion = 1;
  // int maxNumberOfQuestions = 10;
  int? maxNumberOfQuestions = int.tryParse(Value.getString());

  //text field state
  String question = "";
  String options1 = "";
  String options2 = "";
  String options3 = "";
  String options4 = "";

  String error = "";


  // for check box
  bool _isCheckedOption1 = false;
  bool _isCheckedOption2 = false;
  bool _isCheckedOption3 = false;
  bool _isCheckedOption4 = false;

  // for loading screen
  bool loading = false;


  // for form validation
  final _formKey = GlobalKey<FormState>();

  final _controllerQuestion = TextEditingController();
  final _controllerOption1 = TextEditingController();
  final _controllerOption2 = TextEditingController();
  final _controllerOption3 = TextEditingController();
  final _controllerOption4 = TextEditingController();




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
        automaticallyImplyLeading: false,
      ),
      body: loading ? const Loading() : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child:Stack(
          children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      // 1st row for question number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            "Question $countQuestion",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "$countQuestion/$maxNumberOfQuestions",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),



                      const SizedBox(height: 20.0,),

                      ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(),
                        child: TextFormField(
                          minLines: 5,
                          maxLines: 100,
                          decoration: textInputDecoration.copyWith(
                            hintText: "Type your question here",

                              // for camera OCR
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.camera_alt_outlined,color: Colors.black38,),
                                onPressed: (){},
                              )
                          ),
                          controller: _controllerQuestion,
                          validator: (val) => val!.isEmpty ? "Enter your question" : null,
                          onChanged: (val) {
                            setState(() {
                              question = val;
                            });
                          },
                        ),
                      ),


                      const SizedBox(height: 50.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [

                          Text(
                            "Options",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "Answer",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),


                      const SizedBox(height: 20.0,),


                      // for option 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(width: 300),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 100,
                              decoration: textInputDecoration.copyWith(
                                  hintText: "Option 1",

                                  // for camera OCR
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined,color: Colors.black38,),
                                    onPressed: (){},
                                  )
                              ),
                              controller: _controllerOption1,
                              validator: (val) => val!.isEmpty ? "Options 1 is blank" : null,
                              onChanged: (val) {
                                setState(() {
                                  options1 = val;
                                });
                              },
                            ),
                          ),

                          Checkbox(
                            value: _isCheckedOption1,
                            // ignore: avoid_types_as_parameter_names
                            onChanged: (bool) {
                              setState(() {
                                _isCheckedOption1 = !_isCheckedOption1;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0,),


                      // for option 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(width: 300),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 100,
                              decoration: textInputDecoration.copyWith(
                                  hintText: "Option 2",

                                  // for camera OCR
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined,color: Colors.black38,),
                                    onPressed: (){},
                                  )
                              ),
                              controller: _controllerOption2,
                              validator: (val) => val!.isEmpty ? "Options 2 is blank" : null,
                              onChanged: (val) {
                                setState(() {
                                  options2 = val;
                                });
                              },
                            ),
                          ),

                          Checkbox(
                            value: _isCheckedOption2,
                            // ignore: avoid_types_as_parameter_names
                            onChanged: (bool) {
                              setState(() {
                                _isCheckedOption2 = !_isCheckedOption2;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0,),


                      // for option 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(width: 300),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 100,
                              decoration: textInputDecoration.copyWith(
                                  hintText: "Option 3",

                                  // for camera OCR
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined,color: Colors.black38,),
                                    onPressed: (){},
                                  )
                              ),
                              controller: _controllerOption3,
                              validator: (val) => val!.isEmpty ? "Options 3 is blank" : null,
                              onChanged: (val) {
                                setState(() {
                                  options3 = val;
                                });
                              },
                            ),
                          ),

                          Checkbox(
                            value: _isCheckedOption3,
                            // ignore: avoid_types_as_parameter_names
                            onChanged: (bool) {
                              setState(() {
                                _isCheckedOption3 = !_isCheckedOption3;
                              });
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0,),


                      // for option 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(width: 300),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 100,
                              decoration: textInputDecoration.copyWith(
                                  hintText: "Option 4",

                                  // for camera OCR
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.camera_alt_outlined,color: Colors.black38,),
                                    onPressed: (){},
                                  )
                              ),
                              controller: _controllerOption4,
                              validator: (val) => val!.isEmpty ? "Options 4 is blank" : null,
                              onChanged: (val) {
                                setState(() {
                                  options4 = val;
                                });
                              },
                            ),
                          ),

                          Checkbox(
                            value: _isCheckedOption4,
                            // ignore: avoid_types_as_parameter_names
                            onChanged: (bool) {
                              setState(() {
                                _isCheckedOption4 = !_isCheckedOption4;
                              });
                            },
                          ),
                        ],
                      ),


                      const SizedBox(height: 30.0,),


                      ButtonTheme(
                        minWidth: 200.0,
                        height: 50.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular((32.0)),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_isCheckedOption1 || _isCheckedOption2 || _isCheckedOption3 || _isCheckedOption4 ){
                                setState(() {
                                  error = "";
                                  loading = true;
                                });


                                print(question);
                                print(options1);
                                print(options2);
                                print(options3);
                                print(options4);

                                // check correct option :
                                if (_isCheckedOption1) {
                                  print("Correct option: $options1");
                                }
                                if (_isCheckedOption2) {
                                  print("Correct option: $options2");
                                }
                                if (_isCheckedOption3) {
                                  print("Correct option: $options3");
                                }
                                if (_isCheckedOption4) {
                                  print("Correct option: $options4");
                                }

                                // re-initialize all variable
                                _controllerQuestion.clear();
                                _controllerOption1.clear();
                                _controllerOption2.clear();
                                _controllerOption3.clear();
                                _controllerOption4.clear();

                                _isCheckedOption1 = false;
                                _isCheckedOption2 = false;
                                _isCheckedOption3 = false;
                                _isCheckedOption4 = false;

                                setState(() {
                                  countQuestion += 1;
                                  loading = false;
                                });
                                if (countQuestion > maxNumberOfQuestions!) {
                                  Navigator.pop(context);

                            }
                              }
                              else {
                                setState(() {
                                  error = "Please select correct options";
                                });
                              }
                            }
                          },
                         ),
                        ),


                      const SizedBox(height: 10.0,),

                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
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
