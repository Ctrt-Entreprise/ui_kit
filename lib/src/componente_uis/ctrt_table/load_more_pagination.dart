// 2. Widget de pagination avec "Load More" et "Previous" (Stateful)
import 'package:flutter/material.dart';

class LoadMorePagination extends StatefulWidget {
  final int totalPages;
  final Function(int)? onPageChanged;
  final String loadMoreText;
  final String previousText;
  final Color? buttonColor;
  final Color? textColor;
  final int initialPage;

  const LoadMorePagination({
    super.key,
    required this.totalPages,
    this.onPageChanged,
    this.loadMoreText = 'Charger plus',
    this.previousText = 'Précédent',
    this.buttonColor,
    this.textColor,
    this.initialPage = 1,
  });

  @override
  State<LoadMorePagination> createState() => _LoadMorePaginationState();
}

class _LoadMorePaginationState extends State<LoadMorePagination> {
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
        if (_currentPage > 1)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton.icon(
              onPressed: () => _handlePageChange(_currentPage - 1),
              icon: const Icon(Icons.arrow_back),
              label: Text(widget.previousText),
              style: TextButton.styleFrom(
                foregroundColor:
                    widget.textColor ?? Theme.of(context).primaryColor,
                backgroundColor: widget.buttonColor?.withOpacity(0.1),
              ),
            ),
          ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.buttonColor ?? Theme.of(context).primaryColor,
            ),
          ),
          child: Text(
            'Page $_currentPage sur ${widget.totalPages}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: widget.textColor ?? Theme.of(context).primaryColor,
            ),
          ),
        ),

        if (_currentPage < widget.totalPages)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: TextButton.icon(
              onPressed: () => _handlePageChange(_currentPage + 1),
              icon: const Icon(Icons.arrow_forward),
              label: Text(widget.loadMoreText),
              style: TextButton.styleFrom(
                foregroundColor: widget.textColor ?? Theme.of(context).primaryColor,
                backgroundColor: widget.buttonColor?.withOpacity(0.1),
              ),
            ),
          ),
      ],
    );
  }
}
