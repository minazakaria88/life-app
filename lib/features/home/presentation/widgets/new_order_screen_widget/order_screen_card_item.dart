import 'package:flutter/material.dart';
import 'package:life/core/helpers/extensions.dart';

class OrderScreenCardItem extends StatelessWidget {
  const OrderScreenCardItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });
  final Function onTap;
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: color,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  height: 70,
                  image,
                  fit: BoxFit.fill,
                ),
                10.height,
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                10.height,
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
