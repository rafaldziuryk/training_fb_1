importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');

const firebaseConfig = {
  apiKey: "AIzaSyDjJgnK_uYmnrtKu-gIJiOyUoKgYzZethg",
  authDomain: "testtraining-61361.firebaseapp.com",
  projectId: "testtraining-61361",
  storageBucket: "testtraining-61361.appspot.com",
  messagingSenderId: "195021946956",
  appId: "1:195021946956:web:01fbd031c0f51a842b34e9",
  measurementId: "G-8TN3L2QNTH"
};
 firebase.initializeApp(firebaseConfig);
   const messaging = firebase.messaging();

   messaging.onBackgroundMessage(function(payload) {
     console.log('Received background message ', payload);

     const notificationTitle = payload.notification.title;
     const notificationOptions = {
       body: payload.notification.body,
     };

     self.registration.showNotification(notificationTitle,
       notificationOptions);
   });