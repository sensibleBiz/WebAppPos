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

Future<List<dynamic>> leadDocRef(String dayId, String outletId, String stage,
    int yesterday, int today) async {
  int countIndiamart = 0;
  int countJustDail = 0;
  int countFacebook = 0;
  int countQuickLead = 0;
  int callPending = 0;
  int demopending = 0;
  int demoScheduled = 0;
  int called = 0;

  // Add your function code here!

  List<dynamic> leadDocs = [];
  if (stage == "new") {
    // print(stage);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('LEADS')
        //.where('status', isNotEqualTo: 'assigned')
        .where('logId', isGreaterThan: yesterday)
        .where('logId', isLessThanOrEqualTo: today)
        .orderBy('logId', descending: true)
        .get()
        .then((value) => value);

    int len = querySnapshot.docs.length;

    // print(len);

    if (len > 0) {
      querySnapshot.docs.forEach((doc) {
        // print(doc["businessName"]);

        if (doc["status"] != "assigned" && doc["status"] != "LOST") {
          leadDocs.add({
            "leadRefId": doc.id,
            "username": doc["username"],
            //  "dayId": doc["dayId"],
            "mobile": doc["mobile"],
            //"location": doc["location"],
            "source": doc["source"],
            //"organization": doc["organization"],
            "status": doc["status"],
            //  "leadCreatedDateTime": doc["createdDateTime"],
            "area": doc["area"],
            "city": doc["city"],
            "comments": doc["comments"], //"dd-mmm-yyyy  h:MM:ss"),
            "email": doc["email"],
            "date": doc["date"],
            "id": doc["id"],
            // "leadid": doc["leadid"],
            // "leadtype": doc["leadtype"],
            "logId": doc["logId"],
            "state": doc["state"],
            "mobileAlt": doc["mobileAlt"],
            "phone": doc["phone"],

            //"prefix": doc["prefix"],
            "requirement": doc["requirement"],
            "businessName": doc["businessName"],

            "businessType": doc["businessType"],

            "time": doc["time"],
            "leadCampaign": doc["leadCampaign"]
          });
        }
        if (doc["source"].toUpperCase() == "INDIAMART") {
          countIndiamart = countIndiamart + 1;
          // print(countIndiamart);
        } else if (doc["source"].toUpperCase() == "JUSTDAIL") {
          countJustDail = countJustDail + 1;
          // print(countJustDail);
        } else if (doc["source"].toUpperCase() == "FACEBOOK") {
          countFacebook = countFacebook + 1;
        } else {
          countQuickLead = countQuickLead + 1;
        }
      });
    }

    FFAppState().newLeadCounts.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
    });
    // print(FFAppState().newLeadCounts);

    // print(leadDocs);
  } else {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection('LEADS_MANAGEMENT')
        .where('stage', isEqualTo: stage)
        .where('isDealerLead', isEqualTo: false)
        .where('createdDate', isGreaterThan: yesterday)
        .where('createdDate', isLessThanOrEqualTo: today)
        .orderBy('createdDate', descending: true)
        .get()
        .then((value) => value);

    int len = querySnapshot.docs.length;
    // print(len);
    if (len > 0) {
      querySnapshot.docs.forEach((doc) {
        // print(doc["businessName"]);
        leadDocs.add({
          "username": doc["username"],
          "mobile": doc["mobile"],
          "source": doc["source"],
          "status": doc["status"],
          //  "createdDateTime": doc["createdDateTime"],
          "area": doc["area"],
          "city": doc["city"],
          "comments": doc["comments"], //"dd-mmm-yyyy  h:MM:ss"),
          "email": doc["email"],
          "date": doc["date"],
          "id": doc["id"],
          // "logId": doc["logId"],
          "mobileAlt": doc["mobileAlt"],
          "phone": doc["phone"],
          "requirement": doc["requirement"],
          "time": doc["time"],
          //  "dayId": doc["dayId"],
          //"location": doc["location"],
          "state": doc["state"],
          //"prefix": doc["prefix"],
          //"organization": doc["organization"],
          // "leadid": doc["leadid"],
          // "leadtype": doc["leadtype"],
          "assignedTo": doc["assignedTo"],
          "createdDate": doc["createdDate"],
          "updatedDate": doc["updatedDate"],
          "businessName": doc["businessName"],
          "businessType": doc["businessType"],

          //"followUpDate1": doc["followUpDate1"],
          // "followUpName": doc["followUpName"],
          "leadRefId": doc["leadRefId"],
          //"leadTag": doc["leadTag"],
          "remarks": doc["remarks"],
          "stage": doc["stage"],
          //"priority": doc["priority"],
        });
        if (doc["status"].toUpperCase() == "CALL PENDING") {
          callPending = callPending + 1;
        } else if (doc["status"].toUpperCase() == "DEMO PENDING") {
          demopending = demopending + 1;
        } else if (doc["status"].toUpperCase() == "DEMO SCHEDULED") {
          demoScheduled = demoScheduled + 1;
        } else if (doc["status"].toUpperCase() == "CALLED") {
          called = called + 1;
        }

        if (doc["stage"] == "followup") {
          if (doc["source"].toUpperCase() == "INDIAMART") {
            countIndiamart = countIndiamart + 1;
          } else if (doc["source"].toUpperCase() == "JUSTDAIL") {
            countJustDail = countJustDail + 1;
          } else if (doc["source"].toUpperCase() == "FACEBOOK") {
            countFacebook = countFacebook + 1;
          } else {
            countQuickLead = countQuickLead + 1;
          }
        }

        if (doc["stage"] == "completed") {
          if (doc["source"].toUpperCase() == "INDIAMART") {
            countIndiamart = countIndiamart + 1;
          } else if (doc["source"].toUpperCase() == "JUSTDAIL") {
            countJustDail = countJustDail + 1;
          } else if (doc["source"].toUpperCase() == "FACEBOOK") {
            countFacebook = countFacebook + 1;
          } else {
            countQuickLead = countQuickLead + 1;
          }
        }
        if (doc["stage"] == "lost") {
          if (doc["source"].toUpperCase() == "INDIAMART") {
            countIndiamart = countIndiamart + 1;
          } else if (doc["source"].toUpperCase() == "JUSTDAIL") {
            countJustDail = countJustDail + 1;
          } else if (doc["source"].toUpperCase() == "FACEBOOK") {
            countFacebook = countFacebook + 1;
          } else {
            countQuickLead = countQuickLead + 1;
          }
        }
      });
    }
// addAssignTest
    FFAppState().addAssignTest = {
      "callPending": callPending,
      "demoPending": demopending,
      "demoScheduled": demoScheduled,
      "called": called,
      "total": callPending + demopending + demoScheduled + called
    };

    // print(FFAppState().addAssignTest.total);
    FFAppState().assignedLeadCount.add({
      "callPending": callPending,
      "demoPending": demopending,
      "demoScheduled": demoScheduled,
      "called": called,
      "total": callPending + demopending + demoScheduled + called
    });
    FFAppState().followUpLeadCount.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
      "total": countIndiamart + countJustDail + countQuickLead + countFacebook
    });
    FFAppState().completedLeadCount.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
      "total": countIndiamart + countJustDail + countQuickLead + countFacebook
    });
    FFAppState().lostLeadCount.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
      "total": countIndiamart + countJustDail + countQuickLead + countFacebook
    });

    // print(leadDocs);
  }
  return leadDocs;
}
