var evtSource;
var interval;
var uuid = document.getElementById('app').getAttribute('uuid');
var context = document.getElementById('app').getAttribute('context');

function createInterval() {
   interval = setInterval(connect, 2000);
}

function clear() {
   clearInterval(interval);
}

function connect() {
   clear();

   evtSource = new EventSource('/s3pa/sse/' + uuid);

   evtSource.onopen = function () {
      // document.getElementById('status').innerHTML = '<p style="color: green">Connected</p>';
   }

   evtSource.addEventListener('update', function (message) {
      var json = JSON.parse(message.data);
      console.log(json);
      // var msg = document.getElementById('source').innerHTML;
      // document.getElementById('source').innerHTML = new Date().toLocaleString() + ' - Name: ' + json.name + ' - State: ' + json.state + ' - UUID: ' + json.uuid + '<br/>' + msg;
   });

   evtSource.onerror = function () {
      if (evtSource.readyState === 2) {
         // document.getElementById('status').innerHTML = '<p style="color: red">Disconnected</p>';
         createInterval();
      }
   };
}

connect();