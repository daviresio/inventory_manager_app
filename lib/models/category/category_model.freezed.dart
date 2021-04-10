// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
class _$CategoryModelTearOff {
  const _$CategoryModelTearOff();

  _CategoryModel call(
      {String? id, required String name, String? value, String? valueType}) {
    return _CategoryModel(
      id: id,
      name: name,
      value: value,
      valueType: valueType,
    );
  }

  CategoryModel fromJson(Map<String, Object> json) {
    return CategoryModel.fromJson(json);
  }
}

/// @nodoc
const $CategoryModel = _$CategoryModelTearOff();

/// @nodoc
mixin _$CategoryModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get valueType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res>;
  $Res call({String? id, String name, String? value, String? valueType});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  final CategoryModel _value;
  // ignore: unused_field
  final $Res Function(CategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? value = freezed,
    Object? valueType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: valueType == freezed
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CategoryModelCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(
          _CategoryModel value, $Res Function(_CategoryModel) then) =
      __$CategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String name, String? value, String? valueType});
}

/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(
      _CategoryModel _value, $Res Function(_CategoryModel) _then)
      : super(_value, (v) => _then(v as _CategoryModel));

  @override
  _CategoryModel get _value => super._value as _CategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? value = freezed,
    Object? valueType = freezed,
  }) {
    return _then(_CategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      valueType: valueType == freezed
          ? _value.valueType
          : valueType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)

/// @nodoc
class _$_CategoryModel implements _CategoryModel {
  _$_CategoryModel({this.id, required this.name, this.value, this.valueType});

  factory _$_CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryModelFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? value;
  @override
  final String? valueType;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, value: $value, valueType: $valueType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.valueType, valueType) ||
                const DeepCollectionEquality()
                    .equals(other.valueType, valueType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(valueType);

  @JsonKey(ignore: true)
  @override
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryModelToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  factory _CategoryModel(
      {String? id,
      required String name,
      String? value,
      String? valueType}) = _$_CategoryModel;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get value => throw _privateConstructorUsedError;
  @override
  String? get valueType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryModelCopyWith<_CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

  CategoryData data(CategoryModel category) {
    return CategoryData(
      category,
    );
  }

  CategoryLoading loading() {
    return const CategoryLoading();
  }

  CategoryError error(Object error, StackTrace stackTrace) {
    return CategoryError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryData value) data,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryData value)? data,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) then) =
      _$CategoryDataCopyWithImpl<$Res>;
  $Res call({CategoryModel category});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(
      CategoryData _value, $Res Function(CategoryData) _then)
      : super(_value, (v) => _then(v as CategoryData));

  @override
  CategoryData get _value => super._value as CategoryData;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(CategoryData(
      category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }

  @override
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
class _$CategoryData implements CategoryData {
  const _$CategoryData(this.category);

  @override
  final CategoryModel category;

  @override
  String toString() {
    return 'Category.data(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryData &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      _$CategoryDataCopyWithImpl<CategoryData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryData value) data,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryData value)? data,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class CategoryData implements Category {
  const factory CategoryData(CategoryModel category) = _$CategoryData;

  CategoryModel get category => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLoadingCopyWith<$Res> {
  factory $CategoryLoadingCopyWith(
          CategoryLoading value, $Res Function(CategoryLoading) then) =
      _$CategoryLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryLoadingCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements $CategoryLoadingCopyWith<$Res> {
  _$CategoryLoadingCopyWithImpl(
      CategoryLoading _value, $Res Function(CategoryLoading) _then)
      : super(_value, (v) => _then(v as CategoryLoading));

  @override
  CategoryLoading get _value => super._value as CategoryLoading;
}

/// @nodoc
class _$CategoryLoading implements CategoryLoading {
  const _$CategoryLoading();

  @override
  String toString() {
    return 'Category.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryData value) data,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryData value)? data,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading implements Category {
  const factory CategoryLoading() = _$CategoryLoading;
}

/// @nodoc
abstract class $CategoryErrorCopyWith<$Res> {
  factory $CategoryErrorCopyWith(
          CategoryError value, $Res Function(CategoryError) then) =
      _$CategoryErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$CategoryErrorCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements $CategoryErrorCopyWith<$Res> {
  _$CategoryErrorCopyWithImpl(
      CategoryError _value, $Res Function(CategoryError) _then)
      : super(_value, (v) => _then(v as CategoryError));

  @override
  CategoryError get _value => super._value as CategoryError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(CategoryError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc
class _$CategoryError implements CategoryError {
  const _$CategoryError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'Category.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality()
                    .equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $CategoryErrorCopyWith<CategoryError> get copyWith =>
      _$CategoryErrorCopyWithImpl<CategoryError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryData value) data,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryData value)? data,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryError implements Category {
  const factory CategoryError(Object error, StackTrace stackTrace) =
      _$CategoryError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryErrorCopyWith<CategoryError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CategoryListTearOff {
  const _$CategoryListTearOff();

  CategoryListData data(List<CategoryModel> categories) {
    return CategoryListData(
      categories,
    );
  }

  CategoryListLoading loading() {
    return const CategoryListLoading();
  }

  CategoryListError error(Object error, StackTrace stackTrace) {
    return CategoryListError(
      error,
      stackTrace,
    );
  }
}

/// @nodoc
const $CategoryList = _$CategoryListTearOff();

/// @nodoc
mixin _$CategoryList {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryListData value) data,
    required TResult Function(CategoryListLoading value) loading,
    required TResult Function(CategoryListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryListData value)? data,
    TResult Function(CategoryListLoading value)? loading,
    TResult Function(CategoryListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListCopyWith<$Res> {
  factory $CategoryListCopyWith(
          CategoryList value, $Res Function(CategoryList) then) =
      _$CategoryListCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryListCopyWithImpl<$Res> implements $CategoryListCopyWith<$Res> {
  _$CategoryListCopyWithImpl(this._value, this._then);

  final CategoryList _value;
  // ignore: unused_field
  final $Res Function(CategoryList) _then;
}

/// @nodoc
abstract class $CategoryListDataCopyWith<$Res> {
  factory $CategoryListDataCopyWith(
          CategoryListData value, $Res Function(CategoryListData) then) =
      _$CategoryListDataCopyWithImpl<$Res>;
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class _$CategoryListDataCopyWithImpl<$Res>
    extends _$CategoryListCopyWithImpl<$Res>
    implements $CategoryListDataCopyWith<$Res> {
  _$CategoryListDataCopyWithImpl(
      CategoryListData _value, $Res Function(CategoryListData) _then)
      : super(_value, (v) => _then(v as CategoryListData));

  @override
  CategoryListData get _value => super._value as CategoryListData;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(CategoryListData(
      categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
class _$CategoryListData implements CategoryListData {
  const _$CategoryListData(this.categories);

  @override
  final List<CategoryModel> categories;

  @override
  String toString() {
    return 'CategoryList.data(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryListData &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  $CategoryListDataCopyWith<CategoryListData> get copyWith =>
      _$CategoryListDataCopyWithImpl<CategoryListData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return data(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryListData value) data,
    required TResult Function(CategoryListLoading value) loading,
    required TResult Function(CategoryListError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryListData value)? data,
    TResult Function(CategoryListLoading value)? loading,
    TResult Function(CategoryListError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class CategoryListData implements CategoryList {
  const factory CategoryListData(List<CategoryModel> categories) =
      _$CategoryListData;

  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryListDataCopyWith<CategoryListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryListLoadingCopyWith<$Res> {
  factory $CategoryListLoadingCopyWith(
          CategoryListLoading value, $Res Function(CategoryListLoading) then) =
      _$CategoryListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategoryListLoadingCopyWithImpl<$Res>
    extends _$CategoryListCopyWithImpl<$Res>
    implements $CategoryListLoadingCopyWith<$Res> {
  _$CategoryListLoadingCopyWithImpl(
      CategoryListLoading _value, $Res Function(CategoryListLoading) _then)
      : super(_value, (v) => _then(v as CategoryListLoading));

  @override
  CategoryListLoading get _value => super._value as CategoryListLoading;
}

/// @nodoc
class _$CategoryListLoading implements CategoryListLoading {
  const _$CategoryListLoading();

  @override
  String toString() {
    return 'CategoryList.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CategoryListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryListData value) data,
    required TResult Function(CategoryListLoading value) loading,
    required TResult Function(CategoryListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryListData value)? data,
    TResult Function(CategoryListLoading value)? loading,
    TResult Function(CategoryListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryListLoading implements CategoryList {
  const factory CategoryListLoading() = _$CategoryListLoading;
}

/// @nodoc
abstract class $CategoryListErrorCopyWith<$Res> {
  factory $CategoryListErrorCopyWith(
          CategoryListError value, $Res Function(CategoryListError) then) =
      _$CategoryListErrorCopyWithImpl<$Res>;
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class _$CategoryListErrorCopyWithImpl<$Res>
    extends _$CategoryListCopyWithImpl<$Res>
    implements $CategoryListErrorCopyWith<$Res> {
  _$CategoryListErrorCopyWithImpl(
      CategoryListError _value, $Res Function(CategoryListError) _then)
      : super(_value, (v) => _then(v as CategoryListError));

  @override
  CategoryListError get _value => super._value as CategoryListError;

  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(CategoryListError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
      stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc
class _$CategoryListError implements CategoryListError {
  const _$CategoryListError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'CategoryList.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategoryListError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.stackTrace, stackTrace) ||
                const DeepCollectionEquality()
                    .equals(other.stackTrace, stackTrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(stackTrace);

  @JsonKey(ignore: true)
  @override
  $CategoryListErrorCopyWith<CategoryListError> get copyWith =>
      _$CategoryListErrorCopyWithImpl<CategoryListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) data,
    required TResult Function() loading,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? data,
    TResult Function()? loading,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategoryListData value) data,
    required TResult Function(CategoryListLoading value) loading,
    required TResult Function(CategoryListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategoryListData value)? data,
    TResult Function(CategoryListLoading value)? loading,
    TResult Function(CategoryListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CategoryListError implements CategoryList {
  const factory CategoryListError(Object error, StackTrace stackTrace) =
      _$CategoryListError;

  Object get error => throw _privateConstructorUsedError;
  StackTrace get stackTrace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryListErrorCopyWith<CategoryListError> get copyWith =>
      throw _privateConstructorUsedError;
}
