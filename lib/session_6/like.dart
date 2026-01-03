import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : Colors.grey,
            size: isLiked ? 50 : 25,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => Scaffold(
                      appBar: AppBar(title: const Text('Liked')),
                      body: const Center(child: Text('You liked this!')),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
