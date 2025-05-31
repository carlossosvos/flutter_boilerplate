// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "app_message": MessageLookupByLibrary.simpleMessage("Hello World"),
        "app_title": MessageLookupByLibrary.simpleMessage("My App"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "dark_mode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "example_dialog_message":
            MessageLookupByLibrary.simpleMessage("Message of Alert Dialog"),
        "example_dialog_title":
            MessageLookupByLibrary.simpleMessage("Title of Alert Dialog"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "log_in": MessageLookupByLibrary.simpleMessage("Log In"),
        "log_out": MessageLookupByLibrary.simpleMessage("Log Out"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settings_language":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "settings_theme": MessageLookupByLibrary.simpleMessage("Select Theme"),
        "show_dialog": MessageLookupByLibrary.simpleMessage("Show Dialog")
      };
}
