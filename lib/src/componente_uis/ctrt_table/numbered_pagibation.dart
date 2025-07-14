// 1. Widget de pagination avec numéros de pages (Stateful)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class NumberedPagination extends StatefulWidget {
  final int totalPages;
  final Function(int)? onPageChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final int? maxVisiblePages;
  final int initialPage;

  const NumberedPagination({
    super.key,
    required this.totalPages,
    this.onPageChanged,
    this.activeColor,
    this.inactiveColor,
    this.maxVisiblePages = 3,
    this.initialPage = 1,
  });

  @override
  State<NumberedPagination> createState() => _NumberedPaginationState();
}

class _NumberedPaginationState extends State<NumberedPagination> {
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  void _handlePageChange(int page) {
    if (page >= 1 && page <= widget.totalPages) {
      setState(() {
        _currentPage = page;
      });
      widget.onPageChanged?.call(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Bouton Précédent
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: _currentPage > 1
            ? () => _handlePageChange(_currentPage - 1)
            : null,
          color: _currentPage > 1
            ? (widget.activeColor ?? Theme.of(context).primaryColor)
            : widget.inactiveColor,
        ),

        // Bouton "Première page"
        if (widget.totalPages > 7)
          IconButton(
            icon: const Icon(Icons.first_page),
            onPressed: _currentPage > 1 ? () => _handlePageChange(1) : null,
            color: _currentPage > 1
              ? (widget.activeColor ?? Theme.of(context).primaryColor)
              : widget.inactiveColor,
          ),

        // Numéros de page
        ..._buildPageButtons(),

        // Bouton "Dernière page"
        if (widget.totalPages > 7)
          IconButton(
            icon: const Icon(Icons.last_page),
            onPressed: _currentPage < widget.totalPages
              ? () => _handlePageChange(widget.totalPages)
              : null,
            color:_currentPage < widget.totalPages
              ? (widget.activeColor ?? Theme.of(context).primaryColor)
              : widget.inactiveColor,
          ),

        // Bouton Suivant
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _currentPage < widget.totalPages
            ? () => _handlePageChange(_currentPage + 1)
            : null,
          color: _currentPage < widget.totalPages
            ? (widget.activeColor ?? Theme.of(context).primaryColor)
            : widget.inactiveColor,
        ),
      ],
    );
  }

  List<Widget> _buildPageButtons() {
    List<Widget> buttons = [];
    int start = 1;
    int end = widget.totalPages;

    if (widget.totalPages > widget.maxVisiblePages!) {
      start = (_currentPage - (widget.maxVisiblePages! ~/ 2)).clamp(1,
        widget.totalPages,
      );
      end = (start + widget.maxVisiblePages! - 1).clamp(1, widget.totalPages);

      // Ajuster le début si on est près de la fin
      if (end == widget.totalPages) {
        start = (end - widget.maxVisiblePages! + 1).clamp(1, widget.totalPages);
      }
    }

    // Ajouter les numéros de page
    for (int i = start; i <= end; i++) {
      if (i == start && start > 1) {
        buttons.add(_buildPageButton(1));
        if (start > 2) buttons.add(_buildEllipsis());
      } else if (i == end && end < widget.totalPages) {
        buttons.add(_buildPageButton(i));
        if (end < widget.totalPages - 1) buttons.add(_buildEllipsis());
        buttons.add(_buildPageButton(widget.totalPages));
      } else {
        buttons.add(_buildPageButton(i));
      }
    }

    return buttons;
  }

  Widget _buildPageButton(int page) {
    final isActive = page == _currentPage;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.r),
          onTap: () => _handlePageChange(page),
          child: Container(
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              color: isActive
                ? (widget.activeColor ?? Theme.of(context).primaryColor)
                : Colors.transparent,
              border: !isActive
                ? Border.all(color: widget.inactiveColor ?? Colors.grey)
                : null,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: CtrtText.medium(
                text: '$page',
                textColor: isActive
                  ? CtrtColors.white
                  : (widget.inactiveColor ?? CtrtColors.lightGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: SizedBox(
        width: 38.w,
        height: 38.h,
        child: Center(child: CtrtText.medium(text: '...')),
      ),
    );
  }
}
