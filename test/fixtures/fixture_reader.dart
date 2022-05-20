import 'dart:io';

String fixture(String name) {
  final dir = Directory.current.path;
  return File('$dir/test/fixtures/$name').readAsStringSync();
}
