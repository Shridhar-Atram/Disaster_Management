import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PendingActionsWidget extends StatelessWidget {
  const PendingActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PENDING ACTIONS',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 15.h),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color(0xFF6673CE),
                  Color(0xFF16b3ed),
                ])),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change battery setting',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Ensures that you do not get automatically logged out',
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15.h),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.0.r)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
                          child: Text(
                            'OPEN SETTINGS',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
