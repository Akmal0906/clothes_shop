import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:clothes_shop/presentation/widgets/item_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/contants/All_color.dart';
import '../../utils/contants/All_text.dart';
import '../blocs/categories_blocs/category_bloc.dart';
import '../widgets/category_item_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);


  }

  TextStyle style = const TextStyle(color: Colors.white);
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (BuildContext context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoaded) {
          return Scaffold(
            backgroundColor: const Color(0xfFE9EBEA),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AllText.apbar,
                style: style.copyWith(fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: AllColors.primaryWhite,
                ),
                onPressed: () {},
              ),
              bottom: TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    count = index;
                    context.read<CategoryBloc>().add(
                        TakeCategoryItemEvent(index));
                  },
                  indicatorColor: Colors.white,
                  controller: tabController,
                  mouseCursor: MouseCursor.defer,
                  unselectedLabelStyle: customStyle.copyWith(
                      color: AllColors.buttonGrey),
                  labelStyle: customStyle,
                  tabs: state.category
                      .map(
                        (e) =>
                        Tab(
                          child: Text(e),
                        ),
                  )
                      .toList()),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: List.generate(
                    state.category.length,
                        (index) =>
                    count == index
                        ? GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.cateItemList.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 2,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10
                        ),
                        itemBuilder: (BuildContext context, int indexx) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ItemDescWidget(
                                            model: state.cateItemList[indexx])));
                              },
                              child: CategoryItemWidget(
                                indexx: indexx,
                                list: state.cateItemList,
                              ));
                        })
                        : const SizedBox.shrink()).toList()),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.error, style: customStyle,),
          );
        } else {
          return Center(
            child: Text('ISHLAMADI STATE', style: customStyle,),
          );
        }
      },
    );
  }
}

