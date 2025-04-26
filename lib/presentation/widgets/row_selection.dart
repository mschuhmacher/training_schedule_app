import 'package:flutter/material.dart';

// TODO: disable index++ if rowIndex == listLength

// Define function that accepts int to send back and returns void
typedef IntCallback = void Function(int index);

class RowSelection extends StatefulWidget {
  final IntCallback notifyParent;
  final int listLength;
  const RowSelection({required this.notifyParent, required this.listLength, super.key});

  @override
  State<RowSelection> createState() => _RowSelectionState();
}

class _RowSelectionState extends State<RowSelection> {
  int rowIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TODO: replace sizedbox with expanded/flexbile widgets?
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            if (rowIndex > 0) {
              rowIndex--;
              widget.notifyParent(rowIndex);
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: Card(
              color: Colors.blue,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.arrow_back, size: 22),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (rowIndex > 0) {
              rowIndex--;
              widget.notifyParent(rowIndex);
            }
          },
          child: Card(
            color: Colors.blue,
            child: () {
              if (rowIndex > 0) {
                return Container(
                  width: 60,
                  height: 80,
                  child: Center(
                    child: Text(
                      (rowIndex).toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
              return SizedBox(width: 60, height: 80);
            }(),
          ),
        ),
        // Only widget in the row that doesn't need to be tapped
        Card(
          color: Colors.blue,
          child: Container(
            width: 75,
            height: 100,
            child: Center(
              child: Text(
                (rowIndex + 1).toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            rowIndex++;
            widget.notifyParent(rowIndex);
          },
          child: Card(
            color: Colors.blue,
            child: Container(
              width: 60,
              height: 80,
              child: Center(
                child: Text(
                  (rowIndex + 2).toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            rowIndex++;
            widget.notifyParent(rowIndex);
          },
          child: Container(
            alignment: Alignment.center,
            child: Card(
              color: Colors.blue,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Icon(Icons.arrow_forward, size: 22),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
