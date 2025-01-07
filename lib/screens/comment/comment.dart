import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.fromLTRB(
          16,
          15,
          16,
          25,
        ),
        child: ElevatedButton(
          onPressed: () {
            if (FormKey.currentState!.validate()) {
              print('1');
            } else {
              print('2');
            }
          },
          child: Text(
            'ثبت نظر',
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'ثبت نظر',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: FormKey,
            child: Column(
              spacing: 20,
              children: [
                SvgPicture.asset(
                  'assets/img/comment.svg',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'وارد کردن نظر الزامی هست';
                    }
                    return null;
                  },
                  // when touch next automatically next text felid
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    label: Text('عنوان دیدگاه'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'وارد کردن دیدگاه الزامی هست';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text('متن دیدگاه'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
