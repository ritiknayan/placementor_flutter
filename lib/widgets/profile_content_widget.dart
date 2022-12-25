import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  final IconData contentIcon;
  final String contentTitle;
  const ProfileContent({
    required this.contentIcon,
    required this.contentTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: Color.fromARGB(255, 129, 129, 127),
      child: Row(
        children: [
          Card(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            shape: CircleBorder(),
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                contentIcon,
                size: 30,
              ),
            ),
          ),
          Text(
            contentTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Oswald',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
