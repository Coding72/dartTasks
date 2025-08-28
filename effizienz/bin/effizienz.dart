import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';

Future main(List<String> args) async {
  if (args.length>0){    
    final file = File(args[0]);
    if (await file.exists()) {
      final content = file.readAsStringSync();
      final result = parseString(content: content, throwIfDiagnostics: false);
      print(result.unit.toSource());
    } else {print("Datei nicht gefunden $args[1]");}
  } else { print("Usage: effizienz <filename> or \n dart effizienz.dart <filename> or \n dartaotruntime effizienz.aot <filename>"); }
}