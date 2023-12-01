import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';

class CustomImage extends StatelessWidget {
  final double dimension;
  final String? image;
  final BoxFit? fit;
  final double borderRadius;
  final Color? color;
  final bool? isNetwork;
  const CustomImage(
      {super.key,
      this.dimension = 40.0,
      this.image,
      this.fit,
      this.isNetwork = false,
      this.borderRadius = 8.0,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: image == null
          ? SvgPicture.asset(noImage, height: 24.h)
          : image!.toLowerCase().endsWith('.svg')
              ? isNetwork!
                  ? SvgPicture.network(
                      image!,
                      height: dimension.h,
                      width: dimension.w,
                      fit: fit ?? BoxFit.contain,
                      placeholderBuilder: (BuildContext context) {
                        return SvgPicture.asset(noImage);
                      },
                    )
                  : SvgPicture.asset(
                      image!,
                      fit: fit ?? BoxFit.contain,
                      height: dimension.h,
                      width: dimension.w,
                      placeholderBuilder: (BuildContext context) {
                        return SvgPicture.asset(noImage);
                      },
                    )
              : isNetwork!
                  ? Image.asset(
                      image!,
                      fit: fit ?? BoxFit.contain,
                      height: dimension.h,
                      width: dimension.w,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return SvgPicture.asset(noImage);
                      },
                    )
                  : Image.network(
                      image!,
                      fit: fit ?? BoxFit.contain,
                      height: dimension.h,
                      width: dimension.w,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return SvgPicture.asset(noImage);
                      },
                    ),
    );
  }
}
