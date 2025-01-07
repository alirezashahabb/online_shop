import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ثبت نظر',
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/img/comment.svg',
              width: 150,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
