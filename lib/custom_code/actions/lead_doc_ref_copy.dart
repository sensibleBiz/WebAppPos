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
  int totalLost = 0;
  var product;
  var capacity;
  var serial;
  var purFrom;
  // Add your function code here!
  Set<String> addedMobiles = {};

  List<dynamic> leadDocs = [];
  if (stage == "new") {
    print("new");
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

          if (data.containsKey('customFields')) {
            Map<String, dynamic> customFields = data['customFields'];
            product = customFields['productType'];
            capacity = customFields['capacity'];
            serial = customFields['serial'];
            purFrom = customFields['purchasedFrom'];
          } else {
            product = "not available";
            capacity = "not available";
            serial = "not available";
            purFrom = "not available";
          }

          if (addedMobiles.contains(doc["mobile"])) {
            return;
          } else {
            addedMobiles.add(doc["mobile"]);
//*** */
            var zone = data.containsKey('zone') == true
                ? doc["zone"]
                : "not available";
            if (FFAppState().billingType == "CRM") {
              if (FFAppState().zone == zone) {
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

                  "ticket": data.containsKey('ticket') == true
                      ? doc["ticket"]
                      : "not available",
                  "product": product,
                  "capacity": capacity,
                  "purFrom": purFrom,
                  "serial": serial,
                  "leadCampaign": data.containsKey('leadCampaign') == true
                      ? doc["leadCampaign"]
                      : "not available"
                });
              } else if (FFAppState().zone == "ALL") {
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

                  "ticket": data.containsKey('ticket') == true
                      ? doc["ticket"]
                      : "not available",
                  "product": product,
                  "capacity": capacity,
                  "purFrom": purFrom,
                  "serial": serial,
                  "leadCampaign": data.containsKey('leadCampaign') == true
                      ? doc["leadCampaign"]
                      : "not available"
                });
              }
            } else {
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
// "leadCampaign": doc["leadCampaign"],
                "leadCampaign": data.containsKey('leadCampaign') == true
                    ? doc["leadCampaign"]
                    : "not available",
                "ticket": data.containsKey('ticket') == true
                    ? doc["ticket"]
                    : "not available",
                "product": product,
                "capacity": capacity,
                "purFrom": purFrom,
                "serial": serial
              });
            }

            //**** */
            if (data.containsKey('source') == true) {
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
    print("all");
    FFAppState().assignedLeadCount.clear();
    FFAppState().followUpLeadCount.clear();
    // FFAppState().completedLeadCount.clear();
    FFAppState().assignedLeadCount.clear();
    FFAppState().lostLeadCount.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection('LEADS_MANAGEMENT')
        .where('isDealerLead', isEqualTo: false)
        .where('createdDate', isGreaterThan: yesterday)
        .where('createdDate', isLessThanOrEqualTo: today)
        .orderBy('createdDate', descending: true)
        .get()
        .then((value) => value);

    int len = querySnapshot.docs.length;
    // print(len);
    // print(querySnapshot.docs);
    if (len > 0) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (data.containsKey('customFields')) {
          Map<String, dynamic> customFields = data['customFields'];
          product = customFields['productType'];
          capacity = customFields['capacity'];
          serial = customFields['serial'];
          purFrom = customFields['purchasedFrom'];
        } else {
          product = "not available";
          capacity = "not available";
          serial = "not available";
          purFrom = "not available";
        }
        var zone =
            data.containsKey('zone') == true ? doc["zone"] : "not available";

        if (FFAppState().billingType == "CRM") {
          if (FFAppState().zone == zone) {
            leadDocs.add({
              "username": doc["username"],
              "mobile": doc["mobile"],
              "status": doc["status"],
              "area": doc["area"],
              "city": data.containsKey('city') == true
                  ? doc["city"]
                  : "not available",
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
              "id":
                  data.containsKey('id') == true ? doc["id"] : "not available",
              "priority": data.containsKey('priority') == true
                  ? doc["priority"]
                  : "not available",
              //"leadRefId": doc["leadRefId"],
              "leadRefId": data.containsKey('leadRefId') == true
                  ? doc["leadRefId"]
                  : "0",
              "remarks": doc["remarks"],
              "stage": doc["stage"],
              "ticket": data.containsKey('ticket') == true
                  ? doc["ticket"]
                  : "not available",
              "product": product,
              "capacity": capacity,
              "purFrom": purFrom,
              "serial": serial
            });
          } else if (FFAppState().zone == "ALL") {
            leadDocs.add({
              "username": doc["username"],
              "mobile": doc["mobile"],
              "status": doc["status"],
              "area": doc["area"],
              "city": data.containsKey('city') == true
                  ? doc["city"]
                  : "not available",
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
              "id":
                  data.containsKey('id') == true ? doc["id"] : "not available",
              "priority": data.containsKey('priority') == true
                  ? doc["priority"]
                  : "not available",
              //"leadRefId": doc["leadRefId"],
              "leadRefId": data.containsKey('leadRefId') == true
                  ? doc["leadRefId"]
                  : "0",
              "remarks": doc["remarks"],
              "stage": doc["stage"],
              "ticket": data.containsKey('ticket') == true
                  ? doc["ticket"]
                  : "not available",
              "product": product,
              "capacity": capacity,
              "purFrom": purFrom,
              "serial": serial
            });
          }
        } else {
          leadDocs.add({
            "username": doc["username"],
            "mobile": doc["mobile"],
            "status": doc["status"],
            "area": doc["area"],
            "city": data.containsKey('city') == true
                ? doc["city"]
                : "not available",
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
            //"leadRefId": doc["leadRefId"],
            "leadRefId":
                data.containsKey('leadRefId') == true ? doc["leadRefId"] : "0",
            "remarks": doc["remarks"],
            "stage": doc["stage"],
            "ticket": data.containsKey('ticket') == true
                ? doc["ticket"]
                : "not available",
            "product": product,
            "capacity": capacity,
            "purFrom": purFrom,
            "serial": serial
          });
        }

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
          //"leadRefId": doc["leadRefId"],
          "leadRefId":
              data.containsKey('leadRefId') == true ? doc["leadRefId"] : "0",
          "remarks": doc["remarks"],
          "stage": doc["stage"],
          "ticket": data.containsKey('ticket') == true
              ? doc["ticket"]
              : "not available",
          "product": product,
          "capacity": capacity,
          "purFrom": purFrom,
          "serial": serial
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
          totalLost = totalLost + 1;
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
      "facebook": countFacebook,
      "quicklead": countQuickLead,
      "total": countIndiamart + countJustDail + countFacebook + countQuickLead
    });
    FFAppState().lostLeadCount.add({
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "facebook": countFacebook,
      "quicklead": countQuickLead,
      "total": countIndiamart + countJustDail + countFacebook + countQuickLead
    });
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
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        // print("***");
        // print(doc["mobile"]);
        // print(doc["updatedDate"]);

        // print("-------");
        if (data.containsKey('customFields')) {
          Map<String, dynamic> customFields = data['customFields'];
          product = customFields['productType'];
          capacity = customFields['capacity'];
          serial = customFields['serial'];
          purFrom = customFields['purchasedFrom'];
        } else {
          product = "not available";
          capacity = "not available";
          serial = "not available";
          purFrom = "not available";
        }
        var zone =
            data.containsKey('zone') == true ? doc["zone"] : "not available";

        if (FFAppState().billingType == "CRM") {
          if (FFAppState().zone == zone) {
            leadDocs.add({
              "username": doc["username"],
              "mobile": doc["mobile"],
              "status": doc["status"],
              "area": doc["area"],
              "city": data.containsKey('city') == true
                  ? doc["city"]
                  : "not available",
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
              "updatedDate": data.containsKey('updatedDate') == true
                  ? doc["updatedDate"]
                  : 0,
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
              "id":
                  data.containsKey('id') == true ? doc["id"] : "not available",
              "priority": data.containsKey('priority') == true
                  ? doc["priority"]
                  : "not available",
              //  "leadRefId": doc["leadRefId"],
              "leadRefId": data.containsKey('leadRefId') == true
                  ? doc["leadRefId"]
                  : "0",
              "remarks": doc["remarks"],
              "stage": doc["stage"],
              "ticket": data.containsKey('ticket') == true
                  ? doc["ticket"]
                  : "not available",
              "product": product,
              "capacity": capacity,
              "purFrom": purFrom,
              "serial": serial
            });
          } else if (FFAppState().zone == "ALL") {
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

              "ticket": data.containsKey('ticket') == true
                  ? doc["ticket"]
                  : "not available",
              "product": product,
              "capacity": capacity,
              "purFrom": purFrom,
              "serial": serial
            });
          }
        } else {
          leadDocs.add({
            "username": doc["username"],
            "mobile": doc["mobile"],
            "status": doc["status"],
            "area": doc["area"],
            "city": data.containsKey('city') == true
                ? doc["city"]
                : "not available",
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
            "updatedDate": data.containsKey('updatedDate') == true
                ? doc["updatedDate"]
                : 0,
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
            //  "leadRefId": doc["leadRefId"],
            "leadRefId":
                data.containsKey('leadRefId') == true ? doc["leadRefId"] : "0",
            "remarks": doc["remarks"],
            "stage": doc["stage"],
            "ticket": data.containsKey('ticket') == true
                ? doc["ticket"]
                : "not available",
            "product": product,
            "capacity": capacity,
            "purFrom": purFrom,
            "serial": serial
          });
        }
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
          totalLost = totalLost + 1;
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
      "totalLost": totalLost,
      "indiamart": countIndiamart,
      "justdail": countJustDail,
      "quicklead": countQuickLead,
      "facebook": countFacebook,
      "total": countIndiamart + countJustDail + countQuickLead + countFacebook
    });

    // print(leadDocs);
  }
  FFAppState().TotalLostLeads = totalLost;
  return leadDocs;
}
