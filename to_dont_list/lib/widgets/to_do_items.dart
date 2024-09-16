import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/item.dart';

typedef ToDoListChangedCallback = Function(Army item, bool completed);
typedef ToDoListRemovedCallback = Function(Army item);

class ToDoListItem extends StatelessWidget {
  ToDoListItem(
      {required this.item,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteItem})
      : super(key: ObjectKey(item));

  final Army item;
  final bool completed;

  final ToDoListChangedCallback onListChanged;
  final ToDoListRemovedCallback onDeleteItem;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed //
        ? Colors.black
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {
      //   onListChanged(item, completed);
      // },
      // onLongPress: completed
      //     ? () {
      //         onDeleteItem(item);
      //       }
      //     : null,
      leading: FloatingActionButton(
        onPressed: () {
          item.AddPrior();
          onListChanged(item, completed);
        },
        backgroundColor: Colors.purpleAccent,
      ),
      title: Text(
        item.name,
        style: _getTextStyle(context),
      ),
      trailing: FloatingActionButton(
        onPressed: () {
          item.subPrior();
          onListChanged(item, completed);
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
