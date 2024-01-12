import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/contants/All_color.dart';
import '../../utils/contants/All_text.dart';
import '../../utils/contants/all_bases_url.dart';

class ItemDescWidget extends StatelessWidget {
  final AllProductModel model;

  const ItemDescWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: CachedNetworkImage(
              imageUrl: model.image,
              imageBuilder: (context, imageProvider) => Container(
                height: size.height / 2.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(
                height: size.height / 2.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/defaultImage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height / 2.7,
            width: size.width,
            height: size.height,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 14, right: 14, top: 14, bottom: 11),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: customStyle.copyWith(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${model.rating.rate} | ${model.rating.count}',
                          style: customStyle.copyWith(
                              color: Colors.grey.shade700, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Description',
                        style: customStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                  Text(
                    model.description,
                    style: customStyle.copyWith(
                        color: const Color(0xff0FF9B9B9B),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        letterSpacing: 1),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
              height: 100,
              width: size.width,
              child: Container(
                height: 100,
            width: size.width,
            decoration:  BoxDecoration(
              color:Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AllText.price,style: customStyle.copyWith(fontSize: 15),),
                        const SizedBox(height: 8,),
                        Text(
                          '${model.price}\$',
                          style: customStyle.copyWith(
                              fontSize: 24,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                              color: AllColors.primary),
                        ),
                      ],
                    )
                   ,
                    Container(
                      height: 62,
                        width: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AllColors.primary,
                        ),
                        child: Text(AllText.buy,style: customStyle.copyWith(color: Colors.white),)),
                  ],
                ),
          )

          )
        ],
      ),
    ));
  }
}
