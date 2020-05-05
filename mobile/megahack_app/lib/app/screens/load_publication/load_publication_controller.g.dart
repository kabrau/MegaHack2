// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_publication_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadPublicationController on _LoadPublicationControllerBase, Store {
  final _$descriptionAtom =
      Atom(name: '_LoadPublicationControllerBase.description');

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

  final _$listCommentAtom =
      Atom(name: '_LoadPublicationControllerBase.listComment');

  @override
  ObservableFuture<List<Comment>> get listComment {
    _$listCommentAtom.context.enforceReadPolicy(_$listCommentAtom);
    _$listCommentAtom.reportObserved();
    return super.listComment;
  }

  @override
  set listComment(ObservableFuture<List<Comment>> value) {
    _$listCommentAtom.context.conditionallyRunInAction(() {
      super.listComment = value;
      _$listCommentAtom.reportChanged();
    }, _$listCommentAtom, name: '${_$listCommentAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_LoadPublicationControllerBase.loading');

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

  final _$userAtom = Atom(name: '_LoadPublicationControllerBase.user');

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

  final _$_LoadPublicationControllerBaseActionController =
      ActionController(name: '_LoadPublicationControllerBase');

  @override
  dynamic changeComment(dynamic value) {
    final _$actionInfo =
        _$_LoadPublicationControllerBaseActionController.startAction();
    try {
      return super.changeComment(value);
    } finally {
      _$_LoadPublicationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'description: ${description.toString()},listComment: ${listComment.toString()},loading: ${loading.toString()},user: ${user.toString()}';
    return '{$string}';
  }
}
