var deviceIdentifier = function() {

  var public = {
    getIdentifier: function(callback) {
      if(typeof callback !== "function") {
        return false;
      }
      if(device.platform.match(/^ios/gi)) {
        getIosVendorIdentifier().then(
          function(vendorUUID) {
            callback(vendorUUID);
          },
          function(deviceUUID) {
            callback(deviceUUID);
          }
        );
      } else {
        callback(getOtherDeviceIdentifier());
      }
    }
  };

  var getIosVendorIdentifier = function() {
    var dfd = $.Deferred();
    cordova.exec(
      function(vendorUUID) {
        dfd.resolve(vendorUUID);
      },
      function(errData) {
        dfd.reject(device.uuid);
      },
      "deviceIdentifier",
      "getVendorIdentifier",
      []
    );
    return dfd.promise();
  };

  var getOtherDeviceIdentifier = function() {
    return device.uuid;
  };

  return public;
}();

module.exports = deviceIdentifier;
