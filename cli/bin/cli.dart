import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '1.2.3.1';

void main(List<String> arguments) async { // main is now async and awaits the runner
  var runner = CommandRunner(); // Create an instance of your new CommandRunner
  await runner.run(arguments); // Call its run method, awaiting its Future<void>
}


// class help{
//     print('this is function call for help ');
//  }
//     void without_static(){
//     print(' without static call');   // needs an object to cal
//     }
// }
