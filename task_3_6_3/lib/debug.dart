import 'dart:io';

final debug = Debug('logfile.txt');

class Debug {
  final String filename;

  Debug(this.filename);

  void log(String message) {

    final now = DateTime.now();
    final date = '${now.day}.${now.month}.${now.year}';
    final time = '${now.hour}:${now.minute}:${now.second}';

    final logMessage = '$date - $time : $message\n';

    final directory = Directory('log');
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final file = File('${directory.path}/$filename');

    file.writeAsStringSync(logMessage, mode: FileMode.append);
  }
}