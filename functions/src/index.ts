import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp({
  ...functions.config().firebase,
  databaseURL: "https://inventory-manager-6401a-default-rtdb.firebaseio.com/",
});

// On sign up.
exports.processSignUp = functions.auth.user().onCreate(async (user) => {
  const customClaims = {
    "https://hasura.io/jwt/claims": {
      "x-hasura-default-role": "user",
      "x-hasura-allowed-roles": ["user"],
      "x-hasura-user-id": user.uid,
    },
  };

  try {
    await admin.auth().setCustomUserClaims(user.uid, customClaims);
    // Update real-time database to notify client to force refresh.
    const metadataRef = admin.database().ref("metadata/" + user.uid);
    return await metadataRef.set({refreshTime: new Date().getTime()});
  } catch (error) {
    console.log(error);
  }
});
