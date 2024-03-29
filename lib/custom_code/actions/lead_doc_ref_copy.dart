// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> leadDocRefCopy(String dayId, String outletId,
    String stage, int yesterday, int today) async {
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
        .collection('OUTLET')
        .doc(outletId)
        .collection('OUTLET_LEADS')
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
        if (doc["status"] != "assigned" && doc["status"] != "LOST") {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          leadDocs.add({
            "leadRefId": doc.id,
            "username": doc["username"],
            //  "dayId": doc["dayId"],
            "mobile": doc["mobile"],
            //"location": doc["location"],
            "source": data.containsKey('source') == true
                ? doc["source"]
                : "not available",
            //  "source": doc["source"],
            // "priority": doc["priority"],
            "priority": data.containsKey('priority') == true
                ? doc["priority"]
                : "not available",
            //"organization": doc["organization"],
            "status": doc["status"],
            //  "leadCreatedDateTime": doc["createdDateTime"],
            "area": doc["area"],
            // "city": doc["city"],
            "city": data.containsKey('city') == true
                ? doc["city"]
                : "not available",

            "comments": doc["comments"], //"dd-mmm-yyyy  h:MM:ss"),
            "email": doc["email"],
            "date": doc["date"],
            "id": doc["id"],
            // "leadid": doc["leadid"],
            // "leadtype": doc["leadtype"],
            "logId": doc["logId"],
            //"state": doc["state"],
            "state": data.containsKey('state') == true
                ? doc["state"]
                : "not available",
            "mobileAlt": doc["mobileAlt"],
            "phone": doc["phone"],

            //"prefix": doc["prefix"],
            "requirement": doc["requirement"],
            // "businessName": doc["businessName"],

            //"businessType": doc["businessType"],
            "businessName": data.containsKey('businessName') == true
                ? doc["businessName"]
                : "not available",
            "businessType": data.containsKey('businessType') == true
                ? doc["businessType"]
                : "not available",

            "time": doc["time"],
          });

          if (doc["source"].toUpperCase() == "INDIAMART") {
            countIndiamart = countIndiamart + 1;
            // print(countIndiamart);
          } else if (doc["source"].toUpperCase() == "JUSTDAIL") {
            countJustDail = countJustDail + 1;
            //  print(countJustDail);
          } else if (doc["source"].toUpperCase() == "FACEBOOK") {
            countFacebook = countFacebook + 1;
          } else {
            countQuickLead = countQuickLead + 1;
          }
        }
      });
    }

    FFAppState().newLeadCounts.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
      "total": countIndiamart + countJustDail + countQuickLead + countFacebook
    });
    // print(FFAppState().newLeadCounts);

    //  print(leadDocs);
  } else if (stage == "all") {
    // print("all");
    FFAppState().assignedLeadCount.clear();
    FFAppState().followUpLeadCount.clear();
    FFAppState().completedLeadCount.clear();
    FFAppState().assignedLeadCount.clear();
    FFAppState().lostLeadCount.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection('LEADS_MANAGEMENT')
        .where('createdDate', isGreaterThan: yesterday)
        .where('createdDate', isLessThanOrEqualTo: today)
        .orderBy('createdDate', descending: true)
        .get()
        .then((value) => value);

    int len = querySnapshot.docs.length;
    // print(len);
    if (len > 0) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // print(doc["mobile"]);
        leadDocs.add({
          "username": doc["username"],
          "mobile": doc["mobile"],
          "status": doc["status"],
          "area": doc["area"],
          "city":
              data.containsKey('city') == true ? doc["city"] : "not available",
          "state": data.containsKey('state') == true
              ? doc["state"]
              : "not available",
          "source": data.containsKey('source') == true
              ? doc["source"]
              : "not available",
          "comments": doc["comments"], //"dd-mmm-yyyy  h:MM:ss"),
          "email": doc["email"],
          "date": doc["date"],
          "mobileAlt": doc["mobileAlt"],
          "phone": doc["phone"],
          "requirement": doc["requirement"],
          "time": doc["time"],
          "assignedTo": data.containsKey('assignedTo') == true
              ? doc["assignedTo"]
              : "not available",
          "createdDate": doc["createdDate"],
          "updatedDate": doc["updatedDate"],
          // "businessName": doc["businessName"],
          "businessName": data.containsKey('businessName') == true
              ? doc["businessName"]
              : "not available",
          //  "businessType": doc["businessType"],
          "businessType": data.containsKey('businessType') == true
              ? doc["businessType"]
              : "not available",
          "assignedBy": data.containsKey('assignedBy') == true
              ? doc["assignedBy"]
              : "not available",
          "id": data.containsKey('id') == true ? doc["id"] : "not available",
          "priority": data.containsKey('priority') == true
              ? doc["priority"]
              : "not available",
          "leadRefId": doc["leadRefId"],
          "remarks": doc["remarks"],
          "stage": doc["stage"],
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
  } else {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection('LEADS_MANAGEMENT')
        .where('stage', isEqualTo: stage)
        .where('createdDate', isGreaterThan: yesterday)
        .where('createdDate', isLessThanOrEqualTo: today)
        .orderBy('createdDate', descending: true)
        .get()
        .then((value) => value);
    int len = querySnapshot.docs.length;
    // print(len);
    if (len > 0) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print("***");
        print(doc["createdDate"]);
        print(doc["updatedDate"]);

        print("-------");
        leadDocs.add({
          "username": doc["username"],
          "mobile": doc["mobile"],
          "status": doc["status"],
          "area": doc["area"],
          "city":
              data.containsKey('city') == true ? doc["city"] : "not available",
          "state": data.containsKey('state') == true
              ? doc["state"]
              : "not available",
          "source": data.containsKey('source') == true
              ? doc["source"]
              : "not available",
          "comments": doc["comments"], //"dd-mmm-yyyy  h:MM:ss"),
          "email": doc["email"],
          "date": doc["date"],
          "mobileAlt": doc["mobileAlt"],
          "phone": doc["phone"],
          "requirement": doc["requirement"],
          "time": doc["time"],
          "assignedTo": data.containsKey('assignedTo') == true
              ? doc["assignedTo"]
              : "not available",
          "createdDate": doc["createdDate"],
          //"updatedDate": doc["updatedDate"],
          "updatedDate":
              data.containsKey('updatedDate') == true ? doc["updatedDate"] : 0,
          // "businessName": doc["businessName"],
          "businessName": data.containsKey('businessName') == true
              ? doc["businessName"]
              : "not available",
          //  "businessType": doc["businessType"],
          "businessType": data.containsKey('businessType') == true
              ? doc["businessType"]
              : "not available",
          "assignedBy": data.containsKey('assignedBy') == true
              ? doc["assignedBy"]
              : "not available",
          "id": data.containsKey('id') == true ? doc["id"] : "not available",
          "priority": data.containsKey('priority') == true
              ? doc["priority"]
              : "not available",
          "leadRefId": doc["leadRefId"],
          "remarks": doc["remarks"],
          "stage": doc["stage"],
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
