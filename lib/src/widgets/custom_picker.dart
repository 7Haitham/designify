import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:designify/designify.dart';


class DesignifyPicker extends StatefulWidget {
  final String title;
  
  final List<String> items;
  
  final ValueChanged<String>? onChanged;
  
  final String? hintText;
  
  final Color borderColor;
  
  final Color? backgroundColor;
  
  final String closeButtonText;
  
  final String? defaultItemText;
  
   final TextStyle? textStyle;
  
   final double itemExtent;
  
   final double pickerHeight;

  const DesignifyPicker({
    Key? key,
    required this.title,
    required this.items,
    this.onChanged,
    this.hintText,
    Color? borderColor,
    this.backgroundColor,
    this.closeButtonText = 'تم',
    this.defaultItemText = '-- اختر --',
    this.textStyle,
    this.itemExtent = 50.0,
    this.pickerHeight = 300.0,
  }) : borderColor = borderColor ?? Colors.blue,
       super(key: key);

  @override
  State<DesignifyPicker> createState() => _DesignifyPickerState();
}

class _DesignifyPickerState extends State<DesignifyPicker> {
  late String _displayValue;
  int _selectedIndex = 0;
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _displayValue = widget.hintText ?? widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: widget.borderColor ?? Theme.of(context).primaryColor,
            width: 1.0,
          ),
        ),
        color: widget.backgroundColor ?? theme.cardColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: _showPicker,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: DesignifyText(
                    _displayValue,
                    fontSize: 16,
                    color: _isSelected ? theme.textTheme.bodyLarge?.color ?? Colors.black : theme.hintColor ?? Colors.grey,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: theme.iconTheme.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker() {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: widget.pickerHeight + 50,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.separator.resolveFrom(context),
                      width: 0.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 40,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        widget.closeButtonText,
                        style: const TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DesignifyText(
                      widget.title,
                      isBold: true,
                      fontSize: 16,
                    ),
                    const SizedBox(width: 40), // For centering the title
                  ],
                ),
              ),
              
              Expanded(
                child: CupertinoPicker(
                  itemExtent: widget.itemExtent,
                  scrollController: FixedExtentScrollController(
                    initialItem: _selectedIndex,
                  ),
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      _selectedIndex = index;
                      _isSelected = index > 0;
                      _displayValue = _isSelected 
                          ? widget.items[index - 1] 
                          : widget.defaultItemText ?? widget.title;
                    });
                  },
                  children: [
                    Center(
                      child: DesignifyText(
                        widget.defaultItemText ?? widget.title,
                        fontSize: 18,
                        color: CupertinoColors.placeholderText.resolveFrom(context),
                      ),
                    ),
                    // Items
                    ...widget.items.map(
                      (item) => Center(
                        child: DesignifyText(
                          item,
                          fontSize: 18,
                        ),
                      ),
                    ).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) {
      // When the modal is closed, trigger onChanged if an item was selected
      if (_isSelected && widget.onChanged != null) {
        widget.onChanged!(widget.items[_selectedIndex - 1]);
      }
    });
  }
}