import 'package:disaster_management/src/features/authentication/models/dashboard/catgories_model.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class Topcategories extends StatelessWidget {
  const Topcategories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategories.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 45,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor),
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: txtTheme.headline6?.apply(color: Colors.white),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        list[index].title,
                        style: txtTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
                        style: txtTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // children: [
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: tDarkColor),
        //           child: Center(
        //             child: Text(
        //               "Js",
        //               style: txtTheme.headline6?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'Javascript',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 lessons',
        //                 style: txtTheme.bodyText2,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: tDarkColor),
        //           child: Center(
        //             child: Text(
        //               "Js",
        //               style: txtTheme.headline6?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'Javascript',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 lessons',
        //                 style: txtTheme.bodyText2,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 45,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: tDarkColor),
        //           child: Center(
        //             child: Text(
        //               "Js",
        //               style: txtTheme.headline6?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 'Javascript',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 lessons',
        //                 style: txtTheme.bodyText2,
        //                 overflow: TextOverflow.ellipsis,
        //               )
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
