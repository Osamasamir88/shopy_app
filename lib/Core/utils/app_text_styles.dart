import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static TextStyle font32SemiBold = GoogleFonts.readexPro(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    letterSpacing: -1.5
  );

  static  TextStyle font16Medium =  GoogleFonts.readexPro(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static TextStyle font16Regular = GoogleFonts.readexPro(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.grey500,
  );

  static TextStyle font14Medium = GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}