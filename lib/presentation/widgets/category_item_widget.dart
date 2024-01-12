import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:clothes_shop/utils/resource/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/datasource/local/loca_database_screen.dart';
import '../../utils/contants/All_color.dart';
import '../../utils/contants/All_text.dart';

class CategoryItemWidget extends StatelessWidget {
  final List<AllProductModel> list;
  final int indexx;

  const CategoryItemWidget(
      {super.key, required this.list, required this.indexx});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        bottom: 9,
        left: 4,
        top: 10,
        right: 4,
      ),
      margin: const EdgeInsets.all(5),
      width: size.width / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: list[indexx].image,
              imageBuilder: (context, imageProvider) => Container(
                height: size.height / 4.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(
                height: size.height / 4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/defaultimage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(
              list[indexx].title,
              style: customStyle.copyWith(
                  fontSize: 12, fontWeight: FontWeight.normal),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${list[indexx].rating.rate} | ${list[indexx].rating.count}',
                  style: customStyle.copyWith(
                      color: Colors.grey.shade700, fontSize: 15),
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          ),

          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 22,bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${list[indexx].price}\$",
                          style: customStyle.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),

                        GestureDetector(
                          onTap: () async {
                            LcalDatabases().saveData(list[indexx]);
                            toastMessage('Successfull aded to Basket');
                          },
                          child: SvgPicture.asset(
                            'assets/images/korzinla.svg',
                            fit: BoxFit.cover,
                            height: 28,
                            width: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                  GestureDetector(
                    child: Container(
                      height: 36,
                      width: size.width / 2 - 44,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AllColors.primary,
                      ),
                      child: Text(
                        AllText.buy,
                        style: customStyle.copyWith(
                          color: AllColors.primaryWhite,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                              ],
                            ),
                ],
              )),
        ],
      ),
    );
  }
}
