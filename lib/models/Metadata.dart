class MetaData {
  int pageCount;
  int totalItemCount;
  int pageNumber;
  int pageSize;
  bool hasPreviousPage;
  bool hasNextPage;
  bool isFirstPage;
  bool isLastPage;
  int firstItemOnPage;
  int lastItemOnPage;

  MetaData(
      {this.pageCount,
      this.totalItemCount,
      this.pageNumber,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage,
      this.isFirstPage,
      this.isLastPage,
      this.firstItemOnPage,
      this.lastItemOnPage});

  MetaData.fromJson(Map<String, dynamic> json) {
    pageCount = json['PageCount'];
    totalItemCount = json['TotalItemCount'];
    pageNumber = json['PageNumber'];
    pageSize = json['PageSize'];
    hasPreviousPage = json['HasPreviousPage'];
    hasNextPage = json['HasNextPage'];
    isFirstPage = json['IsFirstPage'];
    isLastPage = json['IsLastPage'];
    firstItemOnPage = json['FirstItemOnPage'];
    lastItemOnPage = json['LastItemOnPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PageCount'] = this.pageCount;
    data['TotalItemCount'] = this.totalItemCount;
    data['PageNumber'] = this.pageNumber;
    data['PageSize'] = this.pageSize;
    data['HasPreviousPage'] = this.hasPreviousPage;
    data['HasNextPage'] = this.hasNextPage;
    data['IsFirstPage'] = this.isFirstPage;
    data['IsLastPage'] = this.isLastPage;
    data['FirstItemOnPage'] = this.firstItemOnPage;
    data['LastItemOnPage'] = this.lastItemOnPage;
    return data;
  }
}
