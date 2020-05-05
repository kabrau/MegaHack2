// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_publication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreatePublicationController on _CreatePublicationControllerBase, Store {
  final _$descriptionAtom =
      Atom(name: '_CreatePublicationControllerBase.description');

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

  final _$loadingAtom = Atom(name: '_CreatePublicationControllerBase.loading');

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

  final _$userAtom = Atom(name: '_CreatePublicationControllerBase.user');

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

  final _$_CreatePublicationControllerBaseActionController =
      ActionController(name: '_CreatePublicationControllerBase');

  @override
  dynamic changeDescription(dynamic value) {
    final _$actionInfo =
        _$_CreatePublicationControllerBaseActionController.startAction();
    try {
      return super.changeDescription(value);
    } finally {
      _$_CreatePublicationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'description: ${description.toString()},loading: ${loading.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
