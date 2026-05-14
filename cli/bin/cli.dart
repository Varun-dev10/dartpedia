import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '1.2.3.1';

void main(List<String> arguments) async { // main is now async and awaits the runner
  var runner = CommandRunner(); // Create an instance of your new CommandRunner
  await runner.run(arguments); // Call its run method, awaiting its Future<void>
}

void searchWikipedia(List<String>? arguments) async {
  // Added 'async'
  final String? articleTitle;

      // If the user didn't pass in arguments, request an article title.
      if (arguments == null || arguments.isEmpty) {
        print('Please provide an article title.');
        final inputFromStdin = stdin.readLineSync(); // Read input
        if (inputFromStdin == null || inputFromStdin.isEmpty) {
          print('No article title provided. Exiting.');
          return; // Exit the function if no valid input
        }

        articleTitle = inputFromStdin;
      } else {
        // Otherwise, join the arguments into the CLI into a single string
        articleTitle = arguments.join(' ');
      }

  print('Looking up articles about "$articleTitle". Please wait.');
  //  print('Here ya go!');
  // print('(Pretend this is an article about "$articleTitle")');

      final articleContent = await getWikipediaArticle(articleTitle);
      // waits here till article content is fetched from wikipedia  but other event can still function properly
      print(articleContent); // print article in json for now
}

Future<String> getWikipediaArticle(String articleTitle) async {
      final url = Uri.http(
        'en.wikipedia.org', // Wikipedia API domain
        '/api/rest_v1/page/summary/$articleTitle',
      ); // API path for article summary

  final response = await http.get(url); // also waits here till json data is sent and received

      if (response.statusCode == 200) return response.body;

      return 'error failed to fetch article : '
          '"$articleTitle". Status code : ${response.statusCode} ';
}

void printUsage() {
  // function call
  print(' these are the approved arguments " help "  and " version" and " search "');
}

// class help{
//     print('this is function call for help ');
//  }
//     void without_static(){
//     print(' without static call');   // needs an object to cal
//     }
// }
