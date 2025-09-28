# Wi-Fi Probe Request Capture Lab
## Software and hardware needed for lab:
### Software:
    - []   airmon-ng & airodump-ng (both should be in the aircrack-ng suite)
    - [x]   Wireshark
    - [x]   Let's use a Kali VM since it'll already have aircrack-ng installed along with wireshark and anything else we might need

### Hardware:
    - [x]    Wi-Fi card with monitor/promiscuous mode

### Test devices:
    - [x]   1 test phone (safe to use main primary phone, and could test both randomized MACs and the physical MAC)
    - [x]   (Optional) Additional phones, laptops, etc that I could also experiment with.


## Instructions:

1.  Place wifi int into monitor mode
```sudo airmon-ng start wlan0```

2.  Capture traffic
```sudo tcpdump -i wlan0mon -w probes.pcap```
If I want to use wireshark's gui, type:
```wlan.fc.type_subtype == 0x04```

3.  Forget wifi on device, turn device wifi off and then on again, then give it a minute for the phone to scan for familiar ssid's (device should stay disconnected from home wifi). Additionally, I could also walk around the property to observe signal strength, frequency in probes transmitted, etc

4.  Compare:
    -   phone's mac addresses is stable, real mac vs randomized and changing frequently
    -   ssid parameter showing (looking for) specific ssids (home wifi; work ap; coffeeshop; etc) vs using a blank wildcard with fewer directed probes to specific ssids
    -   additional variables that could help fingerprint device itself:
        *   look at supported rates
        *   vendor IE fields

5.  See if I could establish an evil twin and have the phone autoconnect.
    1.  Analyze probe captures to see if there are any directed probes with actual SSIDs sent
    2.  Spin up a fake AP with hostapd or airbase-ng using one of those SSIDs (I believe Pineapple should already have a script that automates this)
    3.  Observe if phone or other older devices auto connect or not; also check if the autoconnect is enabled in phone.



## Advanced correlation techniques from chatgpt
1.  SSID Fingerprinting
    *   Even if MAC is randomized, the set of SSIDs a device leaks can be unique enough to identify it (like a “location social graph”).
    *   Example: Only you probe for {HomeNetwork, GymNet, CaféX}.

2.  Radiometric / RF Fingerprinting
    *   Every Wi-Fi chipset has tiny imperfections in its RF chain (clock skew, I/Q imbalance, phase noise).
    *   With sensitive enough hardware, an attacker can fingerprint the physical radio regardless of MAC or SSID.
    *   Papers: “Radio Frequency Fingerprinting” or “Unique Radio Signatures.”

3.  Timing & Behavioral Analysis
    *   Probe intervals, retry timing, supported rate sets, power-save patterns → devices often “walk” in predictable ways.
    *   Example: iPhones vs Samsungs send probes differently; sometimes even two iPhones differ by chipset batch.

4.  Cross-Layer Correlation
    *   If your randomized MAC later authenticates to a captive portal or DHCP with a real identifier (like hostname Johns-iPhone), the link can be made.
    *   Attackers can just watch for transitions between random MAC usage and real MAC usage.

5.  Location Correlation
    *   If the same “random MAC” keeps showing up at your home every night, even though it changes daily, that’s enough to infer the household identity.
    *   Pattern-of-life inference beats anonymity over time.

6.  Vendor-Specific IE Fields
    *   Some devices include proprietary Information Elements (IEs) in probe requests (e.g., Apple devices often include unique fields). Those leak fingerprints too.







