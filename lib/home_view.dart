import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';

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
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.pink,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plan a trip to Brazil',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: customBlue,
                        )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Chairman One.How are yo''Chairman One.How are you doing?'' ''u doing?'' ',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,fontSize: 16,
                          ),
                        )
                  ],
                ),
              ),
              const SizedBox(width: 15,),
              Row(
                children: [
                  Icon(Icons.notifications,color: Colors.pink,),
                  Text('Yesterday', style: TextStyle(color: Colors.pink),)
                ],
              )
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
          backgroundColor: Colors.black),
          bottomNavigationBar: SafeArea(),
    );
  }
}

class SafeArea extends StatelessWidget {
  const SafeArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(37, 43, 103, 0.4),
        child: Padding(
          padding: const EdgeInsets.all(15),
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
    );
  }
} 
