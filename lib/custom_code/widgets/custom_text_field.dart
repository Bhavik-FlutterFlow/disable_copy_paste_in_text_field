// Automatic FlutterFlow imports
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';

// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.copyPasteAllowed = false,
  });

  final double? width;
  final double? height;
  final bool copyPasteAllowed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Initialize controller internally
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  EditableTextContextMenuBuilder? contextMenuBuilder = _defaultContextMenuBuilder;

  static Widget _defaultContextMenuBuilder(
      BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // BrowserContextMenu.disableContextMenu();
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: (event) {
        if (event.physicalKey == LogicalKeyboardKey.metaLeft ||
            event.physicalKey == LogicalKeyboardKey.metaRight ||
            event.physicalKey == LogicalKeyboardKey.controlLeft ||
            event.physicalKey == LogicalKeyboardKey.controlRight) {
          if (event.logicalKey == LogicalKeyboardKey.keyC ||
              event.logicalKey == LogicalKeyboardKey.keyX ||
              event.logicalKey == LogicalKeyboardKey.keyV) {
            print('Copy, cut, or paste');
            return;
          }
          return;
        }
      },
      child: MouseRegion(
        onEnter: (event) {
          if (event.kind == PointerDeviceKind.mouse && event.buttons == 0) {}
        },
        child: Container(
          child: TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            enableInteractiveSelection: widget.copyPasteAllowed,
            contextMenuBuilder: (context, editableTextState) {
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
