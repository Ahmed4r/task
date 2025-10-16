import 'package:flutter/material.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_fastapi/shared/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> categories = [
    'كل العروض',
    'ملابس',
    'أكسسوارات',
    'الكترونيات',
  ];

  final Map<String, String> images = {
    'assets/images/man.png': 'موضة رجالى',
    'assets/images/watch.png': 'ساعات',
    'assets/images/mobile.png': 'موبايلات',
    'assets/images/beauty.png': 'منتجات تجميل',
  };

  List<String> products = [
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(),
              SizedBox(height: 5.h),
              buildCategoryItems(categories),
              SizedBox(height: 5.h),
              buildImageItems(images),
              SizedBox(height: 5.h),
              buildFreeShippingBanner(),
              SizedBox(height: 5.h),
              buildProdcutList(products),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildHeader() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    child: Row(
      children: [
        Text('استكشف العروض', style: TextStyles.black16weight500),
        const Spacer(),
        Text(
          'الكل',
          style: TextStyles.grey16weight700.copyWith(color: AppColors.grey),
        ),
        SizedBox(width: 8.w),
        Icon(Icons.arrow_forward, color: AppColors.grey),
      ],
    ),
  );
}

Widget buildCategoryItems(List<String> categories) {
  return SizedBox(
    height: 61.h,
    width: 11.w,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            left: 6.w,
            right: 6.w,
            top: 8.h,
            bottom: 8.h,
          ),
          child: Container(
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: index == 0 ? Color(0xfffef7f3) : Colors.transparent,
              border: Border.all(
                width: 1,
                color: index == 0 ? Color(0xffebe6f2) : Colors.grey.shade300,
              ),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyles.grey14weight500.copyWith(
                  color: index == 0 ? Color(0xffF95B1C) : AppColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget buildImageItems(Map<String, String> images) {
  return SizedBox(
    height: 120.h,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      itemBuilder: (context, index) {
        final imagePath = images.keys.elementAt(index);
        final title = images.values.elementAt(index);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 56.h,
                    width: 73.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(title, style: TextStyles.black12weight400),
            ],
          ),
        );
      },
    ),
  );
}

Widget buildFreeShippingBanner() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      height: 40.h,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.lightOrange),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(Icons.check, color: Colors.green),
            SizedBox(width: 4.w),
            Text('شحن مجاني', style: TextStyles.green12weight400),
            Spacer(),
            Text('لأى عرض تطلبه دلوقتى !', style: TextStyles.black10weight400),
          ],
        ),
      ),
    ),
  );
}

Widget buildProdcutList(products) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.w,
      mainAxisSpacing: 8.h,
      childAspectRatio: 0.55, // Reduced from 0.68 to provide more height
    ),
    itemBuilder: (BuildContext context, int index) {
      return buildProductItem(products, index: index);
    },
  );
}

Widget buildProductItem(List<String> products, {required int index}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.grey.shade200, width: 2),
      borderRadius: BorderRadius.circular(4.r),
    ),
    margin: EdgeInsets.all(4.w), // Reduced margin
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              products[index],
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 6.h), // Reduced spacing
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'جاكيت من الصوف مناسب',
                  style: TextStyles.black14weight500,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(width: 4.w),
              Image.asset(
                'assets/icons/discount.png',
                width: 20.w,
                height: 20.h,
              ), // Smaller icon
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(
                        text: '32,000,000جم',
                        style: TextStyles.black14weight500.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text: '/60,000,00',
                        style: TextStyles.grey12weight400.copyWith(
                          decoration: TextDecoration.overline,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
                height: 24.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                    size: 18.sp, // Smaller icon
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Icon(
                Icons.local_fire_department_outlined,
                color: Colors.grey,
                size: 12.sp, // Smaller icon
              ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  'تم بيع 3.3k+',
                  style: TextStyles.grey10weight400.copyWith(
                    height: 2,
                  ), // Smaller font
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 6.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Image.asset('assets/icons/save.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    child: Container(
                      height: 12.h,
                      width: 12.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 8.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Spacer(),
              Container(
                height: 28.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(color: AppColors.grey.shade200, width: 2),
                ),
                // cart icon
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Image.asset('assets/icons/cart.png'),
                ),
              ),
              SizedBox(width: 10.w),
              Image.asset('assets/icons/logo.png', scale: 3),
            ],
          ),
        ),
      ],
    ),
  );
}
