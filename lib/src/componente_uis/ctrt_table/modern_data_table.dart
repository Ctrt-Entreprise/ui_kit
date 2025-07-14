import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Un widget de tableau de données réutilisable avec une interface moderne
/// Prend en charge le tri, la recherche et la pagination
class ModernDataTable<T> extends StatefulWidget {
  /// Données à afficher dans le tableau
  final List<T> data;
  
  /// Colonnes du tableau
  final List<DataColumn> columns;
  
  /// Fonction pour extraire les cellules d'une ligne
  final List<DataCell> Function(T item, int index) cellsBuilder;
  
  /// Titre du tableau
  final String title;
  
  /// Indique si la recherche est activée
  final bool enableSearch;
  
  /// Indique si le sélecteur de période est activé
  final bool enablePeriodSelection;
  
  /// Indique si les en-têtes de colonnes sont interactifs (tri)
  final bool enableSorting;
  
  /// Nombre d'éléments par page
  final int rowsPerPage;
  
  /// Indique si la pagination est activée
  final bool enablePagination;
  
  /// Options de nombre d'éléments par page
  final List<int> rowsPerPageOptions;
  
  /// Style de l'en-tête
  final TextStyle? headerStyle;
  
  /// Style des cellules
  final TextStyle? cellStyle;
  
  /// Espacement entre les lignes
  final double rowSpacing;
  
  /// Fonction appelée lorsqu'une ligne est sélectionnée
  final Function(T item)? onRowTap;
  
  /// Texte de l'indicateur de recherche
  final String searchHintText;
  
  /// Texte du bouton de période
  final String periodButtonText;
  
  /// Fonction appelée lorsque la période change
  final Function()? onPeriodChanged;
  
  /// Fonction de filtrage personnalisée
  final bool Function(T item, String query)? filterFunction;

  const ModernDataTable({
    super.key,
    required this.data,
    required this.columns,
    required this.cellsBuilder,
    this.title = '',
    this.enableSearch = true,
    this.enablePeriodSelection = true,
    this.enableSorting = true,
    this.rowsPerPage = 10,
    this.enablePagination = true,
    this.rowsPerPageOptions = const [10, 25, 50, 100],
    this.headerStyle,
    this.cellStyle,
    this.rowSpacing = 16.0,
    this.onRowTap,
    this.searchHintText = 'Rechercher...',
    this.periodButtonText = 'Période',
    this.onPeriodChanged,
    this.filterFunction,
  });

  @override
  State<ModernDataTable<T>> createState() => _ModernDataTableState<T>();
}

class _ModernDataTableState<T> extends State<ModernDataTable<T>> {
  List<T> filteredData = [];
  String searchQuery = '';
  int sortColumnIndex = -1;
  bool sortAscending = true;
  int currentPage = 0;
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    filteredData = List.from(widget.data);
    _rowsPerPage = widget.rowsPerPage;
  }

  @override
  void didUpdateWidget(ModernDataTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _updateFilteredData();
    }
  }

  void _updateFilteredData() {
    if (searchQuery.isEmpty) {
      filteredData = List.from(widget.data);
    } else {
      filteredData = widget.data.where((item) {
        if (widget.filterFunction != null) {
          return widget.filterFunction!(item, searchQuery);
        }
        
        // Implémentation de filtre par défaut (à remplacer par la vôtre)
        return item.toString().toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Appliquer le tri si nécessaire
    if (sortColumnIndex >= 0 && sortColumnIndex < widget.columns.length) {
      // Cette fonction doit être implémentée selon vos besoins de tri
      _sortData();
    }

    setState(() {});
  }

  void _sortData() {
    // Cette fonction doit être implémentée selon la structure de vos données
    // Exemple de tri basique (à personnaliser)
    if (sortColumnIndex >= 0) {
      // Cette implémentation est juste un exemple
      // Vous devrez l'adapter à votre structure de données
    }
  }

  void _onSearch(String query) {
    setState(() {
      searchQuery = query;
      _updateFilteredData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTableHeader(),
          const Divider(height: 1, thickness: 1, color: Color(0xFFF1F1F5)),
          _buildTableColumnHeaders(),
          Expanded(
            child: _buildTableBody(),
          ),
          if (widget.enablePagination)
            _buildPaginationControls(),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF14142B),
            ),
          ),
          Row(
            children: [
              if (widget.enablePeriodSelection)
                _buildPeriodButton(),
              if (widget.enableSearch)
                const SizedBox(width: 12),
              if (widget.enableSearch)
                _buildSearchField(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodButton() {
    return ElevatedButton.icon(
      onPressed: widget.onPeriodChanged,
      icon: const Icon(Icons.calendar_today, size: 16, color: Color(0xFF6E7191)),
      label: Text(
        widget.periodButtonText,
        style: const TextStyle(color: Color(0xFF6E7191)),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF7F7FC),
        foregroundColor: const Color(0xFF6E7191),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: 250,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FC),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        onChanged: _onSearch,
        decoration: InputDecoration(
          hintText: widget.searchHintText,
          hintStyle: const TextStyle(color: Color(0xFF6E7191)),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF6E7191)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  Widget _buildTableColumnHeaders() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7FC),
      ),
      child: Row(
        children: widget.columns.asMap().entries.map((entry) {
          final columnIndex = entry.key;
          final column = entry.value;
          
          return Expanded(
            flex: _getColumnFlex(columnIndex),
            child: InkWell(
              onTap: widget.enableSorting ? () => _onSortColumn(columnIndex) : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: DefaultTextStyle(
                        style: widget.headerStyle ?? 
                            const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6E7191),
                            ),
                        child: column.label,
                      ),
                    ),
                    if (widget.enableSorting && sortColumnIndex == columnIndex)
                      Icon(
                        sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                        size: 16,
                        color: const Color(0xFF6E7191),
                      ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  int _getColumnFlex(int columnIndex) {
    // Personnalisez la largeur relative des colonnes ici
    // Par défaut, toutes les colonnes ont la même largeur
    return 1;
  }

  void _onSortColumn(int columnIndex) {
    setState(() {
      if (sortColumnIndex == columnIndex) {
        // Inverser l'ordre de tri
        sortAscending = !sortAscending;
      } else {
        // Nouvelle colonne de tri
        sortColumnIndex = columnIndex;
        sortAscending = true;
      }
      
      _sortData();
    });
  }

  Widget _buildTableBody() {
    if (filteredData.isEmpty) {
      return const Center(
        child: Text(
          'Aucune donnée disponible',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6E7191),
          ),
        ),
      );
    }

    // Calculer les éléments à afficher sur la page actuelle
    final int startIndex = widget.enablePagination ? currentPage * _rowsPerPage : 0;
    final int endIndex = widget.enablePagination  ? math.min(startIndex + _rowsPerPage, filteredData.length)  : filteredData.length;
    
    final List<T> pagedData = widget.enablePagination  ? filteredData.sublist(startIndex, endIndex) : filteredData;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: pagedData.length,
      separatorBuilder: (context, index) => SizedBox(height: widget.rowSpacing),
      itemBuilder: (context, index) {
        final item = pagedData[index];
        final cells = widget.cellsBuilder(item, index);
        
        return InkWell(
          onTap: widget.onRowTap != null ? () => widget.onRowTap!(item) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: cells.asMap().entries.map((cellEntry) {
                final cellIndex = cellEntry.key;
                final cell = cellEntry.value;
                return Expanded(
                  flex: _getColumnFlex(cellIndex),
                  child: DefaultTextStyle(
                    style: widget.cellStyle ?? 
                        const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF14142B),
                        ),
                    child: cell.child,
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaginationControls() {
    final int totalPages = (filteredData.length / _rowsPerPage).ceil();
    final bool canPreviousPage = currentPage > 0;
    final bool canNextPage = currentPage < totalPages - 1;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFEEEEEE), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sélecteur d'éléments par page
          Row(
            children: [
              const Text(
                'Lignes par page:',
                style: TextStyle(fontSize: 14, color: Color(0xFF6E7191)),
              ),
              const SizedBox(width: 8),
              DropdownButton<int>(
                value: _rowsPerPage,
                underline: Container(),
                isDense: true,
                items: widget.rowsPerPageOptions.map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      _rowsPerPage = newValue;
                      // Réinitialiser la page pour éviter les problèmes d'index
                      currentPage = 0;
                    });
                  }
                },
              ),
            ],
          ),
          
          // Informations sur les éléments affichés
          Text(
            '${currentPage * _rowsPerPage + 1}-${math.min((currentPage + 1) * _rowsPerPage, filteredData.length)} sur ${filteredData.length}',
            style: const TextStyle(fontSize: 14, color: Color(0xFF6E7191)),
          ),
          
          // Boutons de navigation entre les pages
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.first_page),
                onPressed: canPreviousPage ? () => setState(() => currentPage = 0) : null,
                color: canPreviousPage ? const Color(0xFF6E7191) : const Color(0xFFBBBBBB),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: canPreviousPage 
                    ? () => setState(() => currentPage--)
                    : null,
                color: canPreviousPage ? const Color(0xFF6E7191) : const Color(0xFFBBBBBB),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7FC),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${currentPage + 1}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF14142B),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: canNextPage  ? () => setState(() => currentPage++) : null,
                color: canNextPage ? const Color(0xFF6E7191) : const Color(0xFFBBBBBB),
              ),
              IconButton(
                icon: const Icon(Icons.last_page),
                onPressed: canNextPage  ? () => setState(() => currentPage = totalPages - 1) : null,
                color: canNextPage ? const Color(0xFF6E7191) : const Color(0xFFBBBBBB),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Widget pour afficher un produit avec une image et un nom
class ProductCell extends StatelessWidget {
  final String productName;
  final String? imageUrl;
  final double boxWidth;
  final double boxHeight;

  const ProductCell({
    Key? key,
    required this.productName,
    this.imageUrl,
    this.boxWidth = 180,
    this.boxHeight = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      height: boxHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (imageUrl != null)
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F5F5),
              ),
              child: const Icon(
                Icons.image_not_supported_outlined,
                size: 16,
                color: Color(0xFF9E9E9E),
              ),
            ),
          Expanded(
            child: Text(
              productName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}