import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class FileInfo {
  const FileInfo(this.path);
  final String path;
}
