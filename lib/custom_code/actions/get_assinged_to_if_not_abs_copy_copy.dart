// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// ------------------------------------------------------------
// CONSTANTS
// ------------------------------------------------------------
const int WORKLOAD_CAP_FALLBACK = 4;

// class UserIds {
//   static const elson = 'Zidktay5v9R2lrjMeHgF3gHfm6g1';
//   static const anandu = '6umnbcLyCvfr2XNPJDLvStQp82Z2';
//   static const bhuvan = 'O677R5NSRsNEFtmOwNWuTECHbBy1';
//   static const testUser = 'sjzNMQQPVszp31iocnmN';
//   static const testManager = 'S1OTjFMxguhI1BXRYeRDeQ16QAF2';
// }

// ------------------------------------------------------------
// LIGHTWEIGHT MODEL CLASSES
// ------------------------------------------------------------

class Workload {
  // int elson = 0;
  // int anandu = 0;
  // int bhuvan = 0;
  // int testUser = 0;
  // int testManager = 0;
  int primary = 0;
  int fallback1 = 0;
  int fallback2 = 0;
}

class UserConfig {
  final String primaryName;
  final String fallback1Name;
  final String fallback2Name;
  final String primaryId;
  final String fallback1Id;
  final String fallback2Id;
  final int workloadCap;

  UserConfig(
      {required this.primaryName,
      required this.fallback1Name,
      required this.fallback2Name,
      required this.primaryId,
      required this.fallback1Id,
      required this.fallback2Id,
      required this.workloadCap});
}

class AssignmentResult {
  final bool assigned;
  final String? userId;
  AssignmentResult({required this.assigned, this.userId});
}

// ------------------------------------------------------------
// HELPER FUNCTIONS
// ------------------------------------------------------------

// Returns formatted dd-MM-yyyy
String getTodayFormatted() {
  final now = DateTime.now();
  return DateFormat('dd-MM-yyyy').format(now);
}

// Fetch leave+lead docs in parallel
Future<Map<String, dynamic>> fetchLeaveAndLeadDocs({
  required DocumentReference outlet,
  required String today,
}) async {
  try {
    final leaveFuture = outlet
        .collection('LEAVE_APPLICATION')
        .where('status', isEqualTo: 'APPROVED')
        .where('monthId', isEqualTo: getMonthId())
        .get();
    print("Fetching LEAVE_APPLICATION...");
    final leaveSnapshot = await leaveFuture;
    print("Fetched ${leaveSnapshot.docs.length} leave docs");

    final leadsFuture = outlet
        .collection('LEADS_MANAGEMENT')
        .where('date', isEqualTo: today)
        .where('state', isEqualTo: 'KERALA')
        .get();
    print("Fetching LEADS_MANAGEMENT...");
    final leadSnapshot = await leadsFuture;
    print("Fetched ${leadSnapshot.docs.length} lead docs");

    return {
      "leaveDocs": leaveSnapshot.docs
          .map((d) => LeaveApplicationRecord.fromSnapshot(d))
          .toList(),
      "leadDocs": leadSnapshot.docs
          .map((d) => LeadsManagementRecord.fromSnapshot(d))
          .toList(),
    };
  } catch (e) {
    print("ERROR in fetchLeaveAndLeadDocs: $e");
    rethrow;
  }
}

// Create new OUTLET_LEADS document
Future<DocumentReference> createOutletLead({
  required DocumentReference outlet,
  required DateTime now,
  required String today,
  required String area,
  required String city,
  required String email,
  required String mobile,
  required String mobileAlt,
  required String phone1,
  required String requirement,
  required String state,
  required String username,
  required String capacity,
  required String productType,
  required String purchasedFrom,
  required String serial,
  required List<OutletLeadsRecord> previousLeads, // <-- new param
}) async {
  final formatString = 'h:mm:ss a';

  final docRef = outlet.collection('OUTLET_LEADS').doc();

  await docRef.set({
    'area': area,
    'city': city,
    'createdDateTime': now,
    'date': today,
    'email': email,
    'id': now.millisecondsSinceEpoch,
    'logId': now.millisecondsSinceEpoch,
    'mobile': mobile,
    'mobileAlt': mobileAlt,
    'phone': phone1,
    'requirement': requirement,
    'state': state,
    'status': 'Unread',
    'time': DateFormat(formatString).format(now),
    'username': username,
    'monthId': getMonthId(),
    'yearId': getYearId(),
    'comments': '',
    'zone': FFAppState().stateZone,
    'customFields': CustomFieldsStruct(
      capacity: capacity,
      productType: productType,
      purchasedFrom: purchasedFrom,
      serial: serial,
    ).toMap(),
    'ticket': genComplaintTicket(previousLeads), // <-- use previous leads
    'source': 'QR',
  });

  return docRef;
}

// Check if user is on leave
bool checkOnLeave(String userId, List<LeaveApplicationRecord> leaveDocs) {
  DateTime today = DateTime.now();
  int todayMs =
      DateTime(today.year, today.month, today.day).millisecondsSinceEpoch;

  return leaveDocs.any((leave) {
    if (leave.userProfileId == userId) {
      final fromMs = leave.fromDate;
      final toMs = leave.toDate;

      if (fromMs == null || toMs == null) return false;

      return (fromMs <= todayMs && todayMs <= toMs);
    }
    return false;
  });
}

// Count today's workloads
Workload calculateWorkloads(
    {required List<LeadsManagementRecord> leadDocs,
    required UserConfig config}) {
  final workload = Workload();

  for (final doc in leadDocs) {
    if (doc.assignedToHistory.isEmpty) continue;

    final assignedId = doc.assignedToHistory.last.userProfileId ?? '';
    final source = doc.source;
    final stage = doc.stage;

    if (source != 'QR' || stage != 'assigned') continue;

    if (assignedId == config.primaryId)
      // workload.elson++;
      workload.primary++;
    else if (assignedId == config.fallback1Id)
      // workload.anandu++;
      workload.fallback1++;
    else if (assignedId == config.fallback2Id)
      // workload.bhuvan++;
      workload.fallback2++;
    // else if (assignedId == config.testUserId)
    //   workload.testUser++;
    // else if (assignedId == config.testManager) workload.testManager++;
  }

  return workload;
}

// // Find employee by username
// String? findEmployeeByName(List<TeamTreeRecord> team, String name) {
//   final match = team.where(
//     (t) => (t.userName ?? "").toLowerCase() == name.toLowerCase(),
//   );

//   if (match.isEmpty) return null;
//   return match.first.userProfileId;
// }

// Perform assignment write
Future<void> assignLeadTo({
  required String userId,
  required DocumentReference outlet,
  required DocumentReference outletLeadDocRef,
  required OutletLeadsRecord outletLeadRecord,
  required DateTime now,
}) async {
  try {
    final leadRef = outlet.collection('LEADS_MANAGEMENT').doc();

    await leadRef.set({
      'status': 'assigned',
      'stage': 'assigned',
      'createdDate': now.millisecondsSinceEpoch,
      'assignedTo': userId,
      'isCustomer': false,
      'followUpName': outletLeadRecord.username,
      'area': outletLeadRecord.area,
      'city': outletLeadRecord.city,
      'comments': outletLeadRecord.comments,
      'date': outletLeadRecord.date,
      'email': outletLeadRecord.email,
      'logId': outletLeadRecord.logId,
      'mobile': outletLeadRecord.mobile,
      'mobileAlt': outletLeadRecord.mobileAlt,
      'phone': outletLeadRecord.phone,
      'requirement': outletLeadRecord.requirement,
      'source': 'QR',
      'time': outletLeadRecord.time,
      'username': outletLeadRecord.username,
      'state': outletLeadRecord.state,
      'remarks': '#',
      'leadRefId': outletLeadDocRef.id,
      'updatedBy': '',
      'priority': outletLeadRecord.priority,
      'leadDate': outletLeadRecord.date,
      'leadCreatedDate':
          outletLeadRecord.createdDateTime!.millisecondsSinceEpoch,
      'leadTag':
          LeadTagListStruct(code: 0, isDeleted: false, leadTagName: '').toMap(),
      'businessName': outletLeadRecord.businessName,
      'businessType': outletLeadRecord.businessType,
      'isDealerLead': false,
      'ticket': outletLeadRecord.ticket,
      'customFields': outletLeadRecord.customFields.toMap(),
      'assignedBy': '0',
      'closeDate': '0',
      'closeDateMili': 0,
      'assignedToHistory': [
        AssignedToHistoryStruct(
          userProfileId: userId,
          assignedDate: now.millisecondsSinceEpoch,
          assignedDateTime: now,
        ).toMap()
      ],
      'zone': outletLeadRecord.zone,
      'id': leadRef.id,
    });

    await outletLeadDocRef.update({'status': 'assigned'});

    print("Assigned to $userId");
  } catch (e) {
    print("Assignment error: $e");
  }
}

// ------------------------------------------------------------
// UNIFIED LOGIC FLOW (CRM + DEMO via isTesting)
// ------------------------------------------------------------

Future<UserConfig> getConfig(bool isTesting, DocumentReference outlet) async {
  final snapshot = await outlet
      .collection('AUTO_ASSIGN')
      .where('isActive', isEqualTo: true)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    print('AUTO_ASSIGN config missing');
  }

  final data = snapshot.docs.first.data();

  final int workloadCap = data['workloadCap'] ?? WORKLOAD_CAP_FALLBACK;

  if (isTesting) {
    return UserConfig(
      primaryName: data['testUserName'],
      fallback1Name: data['testManagerName'],
      fallback2Name: data['testManagerName'], // Same fallback for testing
      primaryId: data['testUserId'],
      fallback1Id: data['testManagerId'],
      fallback2Id: data['testManagerId'],
      workloadCap: workloadCap,
    );
  }

  // CRM mode
  return UserConfig(
    primaryName: data['user1Name'],
    fallback1Name: data['user2Name'],
    fallback2Name: data['managerName'],
    primaryId: data['user1Id'],
    fallback1Id: data['user2Id'],
    fallback2Id: data['managerId'],
    workloadCap: workloadCap,
  );
}

// ------------------------------------------------------------
// MAIN FUNCTION
// ------------------------------------------------------------

Future<String> getAssingedToIfNotAbsCopyCopy(
  bool isTesting,
  String area,
  String city,
  String email,
  String mobile,
  String mobileAlt,
  String phone1,
  String requirement,
  String state,
  String username,
  String capacity,
  String productType,
  String purchasedFrom,
  String serial,
) async {
  // Add your function code here!
  print("=== getAssignedToIfNotAbsCopyCopy START ===");
  final String today = getTodayFormatted();
  final now = DateTime.now();
  print("Today: $today, Now: $now");

  final outlet =
      isTesting ? FFAppState().demoOutlet! : FFAppState().deyeOutletId!;
  print("Outlet reference: $outlet, isTesting: $isTesting");

  try {
    // Fetch previous leads first (for ticket generation)
    final previousLeadsSnapshot = await outlet
        .collection('OUTLET_LEADS')
        .where('date', isEqualTo: today)
        .get();
    print("Fetched ${previousLeadsSnapshot.docs.length} previous leads");

    final previousLeads = previousLeadsSnapshot.docs
        .map((doc) => OutletLeadsRecord.fromSnapshot(doc))
        .toList();

    // Check if blocked recently using previousLeads
    if (await blockForSometime(previousLeads, mobile, 60)) {
      print("Mobile $mobile is blocked temporarily. Exiting.");
      return "BLOCKED";
    }

    // Create new OUTLET_LEAD entry
    final outletLeadDocRef = await createOutletLead(
      outlet: outlet,
      now: now,
      today: today,
      area: area,
      city: city,
      email: email,
      mobile: mobile,
      mobileAlt: mobileAlt,
      phone1: phone1,
      requirement: requirement,
      state: state,
      username: username,
      capacity: capacity,
      productType: productType,
      purchasedFrom: purchasedFrom,
      serial: serial,
      previousLeads: previousLeads,
    );
    print("Created new outlet lead: ${outletLeadDocRef.id}");

    final snapshot = await outletLeadDocRef.get();
    final outletLeadRecord = OutletLeadsRecord.getDocumentFromData(
      snapshot.data() as Map<String, dynamic>,
      snapshot.reference,
    );

    if (FFAppState().stateZone != "SOUTH") {
      print(
          "State zone is not SOUTH (${FFAppState().stateZone}), skipping assignment.");
      return outletLeadRecord.ticket;
    }

    // Fetch leave and lead docs
    final fetched = await fetchLeaveAndLeadDocs(outlet: outlet, today: today);
    final leaveDocs = fetched["leaveDocs"];
    final leadDocs = fetched["leadDocs"];
    print(
        "Fetched leaveDocs: ${leaveDocs.length}, leadDocs: ${leadDocs.length}");

    print(
        "OutletLeadRecord loaded: ${outletLeadRecord.username}, ${outletLeadRecord.mobile}");

    // Config
    final config = await getConfig(isTesting, outlet);
    final primaryId = config.primaryId;
    print(
        "Primary ID: $primaryId, Fallback1: ${config.fallback1Id}, Fallback2: ${config.fallback2Id}");

    // Workloads
    final workload = calculateWorkloads(leadDocs: leadDocs, config: config);
    print(
        "Workload: Primary=${workload.primary}, Fallback1=${workload.fallback1}, Fallback2=${workload.fallback2}");

    // Assignment order
    Future<bool> attemptAssign(String? userId, int count) async {
      print("Attempting assign to $userId with current count $count");
      if (userId == null) {
        print("UserId is null, skipping");
        return false;
      }
      if (checkOnLeave(userId, leaveDocs)) {
        print("User $userId is on leave, skipping");
        return false;
      }
      if (count >= config.workloadCap) {
        print(
            "User $userId has reached workload cap ($count >= ${config.workloadCap}), skipping");
        return false;
      }

      try {
        await assignLeadTo(
          userId: userId,
          outlet: outlet,
          outletLeadDocRef: outletLeadDocRef,
          outletLeadRecord: outletLeadRecord,
          now: now,
        );
        print("Assigned successfully to $userId");
      } catch (e) {
        print("Assignment failed for $userId: $e");
        return false;
      }
      return true;
    }

    int getWorkloadFor(String userId) {
      // if (userId == UserIds.elson) return workload.elson;
      // if (userId == UserIds.anandu) return workload.anandu;
      // if (userId == UserIds.bhuvan) return workload.bhuvan;
      // if (userId == UserIds.testUser) return workload.testUser;
      // if (userId == UserIds.testManager) return workload.testManager;
      if (userId == config.primaryId)
        return workload.primary;
      else if (userId == config.fallback1Id)
        return workload.fallback1;
      else if (userId == config.fallback2Id) return workload.fallback2;
      return 0;
    }

    if (await attemptAssign(primaryId, getWorkloadFor(primaryId)))
      return outletLeadRecord.ticket;
    if (await attemptAssign(
        config.fallback1Id, getWorkloadFor(config.fallback1Id)))
      return outletLeadRecord.ticket;
    if (await attemptAssign(
        config.fallback2Id, getWorkloadFor(config.fallback2Id)))
      return outletLeadRecord.ticket;

    print("No automatic assignment possible.");
    return outletLeadRecord.ticket;
  } catch (e) {
    print("ERROR in getAssignedToIfNotAbsCopyCopy: $e");
  }

  print("=== getAssignedToIfNotAbsCopyCopy END ===");
  return "ERROR";
}
