import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

const version = '1.2.3.1';

void main(List<String> arguments) {
  // var object = help();   // object of help class

      if (arguments.isEmpty || arguments.first == 'help') {
        // print("hello dude");
        //help.arguments(); // can only be called in this way when void help is declared static
        printUsage(); // function call
        //object.wihtout_static();    // cobject call
      } else if (arguments.first == 'version') {
        print('current version : $version');
      } else if (arguments.first == 'search') {
        final inputArgs = arguments.length > 1
            ? arguments.sublist(1)
            : null; // sublist(0) this creates a sub list which take all argument starting from first index
        searchWikipedia(inputArgs); // searchWikipedia call needs no await here
        // print(arguments.length);
      } else {
        printUsage();
      }
  //   for (int n = 0; n< 5;  n++ ){
  //    print("loop:: $n");
  //  }
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
//     void wihtout_static(){
//     print(' wtithout static call');   // needs an objetc to cal
//     }
// }
