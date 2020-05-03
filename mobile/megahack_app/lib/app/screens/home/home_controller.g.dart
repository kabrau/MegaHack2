// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listPublicationAtom =
      Atom(name: '_HomeControllerBase.listPublication');

  @override
  ObservableFuture<List<Publication>> get listPublication {
    _$listPublicationAtom.context.enforceReadPolicy(_$listPublicationAtom);
    _$listPublicationAtom.reportObserved();
    return super.listPublication;
  }

  @override
  set listPublication(ObservableFuture<List<Publication>> value) {
    _$listPublicationAtom.context.conditionallyRunInAction(() {
      super.listPublication = value;
      _$listPublicationAtom.reportChanged();
    }, _$listPublicationAtom, name: '${_$listPublicationAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listPublication: ${listPublication.toString()}';
    return '{$string}';
  }
}
