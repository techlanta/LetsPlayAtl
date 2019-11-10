//https://github.com/fluttercommunity/flutter_google_places/blob/master/lib/src/places_autocomplete_field.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:flutter_google_places/flutter_google_places.dart';

class PlacesAutocompleteFieldV2 extends StatefulWidget {
  const PlacesAutocompleteFieldV2({
    Key key,
    @required this.apiKey,
    this.controller,
    this.leading,
    this.hint = "Search",
    this.trailing,
    this.trailingOnTap,
    this.mode = Mode.fullscreen,
    this.offset,
    this.location,
    this.radius,
    this.language,
    this.sessionToken,
    this.types,
    this.components,
    this.strictbounds,
    this.onChanged,
    this.onError,
    this.inputDecoration = const InputDecoration(),
  }) : super(key: key);
  final TextEditingController controller;
  final Icon leading;
  final Icon trailing;
  final VoidCallback trailingOnTap;
  final String hint;
  final String apiKey;
  final InputDecoration inputDecoration;
  final num offset;
  final Mode mode;
  final String language;
  final String sessionToken;

  final List<String> types;

  final List<Component> components;

  final Location location;

  final num radius;

  final bool strictbounds;

  /// Called when the text being edited changes.
  final ValueChanged<Prediction> onChanged;

  /// Callback when autocomplete has error.
  final ValueChanged<PlacesAutocompleteResponse> onError;

  @override
  _LocationAutocompleteFieldState createState() =>
      _LocationAutocompleteFieldState();
}

class _LocationAutocompleteFieldState extends State<PlacesAutocompleteFieldV2> {
  TextEditingController _controller;
  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) _controller = TextEditingController();
  }

  @override
  void didUpdateWidget(PlacesAutocompleteFieldV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && oldWidget.controller != null)
      _controller = TextEditingController.fromValue(oldWidget.controller.value);
    else if (widget.controller != null && oldWidget.controller == null)
      _controller = null;
  }

  Future<Prediction> _showAutocomplete() async => PlacesAutocomplete.show(
    context: context,
    apiKey: widget.apiKey,
    offset: widget.offset,
    onError: widget.onError,
    mode: widget.mode,
    hint: widget.hint,
    language: widget.language,
    sessionToken: widget.sessionToken,
    components: widget.components,
    location: widget.location,
    radius: widget.radius,
    types: widget.types,
    strictbounds: widget.strictbounds,
  );

  void _handleTap() async {
    Prediction p = await _showAutocomplete();

    if (p == null) return;

    setState(() {
      _effectiveController.text = p.description;
      if (widget.onChanged != null) {
        widget.onChanged(p);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = _effectiveController;

    var text = controller.text.isNotEmpty
        ? Text(
      controller.text,
      softWrap: true,
    )
        : Text(
      widget.hint ?? '',
      style: TextStyle(color: Colors.black38),
    );

    Widget child = Row(
      children: <Widget>[
        widget.leading ?? SizedBox(),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: text,
        ),
        widget.trailing != null
            ? GestureDetector(
          onTap: widget.trailingOnTap,
          child: widget.trailingOnTap != null
              ? widget.trailing
              : Icon(
            widget.trailing.icon,
            color: Colors.grey,
          ),
        )
            : SizedBox()
      ],
    );

    if (widget.inputDecoration != null) {
      child = InputDecorator(
        decoration: widget.inputDecoration,
        child: child,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _handleTap,
      child: child,
    );
  }
}