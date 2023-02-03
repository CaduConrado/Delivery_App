import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(
    this._productsRepository,
  ) : super(const HomeState.inital());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos'),
      );
    }
  }
}
