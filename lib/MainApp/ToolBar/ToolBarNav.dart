import 'package:flutter/material.dart';

class ToolBarNav extends StatelessWidget {
  const ToolBarNav({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            SizedBox(width: 8),
            Text(
              "Tools for you ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 124),
            Text(
              "SEE ALL",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Color.fromARGB(255, 98, 92, 226),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
