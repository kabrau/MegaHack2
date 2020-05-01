// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_scaffold_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainScaffoldController on _MainScaffoldControllerBase, Store {
  final _$selectedIndexAtom =
      Atom(name: '_MainScaffoldControllerBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.context.enforceReadPolicy(_$selectedIndexAtom);
    _$selectedIndexAtom.reportObserved();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.context.conditionallyRunInAction(() {
      super.selectedIndex = value;
      _$selectedIndexAtom.reportChanged();
    }, _$selectedIndexAtom, name: '${_$selectedIndexAtom.name}_set');
  }

  final _$_MainScaffoldControllerBaseActionController =
      ActionController(name: '_MainScaffoldControllerBase');

  @override
  void changePage(int index) {
    final _$actionInfo =
        _$_MainScaffoldControllerBaseActionController.startAction();
    try {
      return super.changePage(index);
    } finally {
      _$_MainScaffoldControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'selectedIndex: ${selectedIndex.toString()}';
    return '{$string}';
  }
}
