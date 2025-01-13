import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop/them.dart';

class PayMentScreen extends StatefulWidget {
  const PayMentScreen({super.key});

  @override
  State<PayMentScreen> createState() => _PayMentScreenState();
}

class _PayMentScreenState extends State<PayMentScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تکمیل خرید',
        ),
      ),
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    spacing: 12,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'نام و نام خانوادگی را وارد نمایید';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'نام و نام‌خانوادگی',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'شماره همراه را  وارد نمایید';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'شماره همراه',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'کد پستی وارد نمایید';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'کد پستی',
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'آدرس را وارد نمایید';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'آدرس',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                height: 72,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kGray200,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text('تایید و پرداخت'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
