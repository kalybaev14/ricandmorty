import 'dart:convert';

class FilterEntity {
  final int? currentpage;
  final int? maxpage;
  final String? searchtext; 
  final String? status; 
  final String? gender; 
  FilterEntity({
    this.currentpage,
    this.maxpage,
    this.searchtext,
    this.status,
    this.gender,
  });

  FilterEntity copyWith({
    int? currentpage,
    int? maxpage,
    String? searchtext,
    String? status,
    String? gender,
  }) {
    return FilterEntity(
      currentpage: currentpage ?? this.currentpage,
      maxpage: maxpage ?? this.maxpage,
      searchtext: searchtext ?? this.searchtext,
      status: status ?? this.status,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentpage': currentpage,
      'maxpage': maxpage,
      'searchtext': searchtext,
      'status': status,
      'gender': gender,
    };
  }

  factory FilterEntity.fromMap(Map<String, dynamic> map) {
    return FilterEntity(
      currentpage: map['currentpage']?.toInt(),
      maxpage: map['maxpage']?.toInt(),
      searchtext: map['searchtext'],
      status: map['status'],
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterEntity.fromJson(String source) => FilterEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FilterEntity(currentpage: $currentpage, maxpage: $maxpage, searchtext: $searchtext, status: $status, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FilterEntity &&
      other.currentpage == currentpage &&
      other.maxpage == maxpage &&
      other.searchtext == searchtext &&
      other.status == status &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return currentpage.hashCode ^
      maxpage.hashCode ^
      searchtext.hashCode ^
      status.hashCode ^
      gender.hashCode;
  }
}
