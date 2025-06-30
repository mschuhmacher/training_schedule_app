import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.item, required this.route,});
  final List<dynamic> item;
  final dynamic route;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // TODO: check whether this styling can be achieved by a Flutter widget, instead of padding, opacity, container, column
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          },
          child: MyListViewCard(item: item, index: index),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: item.length,
    );
  }
}

class MyListViewCard extends StatelessWidget {
  const MyListViewCard({
    super.key,
    required this.item,
    required this.index
  });

  final List item;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                item[index].title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Divider(thickness: 1, color: Colors.black),
              // loops through the exerciseList and creates Text widget for each one. ListView iterates through the blockList.
              for (var item in item[index].list)
                Text(
                  item.title,
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
  }
}
