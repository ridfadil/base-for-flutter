import 'dart:convert';

class ReportResponse {
  List<Data> dataList;
  Meta meta;

  ReportResponse({this.dataList, this.meta});

  ReportResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataList = new List<Data>();
      json['data'].forEach((v) {
        dataList.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }


  List<Data> reportFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Data>.from(data.map((item) => Data.fromJson(item)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataList = new Map<String, dynamic>();
    if (this.dataList != null) {
      dataList['data'] = this.dataList.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      dataList['meta'] = this.meta.toJson();
    }
    return dataList;
  }
}

class Data {
  int id;
  String formName;
  String projectId;
  String workDesc;
  String employer;
  String executor;
  String vendor;
  String no;
  String date;
  String location;
  String remarks;
  String inputter;
  String approver;
  String approverDate;
  String status;
  String statusNote;
  String created;
  String submitted;
  List<Others> others;
  int asEvidence;
  String pivotStatus;

  Data(
      {this.id,
      this.formName,
      this.projectId,
      this.workDesc,
      this.employer,
      this.executor,
      this.vendor,
      this.no,
      this.date,
      this.location,
      this.remarks,
      this.inputter,
      this.approver,
      this.approverDate,
      this.status,
      this.statusNote,
      this.created,
      this.submitted,
      this.others,
      this.asEvidence,
      this.pivotStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formName = json['form_name'];
    projectId = json['project_id'];
    workDesc = json['work_desc'];
    employer = json['employer'];
    executor = json['executor'];
    vendor = json['vendor'];
    no = json['no'];
    date = json['date'];
    location = json['location'];
    remarks = json['remarks'];
    inputter = json['inputter'];
    approver = json['approver'];
    approverDate = json['approver_date'];
    status = json['status'];
    statusNote = json['status_note'];
    created = json['created'];
    submitted = json['submitted'];
    if (json['others'] != null) {
      others = new List<Others>();
      json['others'].forEach((v) {
        others.add(new Others.fromJson(v));
      });
    }
    asEvidence = json['as_evidence'];
    pivotStatus = json['pivot_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['form_name'] = this.formName;
    data['project_id'] = this.projectId;
    data['work_desc'] = this.workDesc;
    data['employer'] = this.employer;
    data['executor'] = this.executor;
    data['vendor'] = this.vendor;
    data['no'] = this.no;
    data['date'] = this.date;
    data['location'] = this.location;
    data['remarks'] = this.remarks;
    data['inputter'] = this.inputter;
    data['approver'] = this.approver;
    data['approver_date'] = this.approverDate;
    data['status'] = this.status;
    data['status_note'] = this.statusNote;
    data['created'] = this.created;
    data['submitted'] = this.submitted;
    if (this.others != null) {
      data['others'] = this.others.map((v) => v.toJson()).toList();
    }
    data['as_evidence'] = this.asEvidence;
    data['pivot_status'] = this.pivotStatus;
    return data;
  }
}

class Others {
  //Others({});

  Others.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Meta {
  Pagination pagination;

  Meta({this.pagination});

  Meta.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;
  Links links;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages,
      this.links});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class Links {
  String next;

  Links({this.next});

  Links.fromJson(Map<String, dynamic> json) {
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    return data;
  }
}
