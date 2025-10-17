import 'package:flutter/material.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_fastapi/shared/text_styles.dart';
import 'package:flutter_fastapi/widgets/custome_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanSelected extends StatefulWidget {
  static const String routeName = '/plan-selected';
  const PlanSelected({super.key});

  @override
  State<PlanSelected> createState() => _PlanSelectedState();
}

class _PlanSelectedState extends State<PlanSelected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك',
                style: TextStyles.grey14weight500,
              ),

              buildStandardPlanItem(
                'أساسية ',
                'صلاحية الأعلان 30 يوم',
                '3000 ج.م',
              ),
              buildExtraPlan(),
              Stack(
                children: [
                  buildPlusPlan(),
                  Positioned(
                    right: 0,
                    top: -7,
                    child: Image.asset('assets/images/Plan Offer Badge.png'),
                  ),
                ],
              ),
              Stack(
                children: [
                  buildSuperPlan(),
                  Positioned(
                    right: 0,
                    top: -3,
                    child: Image.asset('assets/images/super_high_view.png'),
                  ),
                ],
              ),
              buildCustomPlan(),
              CustomeButton(
                title: 'التالى',
                onTap: () {},
                icon: Icons.arrow_forward_rounded,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        // Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text('أختر الباقات اللى تناسبك', style: TextStyles.black24weight500),
  );
}

Widget buildStandardPlanItem(String title, String description, String price) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text(title, style: TextStyles.black16weight700),
            Spacer(),
            Text(price, style: TextStyles.orange16weight700),
          ],
        ),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Image.asset('assets/icons/acute.png', width: 16, height: 16),
              SizedBox(width: 8.w),
              Text(description, style: TextStyles.black14weight500),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildPlanItem(String title, List<Widget> row, String price) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              checkColor: Colors.white,
              fillColor: WidgetStatePropertyAll(AppColors.blue),
            ),
            Text(title, style: TextStyles.black16weight700),
            Spacer(),
            Text(
              price,
              style: TextStyles.orange16weight700.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.orange,
                decorationThickness: 10,
              ),
            ),
          ],
        ),
        Divider(color: Colors.grey.shade300),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(children: [...row]),
        ),
      ],
    ),
  );
}

Widget buildPlanRow(String image, String title, {String subtitle = ''}) {
  return Row(
    children: [
      Image.asset(image, width: 16, height: 16),
      SizedBox(width: 8.w),
      Column(
        children: [
          Text(
            title,
            style: TextStyles.black14weight500,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle.isNotEmpty)
            Text(subtitle, style: TextStyles.orange14weight500, maxLines: 1),
        ],
      ),
    ],
  );
}

Widget buildPlusPlan() {
  return Column(
    children: [
      buildPlanItem('بلس', [
        buildPlanRow('assets/icons/acute.png', 'صلاحية الأعلان 30 يوم'),
        SizedBox(height: 8.h),
        buildPlanRow('assets/icons/rocket.png', 'رفع لأعلى القائمة كل 2 يوم'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
        buildPlanRow('assets/icons/globe.png', 'ظهور فى كل محافظات مصر'),
        buildPlanRow('assets/icons/workspace_premium.png', 'أعلان مميز'),
        buildPlanRow('assets/icons/keep.png', 'تثبيت فى مقاول صحى فى الجهراء'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
      ], '7000 ج.م'),
    ],
  );
}

Widget buildExtraPlan() {
  return Column(
    children: [
      buildPlanItem('إكسترا', [
        buildPlanRow('assets/icons/acute.png', 'صلاحية الأعلان 30 يوم'),
        SizedBox(height: 8.h),
        buildPlanRow('assets/icons/rocket.png', 'رفع لأعلى القائمة كل 2 يوم'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
        buildPlanRow('assets/icons/globe.png', 'ظهور فى كل محافظات مصر'),
        buildPlanRow('assets/icons/workspace_premium.png', 'أعلان مميز'),
        buildPlanRow('assets/icons/keep.png', 'تثبيت فى مقاول صحى فى الجهراء'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
      ], '3500 ج.م'),
    ],
  );
}

Widget buildSuperPlan() {
  return Column(
    children: [
      buildPlanItem('سوبر', [
        buildPlanRow('assets/icons/acute.png', 'صلاحية الأعلان 30 يوم'),
        SizedBox(height: 8.h),
        buildPlanRow('assets/icons/rocket.png', 'رفع لأعلى القائمة كل 2 يوم'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '( خلال ال48 ساعة القادمة )',
        ),
        buildPlanRow('assets/icons/globe.png', 'ظهور فى كل محافظات مصر'),
        buildPlanRow('assets/icons/workspace_premium.png', 'أعلان مميز'),
        buildPlanRow('assets/icons/keep.png', 'تثبيت فى مقاول صحى فى الجهراء'),
        buildPlanRow(
          'assets/icons/keep.png',
          'تثبيت فى مقاول صحى',
          subtitle: '(خلال ال48 ساعة القادمة)',
        ),
      ], '10000 ج.م'),
    ],
  );
}

Widget buildCustomPlan() {
  return Container(
    height: 79.h,
    width: 300.w,
    margin: EdgeInsets.only(top: 16.h, bottom: 32.h),
    padding: EdgeInsets.all(8.w),
    decoration: BoxDecoration(
      color: AppColors.lightOrange,
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(color: AppColors.orange.withOpacity(0.1), width: 1.w),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('باقات مخصصة', style: TextStyles.black14weight500),
        Text(
          'تواصل معنا لأختيار الباقة المناسبة لك',
          style: TextStyles.black12weight400,
        ),
        Text('فريق المبيعات', style: TextStyles.blue16weight700),
      ],
    ),
  );
}
