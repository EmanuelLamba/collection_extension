/// A [SpecialQueue] is a `collection` that can be manipulated at both ends.
/// One can execute the specialQueue using [executeQueue] method.
///
/// The [SpecialQueue] can be created either empty or with `elements`
/// given through a [List].
///
/// For simplicity reasons [SpecialQueue] is a [List] with it's own
/// specific methods.
///
/// Example:
/// final specialQueue = SpecialQueue();
/// print(specialQueue.runtimeType); // SpecialQueue<Object>
///
/// // Adding elements to the specialQueue
/// specialQueue.push(5);
/// specialQueue.pushAll([3, 'a', 66]);
/// specialQueue.pushFirst(777);
/// print(specialQueue); // [777, 5, 3, 'a', 66]
///
/// // Removing elements from the specialQueue
/// specialQueue.removeFirst();
/// specialQueue.removeLast();
/// print(specialQueue); // [5, 3, 'a']
/// ```
class SpecialQueue<E> {
  /// The [List] used to store the [SpecialQueue] and its `elements`.
  final List _queueList;

  /// Whether this `collection` has no elements.
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue();
  /// print(specialQueue.isEmpty); // true
  /// ```
  bool get isEmpty => _queueList.isEmpty;

  /// Whether this `collection` has elements to pop.
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue();
  /// print(specialQueue.canPop); // false
  /// ```
  bool get canPop => _queueList.isNotEmpty;

  /// The number of `elements` in this `collection`.
  ///
  /// The valid indices are `0` through `length - 1`
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([2, 5, 9, 44]);
  /// print(specialQueue.length); // 4
  /// ```
  int get length => _queueList.length;

  /// The first element of the `collection`.
  ///
  /// If the `collection` is empty `null` will be return instead.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([2, 5, 9, 44]);
  /// print(specialQueue.peak) // 2
  /// ```
  E? get peak => _queueList.isNotEmpty ? _queueList[0] : null;

  /// Creates an empty [SpecialQueue] object.
  ///
  /// The `constructor` will initialise the [List] that manages
  /// [SpecialQueue] object.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue();
  /// print(specialQueue); // []
  /// ```
  SpecialQueue() : _queueList = <E>[];

  /// Creates a [SpecialQueue] object containing the elements of
  /// the [List] passed as argument.
  ///
  /// The [List] that manages [SpecialQueue] will be initialised with
  /// the elements of the [List] passed as argument.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 30, 'w']);
  /// print(specialQueue); // [5, 9, 30, w]
  /// ```
  SpecialQueue.fromList(List<E> list) : _queueList = list;

  /// Inserts [element] to the end of the [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([7, 8]);
  /// specialQueue.push(5);
  /// print(specialQueue); // [7, 8, 5]
  /// ```
  void push(E element) => _queueList.add(element);

  /// Inserts all elements from [iterable] to the end of [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([2, 4]);
  /// specialQueue.pushAll([5, 9, 77, 'a']);
  /// print(specialQueue); // [2, 4, 5, 9, 77, 'a']
  /// ```
  void pushAll(Iterable<E> iterable) => _queueList.addAll(iterable);

  /// Inserts [element] at the beginning of the [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([2, 4]);
  /// specialQueue.pushFirst(9);
  /// print(specialQueue); // [9, 2, 4]
  /// ```
  void pushFirst(E element) => _queueList.insert(0, element);

  /// Removes the last `element` of the [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// specialQueue.pop();
  /// print(specialQueue); // [5, 9]
  /// ```
  void pop() {
    if (canPop) _queueList.removeAt(0);
  }

  /// Checks whether [SpecialQueue] contains [element] or not.
  ///
  /// A `bool` object will be returned.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// bool hasElement = specialQueue.contains(9);
  /// print(hasElement); // true
  /// ```
  bool contains(E element) {
    for (E item in _queueList) {
      if (item == element) return true;
    }
    return false;
  }

  /// Removes [element] from the [SpecialQueue].
  ///
  /// If the list has `elements` it will try to find [element]
  /// and delete it.
  ///
  /// A `bool` object will be returned.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// bool isRemoved = specialQueue.remove(9);
  /// print(isRemoved); // true
  /// ```
  bool remove(E element) {
    if (canPop) {
      for (int i = 0; i < _queueList.length; i++) {
        if (element == _queueList[i]) {
          for (int j = i; j < _queueList.length - 1; j++) {
            _queueList[j] = _queueList[j + 1];
          }
          return true;
        }
      }
    }
    return false;
  }

  /// Removes the last `element` of the [SpecialQueue].
  ///
  /// The removed `element` will be returned.
  /// If the list has no `elements` it will return `null`.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// bool elementRemoved = specialQueue.removeLast();
  /// print(elementRemoved); // 'a'
  /// ```
  E? removeLast() {
    if (canPop) {
      final int indexToRemove = _queueList.length - 1;
      final removedItem = _queueList[indexToRemove];
      _queueList.removeAt(indexToRemove);
      return removedItem;
    }
    return null;
  }

  /// Removes the first `element` of the [SpecialQueue].
  ///
  /// The removed `element` will be returned.
  /// If the list has no `elements` it will return `null`.
  ///
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// bool elementRemoved = specialQueue.removeFirst();
  /// print(elementRemoved); // 5
  /// ```
  E? removeFirst() {
    if (canPop) {
      final int indexToRemove = _queueList[0];
      final removedItem = _queueList[indexToRemove];
      _queueList.removeAt(indexToRemove);
      return removedItem;
    }
    return null;
  }

  /// The [SpecialQueue] will be executed.
  ///
  /// Every `element` will be printed in order and removed from
  /// the [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// specialQueue.executeQueue(); // 5 9 a
  /// print(specialQueue); // []
  /// ```
  void executeQueue() {
    for (E element in _queueList) {
      print(element);
    }
    popAll();
  }

  /// Removes all `elements` of the [SpecialQueue].
  ///
  /// Example:
  /// ```dart
  /// final specialQueue = SpecialQueue.fromList([5, 9, 'a']);
  /// specialQueue.popAll();
  /// print(specialQueue); // []
  /// ```
  void popAll() {
    if (canPop) _queueList.removeRange(0, _queueList.length);
  }

  @override
  String toString() {
    return _queueList.toString();
  }
}
