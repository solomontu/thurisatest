import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/constants/asset_constants.dart';
import 'package:thurisatest/constants/route_constants.dart';
import '../../../models/product_model.dart';
import '../../../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(RouteConstants.productDetail, extra: productModel);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 312.h,
            width: 220.w,
            child: Stack(children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 270.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: AppTheme.antiFlashWhite,
                          blurRadius: 20,
                          spreadRadius: 5,
                          offset: Offset(6, 8), // Shadow position
                        ),
                      ],
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              Positioned(
                  top: 0,
                  left: 30,
                  right: 30,
                  child: Container(
                    height: 189.h,
                    width: 168.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.network(
                          productModel.images![0],
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.primaryColor,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                             AssetConstants.foodImage,
                              height: 12.0.h,
                              width: 12.0.w,
                              // fit: BoxFit.cover,
                            );
                          },
                        ).image,
                        fit: BoxFit.cover,
                      ),
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              Positioned(
                bottom: 47.0.h,
                left: 30,
                right: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title ?? '',
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text('N${productModel.price}',
                        style: TextStyle(
                            color: AppTheme.ogreOdorGrade6,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              )
              // SizedBox(height: 2.h),
            ]),
          )
        ]),
      ),
    );
  }
}
