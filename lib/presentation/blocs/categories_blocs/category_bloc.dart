import 'package:bloc/bloc.dart';
import 'package:clothes_shop/domain/models/all_products/all_product_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/network/api.dart';
import '../../../utils/resource/data_state.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<TakeCategoryItemEvent>(
      _takeCategoryItem,
    );
  }

  void _takeCategoryItem(
      TakeCategoryItemEvent event, Emitter<CategoryState> emit) async {
    try {
      emit(CategoryLoading());
      final FetchData fetchData = FetchData();
      final name = await fetchData.fetchCateName();
      print(name.runtimeType.toString());
      if (name.runtimeType == DataSuccess) {
        print('yea');
        final List model = name.data;
        model.insert(0,'All Products');
        final allProduct = await fetchData
            .fetchItemModel(event.id == 0 ? '' : model[event.id]);
        if (allProduct.runtimeType == DataSuccess) {
          print('yea2');
          emit(CategoryLoaded(category: model, cateItemList: allProduct.data));
        } else {
          emit(ErrorState(allProduct.error.toString()));
        }
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
      print('Bloc Catch ishlavotti $e');
    }
  }
}
