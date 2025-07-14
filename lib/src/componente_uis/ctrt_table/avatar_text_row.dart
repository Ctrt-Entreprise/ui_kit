import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:ui_kit/ui_kit.dart';


class AvatarTextRow extends StatelessWidget {
  final String text;
  final String? imageUrl;

  const AvatarTextRow({super.key, required this.text, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: CtrtColors.lightGrey, width: 0.25.sp),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: SizedBox(
          child: imageUrl!=null && imageUrl?.isNotEmpty == true ? ImageNetwork(
            image: '${CtrtEnvConfig.shared.baseUrlFile}/${imageUrl??""}',
            height: 40.h,
            width: 40.w,
            fitAndroidIos: BoxFit.fill,
            fitWeb: BoxFitWeb.fill,
            borderRadius: BorderRadius.circular(7.r),
            onLoading: CircularProgressIndicator(),
            onError: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error),
                if(kDebugMode)
                  Text('${CtrtEnvConfig.shared.baseUrlFile}/${imageUrl??""}')
              ],
            ),
          ) : Center(child: Icon(Icons.photo, color: CtrtColors.textSecondary,)),
        ),
        ),
        SizedBox(width: 5.0.w),
        Expanded(child: CtrtText.regular(text: text, textSize: 10.5.spMin, textOverflow: TextOverflow.ellipsis))
      ],
    );
  }
}
