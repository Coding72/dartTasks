import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';

void main(List<String> args) {
  if (args.length>0){
    final file = File(args[0]);
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      final result = parseString(content: content, throwIfDiagnostics: false);
      print(result.unit.toSource());
    } else { print("Datei nicht gefunden $args[0]"); }
  } else { print("Usage: effizienz_sync <filename> or \n dart effizienz_sync.dart <filename> or \n dartaotruntime effizienz_sync.aot <filename>"); }

}