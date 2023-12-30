class KidsFacilityDto {
  Response? response;

  KidsFacilityDto({this.response});

  KidsFacilityDto.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  Header? header;
  Body? body;

  Response({this.header, this.body});

  Response.fromJson(Map<String, dynamic> json) {
    header =
    json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Header {
  String? resultCode;
  String? resultMsg;

  Header({this.resultCode, this.resultMsg});

  Header.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    resultMsg = json['resultMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCode'] = resultCode;
    data['resultMsg'] = resultMsg;
    return data;
  }
}

class Body {
  int? recordCountPerPage;
  int? pageIndex;
  int? totalPageCnt;
  int? totalCnt;
  List<Items>? items;

  Body(
      {this.recordCountPerPage,
        this.pageIndex,
        this.totalPageCnt,
        this.totalCnt,
        this.items});

  Body.fromJson(Map<String, dynamic> json) {
    recordCountPerPage = json['recordCountPerPage'];
    pageIndex = json['pageIndex'];
    totalPageCnt = json['totalPageCnt'];
    totalCnt = json['totalCnt'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recordCountPerPage'] = recordCountPerPage;
    data['pageIndex'] = pageIndex;
    data['totalPageCnt'] = totalPageCnt;
    data['totalCnt'] = totalCnt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? pfctSn;
  String? pfctNm;
  String? zip;
  String? lotnoAddr;
  String? lotnoDaddr;
  String? ronaAddr;
  String? ronaDaddr;
  String? instlYmd;
  String? clsgYmd;
  String? acptnYmd;
  String? etcSufa;
  String? exfcYn;
  String? fcar;
  String? instlPlaceCd;
  String? instlPlaceCdNm;
  String? dutyCd;
  String? dutyCdNm;
  String? prvtPblcYnCd;
  String? prvtPblcYnCdNm;
  String? operYnCd;
  String? operYnCdNm;
  String? idrodrCd;
  String? idrodrCdNm;
  String? exfcDsgnYmd;
  String? rgnCd;
  String? rgnCdNm;
  String? latCrtsVl;
  String? lotCrtsVl;

  Items(
      {this.pfctSn,
        this.pfctNm,
        this.zip,
        this.lotnoAddr,
        this.lotnoDaddr,
        this.ronaAddr,
        this.ronaDaddr,
        this.instlYmd,
        this.clsgYmd,
        this.acptnYmd,
        this.etcSufa,
        this.exfcYn,
        this.fcar,
        this.instlPlaceCd,
        this.instlPlaceCdNm,
        this.dutyCd,
        this.dutyCdNm,
        this.prvtPblcYnCd,
        this.prvtPblcYnCdNm,
        this.operYnCd,
        this.operYnCdNm,
        this.idrodrCd,
        this.idrodrCdNm,
        this.exfcDsgnYmd,
        this.rgnCd,
        this.rgnCdNm,
        this.latCrtsVl,
        this.lotCrtsVl});

  Items.fromJson(Map<String, dynamic> json) {
    pfctSn = json['pfctSn'];
    pfctNm = json['pfctNm'];
    zip = json['zip'];
    lotnoAddr = json['lotnoAddr'];
    lotnoDaddr = json['lotnoDaddr'];
    ronaAddr = json['ronaAddr'];
    ronaDaddr = json['ronaDaddr'];
    instlYmd = json['instlYmd'];
    clsgYmd = json['clsgYmd'];
    acptnYmd = json['acptnYmd'];
    etcSufa = json['etcSufa'];
    exfcYn = json['exfcYn'];
    fcar = json['fcar'];
    instlPlaceCd = json['instlPlaceCd'];
    instlPlaceCdNm = json['instlPlaceCdNm'];
    dutyCd = json['dutyCd'];
    dutyCdNm = json['dutyCdNm'];
    prvtPblcYnCd = json['prvtPblcYnCd'];
    prvtPblcYnCdNm = json['prvtPblcYnCdNm'];
    operYnCd = json['operYnCd'];
    operYnCdNm = json['operYnCdNm'];
    idrodrCd = json['idrodrCd'];
    idrodrCdNm = json['idrodrCdNm'];
    exfcDsgnYmd = json['exfcDsgnYmd'];
    rgnCd = json['rgnCd'];
    rgnCdNm = json['rgnCdNm'];
    latCrtsVl = json['latCrtsVl'];
    lotCrtsVl = json['lotCrtsVl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pfctSn'] = pfctSn;
    data['pfctNm'] = pfctNm;
    data['zip'] = zip;
    data['lotnoAddr'] = lotnoAddr;
    data['lotnoDaddr'] = lotnoDaddr;
    data['ronaAddr'] = ronaAddr;
    data['ronaDaddr'] = ronaDaddr;
    data['instlYmd'] = instlYmd;
    data['clsgYmd'] = clsgYmd;
    data['acptnYmd'] = acptnYmd;
    data['etcSufa'] = etcSufa;
    data['exfcYn'] = exfcYn;
    data['fcar'] = fcar;
    data['instlPlaceCd'] = instlPlaceCd;
    data['instlPlaceCdNm'] = instlPlaceCdNm;
    data['dutyCd'] = dutyCd;
    data['dutyCdNm'] = dutyCdNm;
    data['prvtPblcYnCd'] = prvtPblcYnCd;
    data['prvtPblcYnCdNm'] = prvtPblcYnCdNm;
    data['operYnCd'] = operYnCd;
    data['operYnCdNm'] = operYnCdNm;
    data['idrodrCd'] = idrodrCd;
    data['idrodrCdNm'] = idrodrCdNm;
    data['exfcDsgnYmd'] = exfcDsgnYmd;
    data['rgnCd'] = rgnCd;
    data['rgnCdNm'] = rgnCdNm;
    data['latCrtsVl'] = latCrtsVl;
    data['lotCrtsVl'] = lotCrtsVl;
    return data;
  }
}