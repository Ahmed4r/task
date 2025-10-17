import 'package:flutter/material.dart';
import 'package:flutter_fastapi/screens/filter_page.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_fastapi/shared/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/homepage';
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
          IconButton(
            icon: Icon(Icons.arrow_forward, color: AppColors.grey),
            onPressed: () {
              Navigator.pushNamed(context, FilterPage.routeName);
            },
          ),
        ],
      ),
    );
  }

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
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                Text('data'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildCategoryItems(List<String> categories) {
  return SizedBox(
    height: 61.h,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: index == 0
                  ? const Color.fromRGBO(249, 91, 28, 0.05)
                  : Colors.transparent,
              border: Border.all(
                width: 1,
                color: index == 0
                    ? Color.fromARGB(255, 242, 236, 230)
                    : Colors.grey.shade300,
              ),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyles.grey14weight500.copyWith(
                  color: index == 0
                      ? Color(0xffF95B1C)
                      : const Color.fromRGBO(9, 15, 31, 0.5),
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
  String newprice = '32,000,000';
  String oldprice = '60,000,000';
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.grey.shade200, width: 2),
      borderRadius: BorderRadius.circular(4.r),
    ),
    padding: EdgeInsets.all(6.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ClipRRect(
            child: Image.asset(
              products[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Row(
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
            Image.asset('assets/icons/discount.png', width: 18.w, height: 18.h),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$newprice جم/',
                    style: TextStyles.black14weight500.copyWith(
                      color: Colors.red,
                    ),

                    maxLines: 1,
                  ),
                  SizedBox(width: 2.w),
                  Flexible(
                    child: Text(
                      '$oldprice',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 2.w),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Icon(
              Icons.local_fire_department_outlined,
              color: Colors.grey,
              size: 12.sp,
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                'تم بيع 3.3k+',
                style: TextStyles.grey10weight400,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 22.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Image.asset('assets/icons/save.png'),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 5.sp),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 26.h,
              width: 26.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.grey.shade200, width: 1.5),
              ),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: Image.asset('assets/icons/add_shopping_cart.png'),
              ),
            ),
            SizedBox(width: 4.w),
            SizedBox(
              height: 18.h,
              width: 18.w,
              child: Image.asset('assets/icons/logo.png', fit: BoxFit.contain),
            ),
          ],
        ),
      ],
    ),
  );
}
