// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_publication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyPublicationController on _MyPublicationControllerBase, Store {
  final _$listPublicationAtom =
      Atom(name: '_MyPublicationControllerBase.listPublication');

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

  final _$listRequestAtom =
      Atom(name: '_MyPublicationControllerBase.listRequest');

  @override
  ObservableFuture<List<Publication>> get listRequest {
    _$listRequestAtom.context.enforceReadPolicy(_$listRequestAtom);
    _$listRequestAtom.reportObserved();
    return super.listRequest;
  }

  @override
  set listRequest(ObservableFuture<List<Publication>> value) {
    _$listRequestAtom.context.conditionallyRunInAction(() {
      super.listRequest = value;
      _$listRequestAtom.reportChanged();
    }, _$listRequestAtom, name: '${_$listRequestAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_MyPublicationControllerBase.category');

  @override
  Category get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_MyPublicationControllerBase.loading');

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

  final _$userAtom = Atom(name: '_MyPublicationControllerBase.user');

  @override
  String get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$selectedIndexAtom =
      Atom(name: '_MyPublicationControllerBase.selectedIndex');

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

  final _$getCurrentUserAsyncAction = AsyncAction('getCurrentUser');

  @override
  Future getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$_MyPublicationControllerBaseActionController =
      ActionController(name: '_MyPublicationControllerBase');

  @override
  void changePage(int index) {
    final _$actionInfo =
        _$_MyPublicationControllerBaseActionController.startAction();
    try {
      return super.changePage(index);
    } finally {
      _$_MyPublicationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listPublication: ${listPublication.toString()},listRequest: ${listRequest.toString()},category: ${category.toString()},loading: ${loading.toString()},user: ${user.toString()},selectedIndex: ${selectedIndex.toString()}';
    return '{$string}';
  }
}
