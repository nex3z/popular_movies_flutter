import 'package:json_annotation/json_annotation.dart';
import 'package:popular_movies_flutter/data/entity/base_response.dart';

abstract class BaseListResponse extends BaseResponse {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;

  BaseListResponse(id, this.page, this.totalResults, this.totalPages) : super(id);

}

