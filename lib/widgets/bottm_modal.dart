import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/model/model.dart';
import 'package:flutter_todo_app/provider/date_provider.dart';
import 'package:flutter_todo_app/services/todo_service.dart';
import 'package:flutter_todo_app/widgets/radio_button.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../constants/app-style.dart';
import '../provider/radio_provider.dart';
import 'add_tast_input_widget.dart';

class BottomModal extends ConsumerWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  BottomModal({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      )),
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: double.infinity,
            child: Text(
              'New Task Todo',
              style: AppStyle.taskHeadingNewAtsk,
              textAlign: TextAlign.center,
            )),
        const Gap(10),
        Divider(height: 0.5, color: Colors.grey.shade400),
        const Gap(15),
        const Text(
          'Title Task',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(10),
        AddTaskInputWidget(
          hint: "Add task name",
          maxlines: 1,
          txtController: titleController,
        ),
        const Gap(20),
        const Text(
          'Description',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(10),
        AddTaskInputWidget(
          hint: "Add task name",
          maxlines: 4,
          txtController: descriptionController,
        ),
        const Gap(10),
        const Text(
          'Category',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioButtonWidget(
                inputValue: 1,
                text: 'LNR',
                categoryColor: Colors.green.shade700,
                onChange: () {
                  ref.read(radioProvider.notifier).update((state) => 1);
                },
              ),
            ),
            Expanded(
              child: RadioButtonWidget(
                inputValue: 2,
                text: 'WRK',
                categoryColor: Colors.blue.shade700,
                onChange: () {
                  ref.read(radioProvider.notifier).update((state) => 2);
                },
              ),
            ),
            Expanded(
              child: RadioButtonWidget(
                inputValue: 3,
                text: 'GEN',
                categoryColor: Colors.amber.shade700,
                onChange: () {
                  ref.read(radioProvider.notifier).update((state) => 3);
                },
              ),
            )
          ],
        ),
        const Gap(10),
        Row(
          children: [
            DateTimeWidget(
              icon: Icons.calendar_month,
              text: ref.watch(dateProvider),
              titleText: 'Date',
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025));

                if (date != null) {
                  ref
                      .read(dateProvider.notifier)
                      .update((state) => DateFormat.yMd().format(date));
                }
              },
            ),
            const Gap(20),
            DateTimeWidget(
              icon: Icons.schedule,
              text: ref.watch(timeProvider),
              titleText: "Time",
              onTap: () async {
                final time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (time != null) {
                  ref
                      .watch(timeProvider.notifier)
                      .update((state) => time.format(context));
                }
              },
            )
          ],
        ),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade400),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
            ),
            const Gap(20),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    final radioInput = ref.watch(radioProvider);
                    String category = '';

                    switch (radioInput) {
                      case 1:
                        category = "Learning";
                        break;
                      case 2:
                        category = "Work";
                        break;
                      case 3:
                        category = "General";
                        break;
                    }

                    ref.read(todoServideProvider).addNewTask(TodoModel(
                        dateTask: ref.read(dateProvider),
                        timeTask: ref.read(timeProvider),
                        category: category,
                        description: descriptionController.text,
                        titleTask: titleController.text));

                    print('saving data');
                  },
                  child: const Text('save')),
            )
          ],
        )
      ]),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final String titleText;
  final Function onTap;
  const DateTimeWidget({
    required this.icon,
    required this.text,
    required this.titleText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          titleText,
          style: AppStyle.taskTitle,
        ),
        const Gap(10),
        Material(
          child: Ink(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5)),
            child: InkWell(
              onTap: () => onTap(),
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [Icon(icon), const Gap(15), Text(text)],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
