import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:ui_kit/ui_kit.dart';


class AvatarTitleSubtitleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageUrl;

  const AvatarTitleSubtitleRow({
    super.key,
    required this.title,
    required this.subtitle,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: CtrtColors.lightGrey, width: 0.5.sp),
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: SizedBox(
          child: imageUrl!=null && imageUrl?.isNotEmpty == true ? ImageNetwork(
            image: '${CtrtEnvConfig.shared.baseUrlFile}/${imageUrl??""}',
            height: 40.h,
            width: 40.w,
            fitAndroidIos: BoxFit.cover,
            fitWeb: BoxFitWeb.cover,
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
        )),
        SizedBox(width: 5.0.w),
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CtrtText.medium(text: title, textSize: 10.5.spMin, textOverflow: TextOverflow.ellipsis),
            CtrtText.regular(text: subtitle, textSize: 10.spMin, textOverflow: TextOverflow.ellipsis)
          ],
        ),
        )
      ],
    );
  }
}
