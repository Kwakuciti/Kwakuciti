import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';

class CreateToDo extends StatelessWidget {
  const CreateToDo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create new to do'
          ),
      ),
      body: Form(child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
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
          ),
      const    SizedBox(
        height: 16,
        ),
        TextFormField(
           keyboardType: TextInputType.multiline,
            maxLines: 5,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            label: Text('Description'),
            hintText: 'Please enter description here',
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: customBlue),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(child: TextFormField(
              onTap: (){
                showDatePicker(
                  context: context,
                   initialDate: DateTime.now(), 
                   firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)));
              },
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
            ),
            ),
            const SizedBox(
              width: 20,),
            Expanded(
              child: TextFormField(
              onTap: (){
                showTimePicker(
                  context: context, initialTime: TimeOfDay.now());

              
                
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
            )),
),
        
         
          ]),
           
           
           const SizedBox(height: 35),
      TextButton(
        onPressed: (){},
        child: Text(
          'Create To Do',
          style: TextStyle() ,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: customBlue,
          ),
          ),
        
        ],
      ),
      
      )
      );
      
      
  
  }
}