import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thurisatest/constants/route_constants.dart';
import 'package:thurisatest/constants/string_constants.dart';
import 'package:thurisatest/models/product_detail_model.dart';
import 'package:thurisatest/models/product_model.dart';
import 'package:thurisatest/screens/product/product_detail_blocks/product_detail_bloc.dart';
import 'package:thurisatest/screens/product/product_detail_blocks/product_detail_event.dart';
import 'package:thurisatest/services/repository/product_repository.dart';
import 'package:thurisatest/theme/app_colors.dart';

import '../product_detail_blocks/product_detail_state.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    ProductRepository productRepository = ProductRepository();
    return Material(
      color: AppTheme.grey1,
      child: Padding(
        padding: EdgeInsets.only(
          left: 50.w,
          right: 50.w,
          top: 70.h,
        ),
        child: BlocProvider.value(
          value: ProductDetailBloc(productRepository: productRepository)
            ..add(LoadProductDetailEvent(id: productModel.id)),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.goNamed(RouteConstants.home);
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      size: 24.sp, color: AppTheme.black),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border,
                      size: 24.sp, color: AppTheme.black),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
              if (state is ProductDetailLoadingState) {
                return const Center(
                  child: Text(AppString.loading),
                );
              } else if (state is ProductDetailErrorState) {
                return const Center(
                  child: Text(AppString.errorLoadingProduct),
                );
              } else if (state is ProductDetailLoadedState) {
                ProductDetailModel? productDetail = state.productLoaded;
                return Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.black007,
                            blurRadius: 40,
                            spreadRadius: 0,
                            offset: Offset(0, 40), // Shadow position
                          ),
                        ],
                      ),
                      height: 241.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            items: productDetail?.images
                                ?.map((imageUrl) =>
                                    CarouselImageBuilder(imageUrl: imageUrl))
                                .toList(),
                            options: CarouselOptions(
                                viewportFraction: 1,
                                enableInfiniteScroll: false,
                                onPageChanged: (int index,
                                    CarouselPageChangedReason reason) {
                                  activeIndex = index;
                                }),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 150,
                            right: 200,
                            child: AnimatedSmoothIndicator(
                              axisDirection: Axis.horizontal,
                              activeIndex: 0,
                              count: productDetail!.images!.length,
                              effect: ColorTransitionEffect(
                                  radius: 6.w,
                                  dotWidth: 6.w,
                                  dotHeight: 6.w,
                                  spacing: 6.w,
                                  activeDotColor: AppTheme.primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      productDetail.title ?? AppString.emptySpace,
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'N${productDetail.price}',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppString.deliveryInfo,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 77.h,
                      child: Text(
                        productDetail.description ??AppString.emptySpace,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppString.returnPolicy,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                      child: Text(
                        AppString.returnPolicyDetail,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.black),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(RouteConstants.cartList);
                      },
                      child: Container(
                        width: 314.w,
                        height: 70.h,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppTheme.primaryColor),
                        child: Center(
                          child: Text(
                            AppString.addToCart,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(AppString.somethingWentWrong),
                );
              }
            })
          ]),
        ),
      ),
    );
  }
}

class CarouselImageBuilder extends StatelessWidget {
  const CarouselImageBuilder({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.network(
          imageUrl,
          width: 241.w,
          height: 241.h,
        ).image),
        shape: BoxShape.circle,
      ),
    );
  }
}
