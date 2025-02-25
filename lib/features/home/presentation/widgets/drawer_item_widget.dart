import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    super.key, required this.onTap, required this.title, required this.image,
  });
  final Function onTap;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}