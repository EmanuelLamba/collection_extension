/// A [Stack] is a collection that can be manipulated at one end.
/// One can execute the stack using [executeStack] method.
///
/// The [Stack] can be either created empty or with `elements` given
/// through a [List].
///
/// For simplicity reasons [Stack] is a [List] that can manipulate elements
/// only at one end.
///
/// Example:
/// ```dart
/// final stack = Stack();
/// print(stack.runtimeType); // Stack<dynamic>
///
/// //Adding elements to the stack
/// stack.push(5);
/// stack.pushAll([22, 'b', 9]);
/// print(stack); // [5, 22, 'b', 9];
///
/// // Removing elements from the stack
/// // (Elements can be removed only from the end of the stack)
/// stack.pop();
/// print(stack); // [5, 22, 'b']
/// ```
class Stack<E> {
  /// The [List] used to store the [Stack] and its `elements`.
  final List _stackList;

  /// Whether this `collection` has no elements.
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack();
  /// print(stack.isEmpty); // true
  /// ```
  bool get isEmpty => _stackList.isEmpty;

  /// Whether this `collection` has elements to pop.
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack();
  /// print(stack.canPop); // false
  /// ```
  bool get canPop => _stackList.isNotEmpty;

  /// The number of `elements` in this `collection`.
  ///
  /// The valid indices are `0` through `length - 1`
  ///
  /// ```dart
  /// final stack = Stack.fromList([2, 5, 9, 44]);
  /// print(stack.length); // 4
  /// ```
  int get length => _stackList.length;

  /// Creates an empty [Stack] object.
  ///
  /// The `constructor` will initialise the [List] that manages
  /// the [Stack] object.
  ///
  /// ```dart
  /// final stack = Stack();
  /// print(stack); // []
  /// ```
  Stack() : _stackList = <E>[];

  /// Creates a [Stack] object containing the elements of the
  /// [List] passed as argument.
  ///
  /// The [List] that mananges [Stack] will be initialised with
  /// the elements of the [List] passed as argument.
  ///
  /// ```dart
  /// final stack = Stack.fromList([2, 4, 8, 'a']);
  /// print(stack); // [2, 4, 8, 'a']
  /// ```
  Stack.fromList(List<E> list) : _stackList = list;

  /// Inserts [element] to the end of the [Stack].
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([7, 8]);
  /// stack.push(5);
  /// print(stack); // [7, 8, 5]
  /// ```
  void push(E element) => _stackList.add(element);

  /// Inserts all elements from [iterable] to the end of [Stack].
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([2, 4]);
  /// stack.pushAll([5, 9, 77, 'a']);
  /// print(stack); // [2, 4, 5, 9, 77, 'a']
  /// ```
  void pushAll(Iterable<E> iterable) => _stackList.addAll(iterable);

  /// Removes the last `element` of the [Stack].
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([5, 9, 'a']);
  /// stack.pop();
  /// print(stack); // [5, 9]
  /// ```
  void pop() {
    if (canPop) _stackList.removeLast();
  }

  /// Checks whether [Stack] contains [element] or not.
  ///
  /// A `bool` object will be returned.
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([5, 9, 'a', 'b']);
  /// bool hasElement = stack.contains('a');
  /// print(hasElement); // true
  /// ```
  bool contains(E element) {
    for (E item in _stackList) {
      if (item == element) return true;
    }
    return false;
  }

  /// The [Stack] will be executed.
  ///
  /// Every `element` will be printed in order and removed from
  /// the [Stack].
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([5, 9, 'a']);
  /// stack.executeQueue(); // a 9 5
  /// print(stack); // []
  /// ```
  void executeStack() {
    for (E element in _stackList.reversed) {
      print(element);
    }
    popAll();
  }

  /// Removes all `elements` of the [Stack].
  ///
  /// Example:
  /// ```dart
  /// final stack = Stack.fromList([5, 9, 'a']);
  /// stack.popAll();
  /// print(stack); // []
  /// ```
  void popAll() {
    if (canPop) _stackList.removeRange(0, _stackList.length);
  }

  @override
  String toString() {
    return _stackList.toString();
  }
}
