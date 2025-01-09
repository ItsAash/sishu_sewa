import 'package:flutter/material.dart';

class WelcomeComponent extends StatelessWidget {
  final String name;
  final String imageUrl;

  const WelcomeComponent({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 50),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
