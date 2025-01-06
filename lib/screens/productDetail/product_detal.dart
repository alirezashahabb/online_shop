import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/data/model/homw_model.dart';
import 'package:online_shop/screens/productDetail/bloc/prodcut_detail_bloc.dart';
import 'package:online_shop/them.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
  }
}
