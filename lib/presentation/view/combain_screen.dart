import 'package:clothes_shop/utils/contants/All_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/contants/All_color.dart';
import '../blocs/categories_blocs/category_bloc.dart';
import 'basket_screen.dart';
import 'home_screen.dart';

class CombainScreen extends StatefulWidget {
  const CombainScreen({super.key});

  @override
  State<CombainScreen> createState() => _CombainScreenState();
}

class _CombainScreenState extends State<CombainScreen> {
  List<Widget> list = [
    const HomeScreen(),
    const BasketScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      context.read<CategoryBloc>().add(const TakeCategoryItemEvent(0));
    }
    return Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor:const Color(0xff0FFC67C4E),
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: customStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
          unselectedItemColor: Colors.grey.shade400,
          unselectedLabelStyle: customStyle.copyWith(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
          onTap: (current) {
            setState(() {
              currentIndex = current;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/korzinla.svg'),
                label: 'Basket'),
          ],
        ),
      ),
    );
  }
}
