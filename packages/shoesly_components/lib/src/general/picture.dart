// Copyright (c) 2023. Shoesly Authors. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class Picture extends StatelessWidget {
  const Picture({
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AssetBytesLoader(source, packageName: 'shoesly_resources'),
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class PictureAssets extends StatelessWidget {
  const PictureAssets({
    required this.source,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      source,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
