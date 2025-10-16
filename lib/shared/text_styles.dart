import 'package:flutter/material.dart';
import 'package:flutter_fastapi/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle black16weight500 = GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF000000),
  );
  static TextStyle black14weight500 = GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF000000),
  );
  static TextStyle black10weight400 = GoogleFonts.tajawal(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff090F1F),
  );
  static TextStyle black12weight400 = GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff090F1F),
  );
  static TextStyle grey16weight700 = GoogleFonts.tajawal(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF000000),
  );
  static TextStyle grey14weight500 = GoogleFonts.tajawal(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static TextStyle grey12weight400 = GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle grey10weight400 = GoogleFonts.tajawal(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static TextStyle green12weight400 = GoogleFonts.tajawal(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.green,
  );
}
