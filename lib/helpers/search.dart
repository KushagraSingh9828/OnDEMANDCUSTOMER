import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget(
      {Key? key, required this.hintText, required this.onChanged})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchtext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          controller: _searchtext,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              prefixIcon: GestureDetector(
                child: Image.asset("assets1/svg/search.png"),
                onTap: () {
                  _searchtext.clear();
                  widget.onChanged('');
                },
              ),
              hintText: '${widget.hintText}',
              contentPadding: const EdgeInsets.only(top: 8)),
          onChanged: widget.onChanged,
        ));
  }
}
