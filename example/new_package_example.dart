import 'dart:collection';

import 'package:new_package/new_package.dart';

void main() {
  // final manu = Stack();
  // manu.push(3);
  // manu.push(9);
  // manu.push('a');
  // manu.popAll();
  // manu.pushAll([25, 35, 99, 199, 399, 9999999]);
  // print(manu.canPop);
  // print(manu);
  // manu.executeStack();
  // print(manu);
  // manu.pop();
  // final boss = Stack.from([22, 33, 77, 100]);
  // print(boss);

  // final specialQueue = SpecialQueue();
  // specialQueue.executeQueue();
  // print(specialQueue.peak);
  // specialQueue.removeFirst();
  // specialQueue.push(5);
  // specialQueue.push(33);
  // specialQueue.push(44);
  // specialQueue.push(57);
  // specialQueue.push(570);
  // specialQueue.pushAll([20, 50, 34, 127]);
  // specialQueue.executeQueue();
  // print(specialQueue);
  // final specialQueue2 =
  //     SpecialQueue.fromList([20, 30, 40, '2', 60, 70, 80, 'a', 'c']);
  // // boss.pushLast(3);
  // final ceva = specialQueue2.remove(20);
  // print(ceva);
  // print(specialQueue2.runtimeType);

  final manu = Tuple.fromList(
      [3, 5, 7, 9, 11, 15, 19, 18, 22, 44, 55, 'a', 'b', 'c', 'd']);
  print(manu.contains('a'));
  print(manu.contains(5));
  print(manu.contains('5'));
  print(manu
      .firstWhere((element) => element is num && element > 10 && element < 20));
  print(manu.indexWhere((element) {
    return element == 2;
  }));
  print(manu
      .lastWhere((element) => element is num && element > 10 && element < 20));
  // print(manu.elementAt(15));
  // print(manu);
  print(manu.runtimeType);
}
