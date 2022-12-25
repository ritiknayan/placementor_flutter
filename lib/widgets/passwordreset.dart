import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final inputEmail = TextEditingController();

  void submitData() {
    FirebaseAuth.instance.sendPasswordResetEmail(email: inputEmail.text.trim());
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
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(105, 245, 245, 245),
                  filled: true,
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              controller: inputEmail,
              onFieldSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: () => submitData(),
              child: const Text(
                'Sent Password Reset Email',
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