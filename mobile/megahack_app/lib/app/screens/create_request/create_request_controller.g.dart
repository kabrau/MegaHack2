// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateRequestController on _CreateRequestControllerBase, Store {
  final _$descriptionAtom =
      Atom(name: '_CreateRequestControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$listCategoryAtom =
      Atom(name: '_CreateRequestControllerBase.listCategory');

  @override
  ObservableFuture<List<Category>> get listCategory {
    _$listCategoryAtom.context.enforceReadPolicy(_$listCategoryAtom);
    _$listCategoryAtom.reportObserved();
    return super.listCategory;
  }

  @override
  set listCategory(ObservableFuture<List<Category>> value) {
    _$listCategoryAtom.context.conditionallyRunInAction(() {
      super.listCategory = value;
      _$listCategoryAtom.reportChanged();
    }, _$listCategoryAtom, name: '${_$listCategoryAtom.name}_set');
  }

  final _$selectedCategoryAtom =
      Atom(name: '_CreateRequestControllerBase.selectedCategory');

  @override
  Category get selectedCategory {
    _$selectedCategoryAtom.context.enforceReadPolicy(_$selectedCategoryAtom);
    _$selectedCategoryAtom.reportObserved();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Category value) {
    _$selectedCategoryAtom.context.conditionallyRunInAction(() {
      super.selectedCategory = value;
      _$selectedCategoryAtom.reportChanged();
    }, _$selectedCategoryAtom, name: '${_$selectedCategoryAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_CreateRequestControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_CreateRequestControllerBase.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$getCurrentUserAsyncAction = AsyncAction('getCurrentUser');

  @override
  Future getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$_CreateRequestControllerBaseActionController =
      ActionController(name: '_CreateRequestControllerBase');

  @override
  dynamic changeDescription(dynamic value) {
    final _$actionInfo =
        _$_CreateRequestControllerBaseActionController.startAction();
    try {
      return super.changeDescription(value);
    } finally {
      _$_CreateRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategory(Category value) {
    final _$actionInfo =
        _$_CreateRequestControllerBaseActionController.startAction();
    try {
      return super.changeCategory(value);
    } finally {
      _$_CreateRequestControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'description: ${description.toString()},listCategory: ${listCategory.toString()},selectedCategory: ${selectedCategory.toString()},loading: ${loading.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
