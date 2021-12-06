import 'package:flutter/material.dart';
import 'package:todo_app/utils.dart';
                         class TodoTileView extends StatelessWidget {
  const TodoTileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}



