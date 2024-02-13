import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            mainAxisExtent: 140),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).colors.secondary,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            AppTheme.of(context).spaces.space_100),
                        child: Container(
                          width: AppTheme.of(context).spaces.space_100 * 14.5,
                          height: AppTheme.of(context).spaces.space_100 * 10,
                          child: Image.network(
                            'https://www.foodiesfeed.com/wp-content/uploads/2023/04/strawberry-milk-splash.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Long category',
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.of(context).typography.h400,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 50),
                        child: Text(
                          'name',
                          style: AppTheme.of(context).typography.h400,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: AppTheme.of(context).spaces.space_250,
                    height: AppTheme.of(context).spaces.space_250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: AppTheme.of(context).colors.primary,
                        width: 0,
                      ),
                    ),
                    child: Positioned(
                      top: 5,
                      left: 5,
                      child: RoundedCheckbox(
                        isChecked: true,
                        onChanged: (isChecked) {
                          // Handle checkbox state changes here
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoundedCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool>? onChanged;

  const RoundedCheckbox({
    Key? key,
    this.isChecked = false,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedCheckboxState createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          if (widget.onChanged != null) {
            widget.onChanged!(_isChecked);
          }
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isChecked
              ? AppTheme.of(context).colors.primary
              : Colors.transparent,
          border: Border.all(
            color: AppTheme.of(context).colors.primary,
            width: 2,
          ),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
