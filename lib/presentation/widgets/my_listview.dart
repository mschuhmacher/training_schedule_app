import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/providers/session_provider.dart';
import 'package:training_schedule_app/themes/app_shadow.dart';
import 'package:training_schedule_app/themes/app_text_styles.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.item,
    this.setIndex,
    this.route,
  });
  final List<dynamic> item;
  final dynamic route;
  final void Function(int index)? setIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Consumer<SessionProvider>(
          builder: (context, trainingData, child) {
            return GestureDetector(
              onTap: () {
                if (setIndex != null) {
                  // setIndex in not a required parameter
                  setIndex!(index);
                }
                if (route != null) {
                  // route is not a required parameter.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => route),
                  );
                }
              },
              child: MyListViewCard(item: item, index: index),
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: item.length,
    );
  }
}

class MyListViewCard extends StatelessWidget {
  const MyListViewCard({super.key, required this.item, required this.index});

  final List item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 0.25,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          color: Theme.of(context).colorScheme.surfaceBright,
          boxShadow: context.shadowSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(item[index].title, style: context.title),
            Divider(
              thickness: 0.75,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            // loops through the exerciseList and creates Text widget for each one. ListView iterates through the blockList.
            for (var item in item[index].list)
              Text(item.title, style: context.bodyMedium),
          ],
        ),
      ),
    );
  }
}
