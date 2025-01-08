import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/model/homw_model.dart';
import 'package:online_shop/main.dart';
import 'package:online_shop/screens/productDetail/bloc/prodcut_detail_bloc.dart';
import 'package:online_shop/them.dart';
import 'package:online_shop/widget/prodoct_detail_descreption.dart';
import 'package:online_shop/widget/product_comment.dart';
import 'package:online_shop/widget/product_slider.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductDetailScreen extends StatefulWidget {
  final HomeProducts products;
  const ProductDetailScreen({super.key, required this.products});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductDetailBloc>(context).add(
      ProductDetailEventInit(id: widget.products.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('جزئیات محصول'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: AppColors.kAlert500,
              ),
            )
          ],
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductDetailSuccessState) {
              var product = state.productDetailModel;
              return Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 100),
                      child: Column(
                        spacing: 30,
                        children: [
                          ProductSlider(productDetailModel: product),
                          Text(
                            product.title!,
                            style: themeData.textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Divider(
                            color: AppColors.kGray150,
                          ),
                          ProductDescreption(
                            productDetailModel: product,
                          ),
                          Divider(
                            color: AppColors.kGray150,
                          ),
                          ProductComment(
                            product: product,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 20),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration:
                          BoxDecoration(color: AppColors.kWhite, boxShadow: [
                        BoxShadow(
                          color: AppColors.kGray150,
                          blurRadius: 8,
                          offset: Offset(0.0, 0.75),
                        )
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: isLogin,
                            builder: (context, value, child) {
                              return SizedBox(
                                height: 75,
                                child: ElevatedButton(
                                  onPressed: value ? () {} : null,
                                  child: Text('افزودن به سبد خرید'),
                                ),
                              );
                            },
                          ),
                          Column(
                            children: [
                              product.hasDiscount!
                                  ? Text(
                                      '${product.price!.toStringAsFixed(0).seRagham()}تومان',
                                      style: themeData.textTheme.labelSmall!
                                          .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                      ))
                                  : Text('',
                                      style: themeData.textTheme.labelSmall!),
                              // After Discount
                              product.hasDiscount!
                                  ? Text(
                                      '${product.discountPrice!.toStringAsFixed(0).seRagham()}تومان',
                                    )
                                  : Text(
                                      '${product.price!.toStringAsFixed(0).seRagham()}تومان',
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ProductDetailErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              throw Exception('state is not support');
            }
          },
        ));
  }
}
