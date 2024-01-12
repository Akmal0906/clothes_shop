import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:clothes_shop/utils/contants/All_text.dart';
import 'package:flutter/material.dart';

import '../../data/datasource/local/loca_database_screen.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfFE9EBEA),
      body: FutureBuilder(
        future: LcalDatabases().getTasks(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data==null) {
            return Center(
              child: Text(
                AllText.didNotAdd,
                style: customStyle.copyWith(fontSize: 22),
              ),
            );
          } else if (snapshot.hasData) {
            return snapshot.data.isEmpty? const Center(
              child: Text('EMPTY'),
            ):Scrollbar(
              interactive: true,
              thickness: 5,
              thumbVisibility: true,
              trackVisibility: true,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    height: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data[index].image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 200,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Container(
                                height: 140,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/defaultimage.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 12),
                          child: Text(
                            snapshot.data[index].title,
                            style: customStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 16),
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
                                '${snapshot.data[index].rating.rate} | ${snapshot.data[index].rating.count}',
                                style: customStyle.copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '\$${snapshot.data[index].price}',
                                style: customStyle.copyWith(
                                    color: const Color(
                                      0xff2A977D,
                                    ),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),

                              Expanded(child: Align(
                                alignment: Alignment.bottomLeft,
                                child: IconButton(
                                  icon:const Icon(Icons.delete,color: Colors.orange,size: 20,),
                                  onPressed: ()async{
                                     LcalDatabases().clearTask();
                                     List<AllProductModel> alList=snapshot.data;
                                    alList.removeAt(index);
                                    for(var item in alList){
                                      LcalDatabases().saveData(item);
                                    }
                                    setState(() {

                                    });
                                  },
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return Center(
            child: Text(
              AllText.wentWrong,
              style: customStyle.copyWith(color: Colors.black,fontSize: 28),
            ),
          );
        },
      ),
    );
  }
}
