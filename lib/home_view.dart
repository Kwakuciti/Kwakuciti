

import 'package:flutter/material.dart';
import 'package:todo_app/todotile_view.dart';
import 'package:todo_app/utils.dart';
import 'package:todo_app/views/create_todo.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/FB_IMG_15933634404490723.jpg'),
          ),
        ),
        title: Text(
          'My Task',
        ),
        elevation: 0,
        actions: [
          Icon(Icons.sort),
          Icon(Icons.search),
        ],
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return const TodoTileView();
        }, 
        separatorBuilder: (context,index){
          return const SizedBox(
            height: 15,
          );
        },
         itemCount: 5),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const CreateToDo();
            }));
          },
          backgroundColor: Colors.black),
          bottomNavigationBar: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(37, 43, 103, 0.4),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: InkWell(
            onTap: (){
              showBarModalBottomSheet(
                context: context,
                 builder: (context){
                   return  CompletedToDo();
                 });
            },
            child: Row(
              
              children: [
                Icon(Icons.check_circle_rounded,
                color: customBlue
                ),
                const SizedBox(width: 10,),
                Row(
                  children: [
                    Text(
                      'Completed',
                     style: TextStyle(color: customBlue, fontWeight: FontWeight.w600),
                     ),
                     Icon(Icons.keyboard_arrow_down,color: customBlue,),
                  ],
                ),
                const Spacer(),
                 Text('24', style: TextStyle(color: customBlue),)
              ],
            ),
          ),
        ),
      ),
    )
  ),
    );
  }
}

class CompletedToDo extends StatelessWidget {
  const CompletedToDo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.check_circle,
          color: Colors.pink,
          ),
          title: Text(
            'Plan a trip to Ghana',
            style: TextStyle(color: Colors.blue),
            ),
            subtitle: Text(
              'Lorem is the guy i want',
              style: TextStyle(
                color: Colors.black,
              ),
              ),
              trailing: Row(
             mainAxisSize: MainAxisSize.min,   children: [
                  Icon(Icons.notifications,color: Colors.pink,),
                  Text(
                    'Yesterday',
                    style: TextStyle(color: Colors.pink),
                    )
                ],
              ),
        
      ),
    );
  }
}

