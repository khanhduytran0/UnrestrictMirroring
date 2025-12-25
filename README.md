# UnrestrictMirroring
Experimental tweak that enables using iPhone Mirroring and camera while unlocked, allowing you to run 2 apps simultaneously; and enables iOS 27's Device Hub remote control on iOS 18.0+

## Known issues with iPhone Mirroring
- Can't have keyboard focus on 2 apps at the same time; and trying to do so in SpringBoard will bug out
- Device will be locked upon connecting
- Locking a device while using iPhone Mirroring will cause device to enter locked state without keeping the mirrored screen unlocked
(ie the mirrored screen will malfunction, no longer launches new apps until unlock, no closing app animation).
- Spotlight can only display one at a time, so if you open Spotlight on the mirrored screen, it will close Spotlight on the device screen, and vice versa.

## TODO
- Fix issues
- Enable microphone while mirroring
- Enable Notification Center and Control Center while mirroring

## License
[MIT](./LICENSE)
