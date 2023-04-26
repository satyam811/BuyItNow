import 'package:buyitnow/utils/colors.dart';
import 'package:buyitnow/utils/size_config.dart';
import 'package:buyitnow/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../../widgets/loading_widget.dart';
import '../product_details/product_details.dart';

class CategoryProductSCreen extends StatefulWidget {
  const CategoryProductSCreen(
      {super.key, required this.categoryId, required this.categoryName});
  final String categoryId;
  final String categoryName;

  @override
  State<CategoryProductSCreen> createState() => _CategoryProductSCreenState();
}

class _CategoryProductSCreenState extends State<CategoryProductSCreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<ProductProvider>()
          .getProductByCategory(context, widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: AppColors.priceColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25.h, left: 22.w, right: 22.w),
        child: Consumer<ProductProvider>(
          builder: (context, provider, _) => RefreshIndicator(
            onRefresh: () async {
              await provider.getProductByCategory(context, widget.categoryId);
            },
            child: Visibility(
              visible: !provider.isLoading,
              replacement: const Center(child: LoadingWidget()),
              child: provider.listOfProductsFilter.isEmpty
                  ? const EmptyWidget()
                  : GridView.builder(
                      itemCount: provider.listOfProductsFilter.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.65),
                      itemBuilder: (context, index) {
                        final currentProduct =
                            provider.listOfProductsFilter[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                    item: currentProduct)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: AppColors.cardColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    //padding: EdgeInsets.all(10),
                                    height: 147.h,
                                    width: double.infinity,
                                    child: Image.network(
                                      currentProduct.thumbnail.url,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  currentProduct.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Color(0xff4a5086),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  currentProduct.price.toString(),
                                  style: const TextStyle(
                                      color: AppColors.priceColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     RatingBarIndicator(
                                //       rating: currentProduct.rating.toDouble(),
                                //       itemBuilder: (context, index) => const Icon(
                                //         Icons.star,
                                //         color: Colors.amber,
                                //       ),
                                //       itemCount: 5,
                                //       itemSize: 17.0,
                                //       direction: Axis.horizontal,
                                //     ),
                                //     Text(currentProduct.rating.toString()),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
