import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/radio_provider.dart';

class RadioButtonWidget extends ConsumerWidget {
  final String text;
  final Color categoryColor;
  final int inputValue;
  final VoidCallback onChange;

  const RadioButtonWidget({
    required this.text,
    required this.categoryColor,
    required this.inputValue,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
            activeColor: categoryColor,
            contentPadding: const EdgeInsets.all(0),
            title: Transform.translate(
                offset: const Offset(-22, 0),
                child: Text(text, style: TextStyle(color: categoryColor))),
            value: inputValue,
            groupValue: radio,
            onChanged: (value) => onChange()),
      ),
    );
  }
}
