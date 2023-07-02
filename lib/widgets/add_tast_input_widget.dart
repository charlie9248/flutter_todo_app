import 'package:flutter/material.dart';

class AddTaskInputWidget extends StatefulWidget {
  final int maxlines;
  final String hint;
  final TextEditingController txtController;

  const AddTaskInputWidget({
    required this.maxlines,
    required this.hint,
    required this.txtController,
    super.key,
  });

  @override
  State<AddTaskInputWidget> createState() => _AddTaskInputWidgetState();
}

class _AddTaskInputWidgetState extends State<AddTaskInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: widget.txtController,
          maxLines: widget.maxlines,
          decoration: InputDecoration(
              hintText: widget.hint,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ));
  }
}
