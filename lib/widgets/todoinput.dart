import 'package:flutter/material.dart';

class TransectionInput extends StatefulWidget {
  final Function addTodo;
  const TransectionInput(this.addTodo, {super.key});

  @override
  State<TransectionInput> createState() => _TransectionInputState();
}

class _TransectionInputState extends State<TransectionInput> {
  final inputTitle = TextEditingController();

  void submitData() {
    widget.addTodo(
      inputTitle.text,
      DateTime.now(),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: inputTitle,
              onFieldSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: () => submitData(),
              child: const Text(
                'Add To Do-List',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// onChanged: (value) {
              //   inputAmount = value;
              //   print(value);
              // },
                // onChanged: (value) {
              //   inputTitle = value;
              //   print(value);
              // },