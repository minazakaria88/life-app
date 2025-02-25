import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 170,
      child: Image.asset(
        Assets.imagesLifeHouse,
        fit: BoxFit.fill,
      ),
    );
  }
}