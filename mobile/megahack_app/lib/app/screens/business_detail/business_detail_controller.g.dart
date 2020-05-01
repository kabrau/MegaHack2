// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BusinessDetailController on _BusinessDetailControllerBase, Store {
  final _$listProductAtom =
      Atom(name: '_BusinessDetailControllerBase.listProduct');

  @override
  ObservableFuture<List<Product>> get listProduct {
    _$listProductAtom.context.enforceReadPolicy(_$listProductAtom);
    _$listProductAtom.reportObserved();
    return super.listProduct;
  }

  @override
  set listProduct(ObservableFuture<List<Product>> value) {
    _$listProductAtom.context.conditionallyRunInAction(() {
      super.listProduct = value;
      _$listProductAtom.reportChanged();
    }, _$listProductAtom, name: '${_$listProductAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listProduct: ${listProduct.toString()}';
    return '{$string}';
  }
}
