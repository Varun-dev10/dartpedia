import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  var commandRunner = CommandRunner()..addCommand(HelpCommand());
  commandRunner.run(arguments);
}



// class help{
//     print('this is function call for help ');
//  }
//     void without_static(){
//     print(' without static call');   // needs an object to cal
//     }
// }
