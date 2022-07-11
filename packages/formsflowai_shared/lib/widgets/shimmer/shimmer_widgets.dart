import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formsflowai_shared/shared/app_color.dart';
import 'package:shimmer/shimmer.dart';

import '../../shared/dimens.dart';

class ShimmerWidgets {
  static Widget getImageLoadingShimmerView(double? width, double? height) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: AppColor.grey7,
          height: height,
          width: width,
        ));
  }

  static Widget getCircleImageLoadingShimmerView(
      double? width, double? height) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const CircleAvatar(
          backgroundColor: AppColor.grey7,
        ),
      ),
    );
  }

  static Widget getShimmerContainer(
      {required EdgeInsetsGeometry margin,
      required EdgeInsetsGeometry padding,
      required double width,
      required double height,
      required BorderRadius borderRadius}) {
    return Padding(
        padding: margin,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
                color: AppColor.grey7, borderRadius: borderRadius),
          ),
        ));
  }

  // Function to return shimmer list

  static Widget showShimmerListView() {
    return Padding(
        padding: const EdgeInsets.all(Dimens.spacing_16),
        child: ListView.builder(
          primary: false,
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return itemInflateShimmer();
          },
        ));
  }

  // Function to return shimmer list inflate views

  static Widget itemInflateShimmer() {
    return Container(
      height: Dimens.size_140,
      padding: new EdgeInsets.all(Dimens.spacing_10),
      child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.spacing_15),
          ),
          child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: Dimens.size_8,
                        height: Dimens.size_140,
                        padding: const EdgeInsets.only(
                            top: Dimens.spacing_5,
                            bottom: Dimens.spacing_5,
                            left: Dimens.spacing_8),
                        decoration: const BoxDecoration(
                          color: AppColor.grey7,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.spacing_8),
                              bottomLeft: Radius.circular(Dimens.spacing_8)),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_16,
                                top: Dimens.spacing_16),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: Dimens.spacing_16,
                                    top: Dimens.spacing_8),
                                width: Dimens.size_150,
                                height: Dimens.size_15,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColor.grey7,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.spacing_5))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimens.spacing_16, top: Dimens.spacing_8),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: Dimens.spacing_16,
                                    top: Dimens.spacing_8),
                                width: Dimens.size_150,
                                height: Dimens.size_15,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColor.grey7,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(Dimens.spacing_5))),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.spacing_16,
                                    top: Dimens.spacing_8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: Dimens.spacing_16,
                                        top: Dimens.spacing_8),
                                    width: Dimens.size_150,
                                    height: Dimens.size_15,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.grey7,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Dimens.spacing_5))),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: Dimens.spacing_16,
                                    top: Dimens.spacing_8),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: Dimens.spacing_16,
                                        top: Dimens.spacing_8),
                                    width: Dimens.size_40,
                                    height: Dimens.size_15,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColor.grey7,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(Dimens.spacing_5))),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ))),
    );
  }
}
