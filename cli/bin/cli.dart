import 'package:command_runner/command_runner.dart';

const version = '0.0.1';

void main(List<String> arguments) {
  // [Step 6 update] Add onError method
  var commandRunner = CommandRunner(
    onError: (Object error) {
      if (error is Error) {
        throw error;
      }
      if (error is Exception) {
        print(error);
      }
    },
  )..addCommand(HelpCommand());
  commandRunner.run(arguments);
}



// class help{
//     print('this is function call for help ');
//  }
//     void without_static(){
//     print(' without static call');   // needs an object to cal
//     }
// }
