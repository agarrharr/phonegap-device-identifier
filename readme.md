# phonegap-device-identifier Plugin

This phonegap plugin allows you to get a unique device identifier on iOS.

# Installation

Using the Phonegap CLI (with phonegap version 3+) run:

```bash
phonegap local plugin add https://github.com/aharris88/phonegap-device-identifier
```

## Example Usage

```js
var deviceUUID = device.uuid;
deviceIdentifier.getIdentifier(function(uuid) {
  deviceUUID = uuid;
});
```

## FAQ

Will this work with android?

Yes, the same code is still compatible with android, it's just not necessary unless you're publishing to android and iOS.

## Contributing

I believe that everything is working, but feel free to put in an issue  or to fork and make a pull request.
