import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holo_cart/core/widgets/custom_loading_widget.dart';
import 'package:holo_cart/features/categories/logic/cubit/get_products_in_category_cubit.dart';
import 'package:holo_cart/features/home/data/models/get_all_products_model.dart';
import 'package:holo_cart/features/home/ui/widgets/all_products_section/product_cart_item.dart';

class AllProductsInCategoryScreen extends StatefulWidget {
  final List<dynamic> idAndName;
  const AllProductsInCategoryScreen(
      {super.key,required this.idAndName});

  @override
  State<AllProductsInCategoryScreen> createState() =>
      _AllProductsInCategoryScreenState();
}

class _AllProductsInCategoryScreenState
    extends State<AllProductsInCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetProductsInCategoryCubit>(context)
        .getAllProductsInCategory(id: widget.idAndName[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.idAndName[1].toString()),
          ),
          body: BlocBuilder<GetProductsInCategoryCubit,
              GetProductsInCategoryState>(
            builder: (context, state) {
              if (state is GetProductsInCategorySuccess) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.allProductsModel.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 9 / 15,
                        mainAxisSpacing: 10.r),
                    itemBuilder: (context, index) {
                      ProductData product = state.allProductsModel.data![index];
                      return ProductCartItem(product: product);
                    },
                  ),
                );
              } else if (state is GetProductsInCategoryError) {
                return Center(child: Text(state.message));
              } else {
                return FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    return const CustomLoadingWidget();
                  },
                );
              }
            },
          )),
    );
  }
}
