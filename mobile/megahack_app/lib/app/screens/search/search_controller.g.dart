// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  final _$listCompanyAtom = Atom(name: '_SearchControllerBase.listCompany');

  @override
  ObservableFuture<List<Company>> get listCompany {
    _$listCompanyAtom.context.enforceReadPolicy(_$listCompanyAtom);
    _$listCompanyAtom.reportObserved();
    return super.listCompany;
  }

  @override
  set listCompany(ObservableFuture<List<Company>> value) {
    _$listCompanyAtom.context.conditionallyRunInAction(() {
      super.listCompany = value;
      _$listCompanyAtom.reportChanged();
    }, _$listCompanyAtom, name: '${_$listCompanyAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listCompany: ${listCompany.toString()}';
    return '{$string}';
  }
}
