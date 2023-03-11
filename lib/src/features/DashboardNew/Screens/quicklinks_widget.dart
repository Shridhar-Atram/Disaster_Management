import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUICK LINKS',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 15.h),
        Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3.0.r)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xFF222222),
                    ),
                    // color: const Color(0xFF222222),
                    width: 180.w,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Icon(
                            FeatherIcons.creditCard,
                            size: 35.0.r,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            '₹ 0',
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today\u0027s earnings',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                                size: 25.0.r,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3.0.r)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xFF222222),
                    ),
                    // color: const Color(0xFF222222),
                    width: 180.w,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Icon(
                            FeatherIcons.creditCard,
                            size: 35.0.r,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            '₹ 271',
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(height: 10.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Week\u0027s earnings',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                                size: 25.0.r,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3.0.r)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xFF222222),
                    ),
                    // color: const Color(0xFF222222),
                    width: 180.w,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Icon(
                            FeatherIcons.dollarSign,
                            size: 35.0.r,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            '₹ 2172',
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Floating Cash',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                                size: 25.0.r,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3.0.r)),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: const Color(0xFF222222),
                    ),
                    // color: const Color(0xFF222222),
                    width: 180.w,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Icon(
                            FeatherIcons.clock,
                            size: 35.0.r,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            '00 min',
                            style: TextStyle(fontSize: 22.sp),
                          ),
                          SizedBox(height: 10.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Login duration',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Icon(
                                FeatherIcons.arrowRight,
                                size: 25.0.r,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
