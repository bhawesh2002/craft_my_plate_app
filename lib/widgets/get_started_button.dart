import 'package:craft_my_plate_app/utils/app_colors.dart';
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

  late final Animation<double> _width;
  late final Animation<double> _opacity;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _width = Tween<double>(begin: 80, end: 200)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1, curve: Curves.easeInOut)));

    super.initState();
  }

  @override
  void didUpdateWidget(covariant GetStartedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pageIndex == widget.triggerPageIndex) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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
        return Container(
          padding: const EdgeInsets.all(14),
          width: _width.value,
          decoration: BoxDecoration(
            color: AppColors.buttonSecondaryColor,
            borderRadius: BorderRadius.circular(64),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Opacity(
                    opacity: _opacity.value,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.buttonPrimaryColor,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
