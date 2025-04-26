import 'package:flutter/material.dart';
import 'package:training_schedule_app/models/session.dart';

// TODO: rewrite to be more generic so it can be used for both week overviews as well as session overviews

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    final blockList = session.blockList;

    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // TODO: check whether this styling can be achieved by a Flutter widget, instead of padding, opacity, container, column
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Opacity(
            opacity: 0.75,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset.fromDirection(1, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    blockList[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.black),
                  // loops through the exerciseList and creates Text widget for each one. ListView iterates through the blockList.
                  for (var exercise in blockList[index].exerciseList)
                    Text(
                      exercise.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: blockList.length,
    );
  }
}
