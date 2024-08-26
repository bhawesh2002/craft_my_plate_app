import 'package:craft_my_plate_app/utils/app_colors.dart';
import 'package:craft_my_plate_app/utils/ui_sizes.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatefulWidget {
  final double pageIndex;
  final double triggerPageIndex;
  const GetStartedButton(
      {super.key, required this.pageIndex, required this.triggerPageIndex});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _width;
  late final Animation<double> _opacity;
  final GlobalKey _getStartedKey = GlobalKey();
  late double getStartedButtonWidth = 180; // Default value in case of delay

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _width = Tween<double>(begin: 80, end: getStartedButtonWidth).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1, curve: Curves.easeInOut)));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _getStartedKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          getStartedButtonWidth = renderBox.size.width;
          _width = Tween<double>(begin: 80, end: getStartedButtonWidth).animate(
              CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(0.0, 0.8, curve: Curves.easeInOut)));
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant GetStartedButton oldWidget) {
    if (widget.pageIndex == widget.triggerPageIndex) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.centerRight,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(14),
                width: _width.value,
                decoration: BoxDecoration(
                  color: AppColors.buttonSecondaryColor,
                  borderRadius: BorderRadius.circular(64),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.buttonPrimaryColor,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: _opacity.value,
                child: getStartedButton(key: _getStartedKey),
              ),
            ),
          ],
        );
      },
    );
  }
}

Container getStartedButton({Key? key}) {
  final UiSizes uiSizes = UiSizes();
  return Container(
    key: key,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: AppColors.buttonSecondaryColor,
      borderRadius: BorderRadius.circular(64),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: uiSizes.w4),
          child: Text(
            "Get Started",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: uiSizes.responsiveFontSize(16),
              color: AppColors.primary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.buttonPrimaryColor,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 22,
          ),
        ),
      ],
    ),
  );
}
