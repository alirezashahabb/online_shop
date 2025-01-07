import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_shop/them.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FormKey = GlobalKey<FormState>();
  int groupValue = 0;
  bool isNotVisiblePassword = true;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          20,
        ),
        child: ElevatedButton(
            onPressed: () {
              if (FormKey.currentState!.validate()) {
                print('1');
              } else {
                print('2');
              }
            },
            child: groupValue == 0
                ? Text('ورود به وسام شاپ')
                : Text('ثبت‌نام در وسام شاپ')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: FormKey,
              child: Column(
                spacing: 12,
                children: [
                  SvgPicture.asset(
                    'assets/img/Logo.svg',
                    width: 60,
                    height: 60,
                    colorFilter: const ColorFilter.mode(
                      AppColors.kPrimary500,
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'به وسام شاپ خوش‌آمدید',
                    style: themeData.textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CupertinoSlidingSegmentedControl<int>(
                    groupValue: groupValue,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    backgroundColor: AppColors.kGray50,
                    thumbColor: AppColors.kWhite,
                    children: {
                      0: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'ورود',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: groupValue == 0
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: groupValue == 0
                                ? AppColors.kPrimary500
                                : AppColors.kGray700,
                          ),
                        ),
                      ),
                      1: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'ثبت‌نام',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: groupValue == 1
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: groupValue == 1
                                ? AppColors.kPrimary500
                                : AppColors.kGray700,
                          ),
                        ),
                      ),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue = value!;
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      groupValue == 0 ? 'ورود' : 'ثبت‌نام',
                      style: themeData.textTheme.bodyLarge,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      groupValue == 0
                          ? 'جهت ورود به وسام شاپ، ایمیل و رمزعبور خود را وارد کنید.'
                          : 'جهت ثبت‌نام در وسام شاپ، موارد خواسته شده را تکمیل نمایید.',
                      style: themeData.textTheme.bodyMedium!.copyWith(
                        color: AppColors.kGray600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  groupValue == 1
                      ? Column(
                          spacing: 12,
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'لطفا نام و نام خانوادگی  وارد نمایید';
                                }
                                return null;
                              },
                              controller: fullNameController,
                              decoration: InputDecoration(
                                label: Text('نام و نام‌خانوادگی'),
                              ),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'لطفا شماره موبایل وارد نمایید';
                                }
                                return null;
                              },
                              controller: phoneController,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(11),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                label: Text('شماره موبایل'),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لطفا ایمیل وارد نمایید';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text('ایمیل '),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'لطفا رمز عبور وارد نمایید';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isNotVisiblePassword,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      label: Text('رمزعبور'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isNotVisiblePassword = !isNotVisiblePassword;
                            });
                          },
                          icon: isNotVisiblePassword
                              ? Icon(
                                  Icons.visibility_outlined,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
