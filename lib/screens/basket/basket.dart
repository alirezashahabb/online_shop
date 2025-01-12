import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/basket/bloc/basket_bloc.dart';
import 'package:online_shop/screens/guest_screen.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/utils/image_loading_service.dart';
import 'package:online_shop/utils/snack_bar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سبدخرید',
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: isLogin,
        builder: (context, value, child) {
          if (isLogin.value) {
            BlocProvider.of<BasketBloc>(context).add(
              GetBasketInitEvent(),
            );
          }
          if (value) {
            return BlocConsumer<BasketBloc, BasketState>(
              listener: (context, state) {
                if (state is BasketSuccessState) {
                  return showCustomAlert(
                    context,
                    'محصول با موفقیت به سبد خرید اضافه شد',
                  );
                }
              },
              builder: (context, state) {
                if (state is GetBasketSuccessState) {
                  return ListView.separated(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 50),
                      itemBuilder: (context, index) {
                        var products = state.basketModel.items![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 8,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: ImageLoadingService(
                                mainImage:
                                    'https://flutter.vesam24.com/${products.productImage}',
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          products.productTitle!,
                                          style: themeData.textTheme.bodySmall,
                                        ),
                                      ),
                                      Icon(
                                        Icons.delete_outline,
                                        color: AppColors.kGray500,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        spacing: 5,
                                        children: [
                                          products.discountPercent! > 0
                                              ? Text(
                                                  '${products.price!.toStringAsFixed(0).seRagham()}تومان',
                                                  style: themeData
                                                      .textTheme.labelSmall!
                                                      .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  ))
                                              : Text('',
                                                  style: themeData
                                                      .textTheme.labelSmall!),
                                          // After Discount
                                          products.discountPercent! > 0
                                              ? Text(
                                                  '${products.finalPrice!.toStringAsFixed(0).seRagham()}تومان',
                                                )
                                              : Text(
                                                  '${products.price!.toStringAsFixed(0).seRagham()}تومان',
                                                ),
                                        ],
                                      ),
                                      Row(
                                        spacing: 15,
                                        children: [
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundColor:
                                                AppColors.kPrimary500,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.add,
                                                color: AppColors.kWhite,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            products.count.toString(),
                                          ),
                                          CircleAvatar(
                                            radius: 18,
                                            backgroundColor: AppColors.kGray150,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.remove,
                                                color: AppColors.kWhite,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: state.basketModel.items!.length);
                } else if (state is GetBasketErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return GuestScreen();
          }
        },
      ),
    );
  }
}
