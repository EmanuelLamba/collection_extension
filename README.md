# Special Cooked Collections

---

An extension of Collection package in Dart. It provides useful methods to work with collections
such as: Tuple, Stack and SpecialQueue.

## Features

---

You can create Tuple, Stack and SpecialQueue objects that you can manipulate with
the help of their methods.

    - Tuple: A Tuple is a collection with fixed length and elements.
    - Stack: A Stack is a collection that can be manipulated at one end.
    - SpecialQueue: A SpecialQueue is a collection that can be manipulated at both ends.

## Installing

---

#### Depend on it

Run this command:

> $ dart pub add collection_extension

This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

> dependencies:
> shelf: ^1.3.2

#### Import it

Now in your Dart code, you can use:

> import 'package:collection_extension/collection_extension.dart'

## Usage

---

```dart
final tuple = Tuple.fromList([5, 9, 11, 3, 15, 19]);
  print(tuple.contains(5)); // true
  print(tuple.contains('5')); //false
  print(tuple
      .firstWhere((element) => element is num && element > 10 && element < 20)); // 11

final stack = Stack();
  stack.push(3); // [3]
  stack.push(9); // [3, 9]
  stack.push('a'); // [3, 9, a]
  stack.popAll(); // []
  stack.pushAll([25, 35, 99, 199, 399, 9999999]); // [25, 35, 99, 199, 399, 9999999]
  print(stack.canPop); // true

final specialQueue = SpecialQueue();
   specialQueue.push(5); // [5]
   specialQueue.push(33); // [5, 33]
   specialQueue.removeFirst(); // [33]
   specialQueue.push(44); // [33, 44]
   print(specialQueue.peak); // [33]
   specialQueue.pushAll([20, 50, 34, 127]); // [33, 20, 50, 34, 127]
```

## Additional information

---

This is just an experimental package, it's usage is up to the developer.
