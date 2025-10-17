import 'package:flutter/material.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_fastapi/shared/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  const CustomeButton({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 328.w,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,

              style: TextStyles.white16weight700.copyWith(height: 1.2.h),
              textAlign: TextAlign.center,
            ),

            if (icon != null) ...[
              SizedBox(width: 8.w),
              Icon(icon, color: Colors.white, size: 24.sp),
            ],
          ],
        ),
      ),
    );
  }
}
