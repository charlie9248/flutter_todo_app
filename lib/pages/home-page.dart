import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/app-style.dart';
import 'package:gap/gap.dart';
import '../widgets/bottm_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        foregroundColor: Colors.black,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade200,
            radius: 22,
            child: Image.asset('assets/images.jpeg'),
          ),
          title: const Text(
            'Hi I\'am',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          subtitle: const Text("Tshepo Rapuleng"),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.calendar_month),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.notifications_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Tasks",
                    style: AppStyle.taskHeading,
                  ),
                  Text(
                    "Wednesday , 11 May",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const Gap(20),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return BottomModal();
                      },
                    );
                  },
                  child: const Text('+ New Task')),
            ],
          ),
          const Gap(20),
          CardTodoItem()
        ]),
      )),
    );
  }
}

class CardTodoItem extends StatelessWidget {
  const CardTodoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Container(
                width: 20,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: Colors.red),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: const Text('Learnining web development'),
                      subtitle: const Text('Learning topic HTML and CSS'),
                      trailing: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                            shape: const CircleBorder(),
                            value: true,
                            onChanged: (value) => value),
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade400,
                    ),
                    Row(
                      children: const [
                        Text('Today 1 Mar 2023'),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}
