import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
                Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: const Color.fromARGB(255, 0, 0, 0), //Default value
            colorOpacity: 0.1, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(), //Default Value
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
                Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: const Color.fromARGB(255, 0, 0, 0), //Default value
            colorOpacity: 0.1, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(), //Default Value
            child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval:
                    Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: const Color.fromARGB(255, 0, 0, 0), //Default value
                colorOpacity: 0.1, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(), //Default Value
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade300,
                  ),
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              Spacer(),
              Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval:
                    Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: const Color.fromARGB(255, 0, 0, 0), //Default value
                colorOpacity: 0.1, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(), //Default Value
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ...List.generate(8, (index) {
            return Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Shimmer(
                duration: Duration(seconds: 2), //Default value
                interval:
                    Duration(seconds: 1), //Default value: Duration(seconds: 0)
                color: const Color.fromARGB(255, 0, 0, 0), //Default value
                colorOpacity: 0.1, //Default value
                enabled: true, //Default value
                direction: ShimmerDirection.fromLTRB(), //Default Value
                child: Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
