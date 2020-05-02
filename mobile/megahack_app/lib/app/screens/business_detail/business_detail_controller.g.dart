// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BusinessDetailController on _BusinessDetailControllerBase, Store {
  final _$listPortfolioAtom =
      Atom(name: '_BusinessDetailControllerBase.listPortfolio');

  @override
  ObservableFuture<List<Portfolio>> get listPortfolio {
    _$listPortfolioAtom.context.enforceReadPolicy(_$listPortfolioAtom);
    _$listPortfolioAtom.reportObserved();
    return super.listPortfolio;
  }

  @override
  set listPortfolio(ObservableFuture<List<Portfolio>> value) {
    _$listPortfolioAtom.context.conditionallyRunInAction(() {
      super.listPortfolio = value;
      _$listPortfolioAtom.reportChanged();
    }, _$listPortfolioAtom, name: '${_$listPortfolioAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listPortfolio: ${listPortfolio.toString()}';
    return '{$string}';
  }
}
