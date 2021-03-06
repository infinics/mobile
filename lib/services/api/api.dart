import 'dart:io';

import 'package:flutter/foundation.dart';

import '../../model/doctype_response.dart';
import '../../model/desktop_page_response.dart';
import '../../model/desk_sidebar_items_response.dart';
import '../../model/login_response.dart';

abstract class Api {
  Future<LoginResponse> login(
    String usr,
    String pwd,
  );

  Future<DeskSidebarItemsResponse> getDeskSideBarItems();

  Future<DesktopPageResponse> getDesktopPage(
    String module,
  );

  Future<DoctypeResponse> getDoctype(
    String doctype,
  );

  Future<List> fetchList({
    @required List fieldnames,
    @required String doctype,
    @required DoctypeDoc meta,
    List filters,
    pageLength,
    offset,
  });

  Future getdoc(String doctype, String name);

  Future postComment(
    String refDocType,
    String refName,
    String content,
    String email,
  );

  Future sendEmail({
    @required recipients,
    cc,
    bcc,
    @required subject,
    @required content,
    @required doctype,
    @required doctypeName,
    sendEmail,
    printHtml,
    sendMeACopy,
    printFormat,
    emailTemplate,
    attachments,
    readReceipt,
    printLetterhead,
  });

  Future addAssignees(String doctype, String name, List assignees);

  Future removeAssignee(String doctype, String name, String assignTo);

  Future getDocinfo(String doctype, String name);

  Future removeAttachment(
    String doctype,
    String name,
    String attachmentName,
  );

  Future deleteComment(String name);

  Future uploadFile(String doctype, String name, List<File> files);

  Future saveDocs(String doctype, Map formValue);

  Future<Map> searchLink({
    String doctype,
    String refDoctype,
    String txt,
    int pageLength,
  });

  Future toggleLike(String doctype, String name, bool isFav);

  Future getTags(String doctype, String txt);

  Future removeTag(String doctype, String name, String tag);

  Future addTag(String doctype, String name, String tag);

  Future addReview(String doctype, String name, Map reviewData);

  Future setPermission(
    String doctype,
    String name,
    Map shareInfo,
  );

  Future shareAdd(String doctype, String name, Map shareInfo);

  Future<Map> getContactList(String query);
}
