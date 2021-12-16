import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:intl/intl.dart';

class CreateToDo extends StatefulWidget {
  const CreateToDo({Key? key}) : super(key: key);

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TodoController _todoController = TodoController();

  set isloading(bool isloading) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create new to do'),
        ),
        body: Form(
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  label: Text(
                    'Title',
                  ),
                  hintText: 'Please input your title here',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: customBlue),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter a Title';
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {}
                },
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  label: Text('Description'),
                  hintText: 'Please enter description here',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: customBlue),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(children: [
                Expanded(
                  child: TextFormField(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)))
                          .then((value) {
                        setState(() {
                          _dateController.text =
                              DateFormat.yMMMd().format(value!);
                        });
                      });
                    },
                    controller: _dateController,
                    keyboardType: TextInputType.datetime,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 1,
                    decoration: InputDecoration(
                      label: Text('Date'),
                      hintText: 'Please select a date',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: customBlue),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select a date';
                      }
                      if (value == DateFormat.yMMMd().format(DateTime.now())) {
                        return 'You Selected today\'s date';
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            _timeController.text = value!.format(context);
                          });
                        });
                      },
                      keyboardType: TextInputType.datetime,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      decoration: InputDecoration(
                        label: Text('Time'),
                        hintText: ' Time',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: customBlue),
                        ),
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Please Select a time';
                        }
                      },
                      ),
                ),
              ]),
              const SizedBox(height: 35),
              TextButton(
                onPressed: ()async {
                  if (_formkey.currentState!.validate()) {
                    String dateTime = _dateController.text + " " + _timeController.text;
                    //Todo isLoading
                    setState(() {
                      
                    });

                      bool isSucessful = await _todoController.createTodo(
                        title: _timeController.text,
                         description: _descriptionController.text,
                          dateTime: dateTime);
                          setState(() {
                            isloading = false;
                          });
                      if (isSucessful) {
                        // do something
                        _titleController.clear();
                        _descriptionController.clear();
                        _dateController.clear();
                        _timeController.clear();
                        SnackBar snackBar = const SnackBar(content: Text('Todo created successfuliy',
                        style: TextStyle(color: Colors.green),
                        ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        //failed 
                        SnackBar snackBar = const SnackBar(content: Text('Failed to create Todo',
                        style: TextStyle(color: Colors.red),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                  }
                  else{
                    SnackBar snackBar = const SnackBar(content: Text('All fields are requird',
                    style:  TextStyle(color: Colors.blue),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  

                },
                child: Text(
                  'Create To Do',
                  style: TextStyle(),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: customBlue,
                ),
              ),
            ],
          ),
        ));
  }
}
