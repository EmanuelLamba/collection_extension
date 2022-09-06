import 'package:collection_extension/collection_extension.dart';

void main() {
  final stack = Stack();
  stack.push(3);
  stack.pushAll([5, 7, 9, 'a', 'b', 'c']);
  print(stack); // [3, 5, 7, 9, a, b, c]
  stack.pop(); // [3, 5, 7, 9, a, b]
  print(stack.contains('c')); // false
  stack.executeStack(); // 3 5 7 9 a b

  final tuple = Tuple.fromList([5, 7, 9, 'a', 'b', 'c', 13, 18]);
  print(tuple); // [5, 7, 9, a, b, c, 13, 18]
  print(tuple.contains('c')); // false
  print(tuple.elementAt(3)); // a
  print(tuple.firstWhere(
      (element) => element is num && element > 10 && element < 20)); // 13

  final specialQueue = SpecialQueue();
  specialQueue.push(7);
  specialQueue.pushAll([9, 3, 12, 'a', 'u', 19]);
  print(specialQueue); // [7, 9, 3, 12, a, u, 19]
  specialQueue.pop(); // [9, 3, 12, a, u, 19]
  final isRemoved = specialQueue.remove('a'); // [9, 3, 12, u, 19]
  print(isRemoved); //true
  final elementRemoved = specialQueue.removeFirst(); // [9, 3, 12, u, 19]
  print(elementRemoved); // 9
  specialQueue.executeQueue(); // 3 12 u 19
}
