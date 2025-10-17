import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_fastapi/shared/text_styles.dart';
import 'package:flutter_fastapi/widgets/custome_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatefulWidget {
  static const String routeName = '/filter';
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // Separate selection variables for each category
  String selectedType = '';
  String selectedRoomCount = '';
  String selectedPaymentMethod = '';
  String selectedBuildStatus = '';

  // Helper method to check if an item is selected for a specific category
  bool _isItemSelected(String item, String category) {
    switch (category) {
      case 'type':
        return selectedType == item;
      case 'rooms':
        return selectedRoomCount == item;
      case 'payment':
        return selectedPaymentMethod == item;
      case 'status':
        return selectedBuildStatus == item;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controllerLowPrice = TextEditingController();
    TextEditingController controllerHighPrice = TextEditingController();
    List<String> type = ['الكل', 'توين هاوس', 'فيلا منفصلة', 'تاون هاوس'];
    List<String> roomscount = ['4 غرف', '5 غرف+', 'الكل', 'غرفتين', '3 غرف'];
    List<String> paymentMethods = ['أى', 'تقسيط', 'كاش'];
    List<String> buildstatus = ['أى', 'جاهز', 'قيد الأنشاء'];

    PreferredSizeWidget buildAppBar() {
      return AppBar(
        title: Text('فلتره', style: TextStyles.black24weight500),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedType = '';
                selectedRoomCount = '';
                selectedPaymentMethod = '';
                selectedBuildStatus = '';
              });
            },
            child: Text('رجوع للأفتراضى', style: TextStyles.blue16weight700),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset('assets/icons/close_small1x.png'),
        ),
      );
    }

    Widget buildCustomeListView(
      int length,
      List<String> items,
      String category,
    ) {
      return Wrap(
        spacing: 12.w,
        runSpacing: 8.h,
        children: List.generate(
          length,
          (index) => InkWell(
            onTap: () {
              setState(() {
                // Update the appropriate selection variable based on category
                switch (category) {
                  case 'type':
                    selectedType = items[index];
                    log('Selected type: $selectedType');
                    break;
                  case 'rooms':
                    selectedRoomCount = items[index];
                    log('Selected room count: $selectedRoomCount');
                    break;
                  case 'payment':
                    selectedPaymentMethod = items[index];
                    log('Selected payment method: $selectedPaymentMethod');
                    break;
                  case 'status':
                    selectedBuildStatus = items[index];
                    log('Selected build status: $selectedBuildStatus');
                    break;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isItemSelected(items[index], category)
                      ? AppColors.blue
                      : AppColors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                items[index],
                style: _isItemSelected(items[index], category)
                    ? TextStyles.blue14weight700
                    : TextStyles.black14weight500,
              ),
            ),
          ),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الفئه', style: TextStyles.grey16weight500),
                Row(
                  children: [
                    Image.asset('assets/icons/Cars.png'),
                    SizedBox(width: 8.w),
                    Column(
                      children: [
                        Text('عقارات', style: TextStyles.black14weight500),
                        Text('فلل البيع', style: TextStyles.grey12weight400),
                      ],
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('تغيير', style: TextStyles.blue14weight700),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.grey.shade300,
                  thickness: 2,
                  height: 20.h,
                ),
                Row(
                  children: [
                    Image.asset('assets/icons/location_on.png'),
                    SizedBox(width: 8.w),
                    Column(
                      children: [
                        Text('الموقع', style: TextStyles.black14weight500),
                        Text('مصر ', style: TextStyles.grey12weight400),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.grey.shade300,
                  thickness: 2,
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الأقساط الشهرية', style: TextStyles.grey16weight500),
                    Row(
                      children: [
                        customeTextField(controller1),
                        customeTextField(controller2),
                      ],
                    ),
                  ],
                ),
                Text('النوع', style: TextStyles.grey16weight500),
                buildCustomeListView(type.length, type, 'type'),
                SizedBox(height: 10.h),
                Text('عدد الغرف', style: TextStyles.grey16weight500),
                buildCustomeListView(roomscount.length, roomscount, 'rooms'),

                SizedBox(height: 10.h),
                Text('السعر', style: TextStyles.grey16weight500),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    customeTextField(controllerLowPrice, title: 'اقل سعر'),
                    customeTextField(controllerHighPrice, title: 'اقصى سعر'),
                  ],
                ),
                SizedBox(height: 10.h),
                Text('طريقة الدفع', style: TextStyles.grey16weight500),
                buildCustomeListView(
                  paymentMethods.length,
                  paymentMethods,
                  'payment',
                ),
                SizedBox(height: 10.h),
                Text('حالة العقار', style: TextStyles.grey16weight500),
                buildCustomeListView(buildstatus.length, buildstatus, 'status'),
                SizedBox(height: 50.h),
                CustomeButton(title: 'شاهد 10,000+ نتائج', onTap: () {}),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customeTextField(controller, {String? title}) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: TextField(
        controller: controller,
        style: TextStyles.black14weight500,
        decoration: InputDecoration(
          hintText: title,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.grey.shade400),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.grey.shade100),
          ),
        ),
      ),
    ),
  );
}
