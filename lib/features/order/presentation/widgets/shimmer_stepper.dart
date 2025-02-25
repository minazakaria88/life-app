import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerStepper extends StatelessWidget {
  const ShimmerStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 3, // Adjust the number of steps as needed
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Container(
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                  ),
                  title: Container(
                    width: 150,
                    height: 20,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    width: 200,
                    height: 10,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    color: Colors.white,
                    width: 3,
                    height: 100,
                  ),
                ),
                if(index==2)
                  ListTile(
                    leading: CircleAvatar(
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    title: Container(
                      width: 150,
                      height: 20,
                      color: Colors.white,
                    ),
                    subtitle: Container(
                      width: 200,
                      height: 10,
                      color: Colors.white,
                    ),
                  ),

              ],
            ),
          );

        },
      ),
    );
  }
}