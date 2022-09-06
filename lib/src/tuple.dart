/// A [Tuple] is a collection with fixed length and elements.
///
/// The [Tuple] is created by initialising the [List] that manages
/// the [Tuple] with the elements of [List] passed as argument to
/// the constructor.
///
/// It can be said that a [Tuple] is a [List] with fixed `length` and `elements`.
///
/// Example:
/// ```dart
/// final tuple = Tuple.fromList([5, 7, 15, 20, 'a', 'b']);
/// print(tuple.runtimeType); // Tuple<Object>
///
/// // Checking for elements in tuple
/// tuple.contains(15); // true
/// print(tuple.firstWhere((element) => element is num && element > 10))); // 15
/// ```
class Tuple<E> {
  /// The [List] used to store the [Tuple] and its `elements`.
  final List _tupleList;

  /// Whether this `collection` has no elements.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple();
  /// print(tuple.isEmpty); // true
  /// ```
  bool get isEmpty => _tupleList.isEmpty;

  /// The number of `elements` in this `collection`.
  ///
  /// The valid indices are `0` through `length - 1`
  ///
  /// ```dart
  /// final tuple = Tuple.fromList([2, 5, 9, 44]);
  /// print(tuple.length); // 4
  /// ```
  int get length => _tupleList.length;

  /// Creates a [Tuple] object containing the elements of
  /// the [List] passed as argument.
  ///
  /// The [List] that manages [Tuple] will be initialised with
  /// the elements of the [List] passed as argument.
  ///
  /// ```dart
  /// final tuple = Tuple.fromList([5, 9, 30, 'w']);
  /// print(tuple); // [5, 9, 30, w]
  /// ```
  Tuple.fromList(List<E> list) : _tupleList = list;

  /// Checks whether [Tuple] contains [element] or not.
  ///
  /// A `bool` object will be returned.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple.fromList([5, 9, 'a', 'b']);
  /// bool hasElement = tuple.contains('a');
  /// print(hasElement); // true
  /// ```
  bool contains(E element) {
    for (E item in _tupleList) {
      if (item == element) return true;
    }
    return false;
  }

  /// Returns the `element` at a specified [index].
  ///
  /// If the index is invalid `null` will be returned.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple.fromList([2, 4, 6, 'a']);
  /// final element = tuple.elementAt(3);
  /// print(element); // a
  /// ```
  E? elementAt(int index) => _isValidIndex(index) ? _tupleList[index] : null;

  // helper function to validate index
  bool _isValidIndex(index) =>
      index >= 0 && index < _tupleList.length ? true : false;

  /// Returns the first `element` that satisfies a condition received
  /// as argument.
  ///
  /// If no `element` is found `null` will be returned instead.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple.fromList([2, 4, 6, 15, 18 'a']);
  /// print(tuple.firstWhere((element) => element is num && element > 10)); // 15
  /// ```
  firstWhere(bool Function(E element) test) {
    for (E element in _tupleList) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Returns the last `element` that satisfies a condition received
  /// as argument.
  ///
  /// If no `element` is found `null` will be returned instead.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple.fromList([2, 4, 6, 15, 18 'a']);
  /// print(tuple.lastWhere((element) => element is num && element > 10)); // 18
  /// ```
  lastWhere(bool Function(E element) test) {
    for (E element in _tupleList.reversed) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Returns the `index` of the first `element` that satisfies
  /// a condition received as argument.
  ///
  /// If no element is found `null` will be returned instead.
  ///
  /// Example:
  /// ```dart
  /// final tuple = Tuple.fromList([2, 4, 6, 15, 18 'a']);
  /// print(tuple.indexWhere((element) => element is num && element > 10)); // 3
  /// ```
  indexWhere(bool Function(E element) test) {
    for (E element in _tupleList) {
      if (test(element)) return _tupleList.indexOf(element);
    }
    return null;
  }

  @override
  String toString() {
    return _tupleList.toString();
  }
}
