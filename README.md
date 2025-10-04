# docker-compose-playbooks

A personal repo of all the various custom-configured homelab services that include their entire environment as an AIO PnP solution.


## TODO:
[ ] A CTF hacking website that is riddled with honeypots that you must identify and navigate around to enter the deeper part of the network and capture the flag.
- If you hit or are otherwise caught by any of the honeypots, you will have to start all over. If you fail, the site will only tell you you failed, but it won't mention from where, how, why, etc you failed, which honeypot you triggered or saw your traffic. The site will not give you any help, clues, indications of where you 'messed up' so that you could improve and get further with your next try.
- There will be the templates for all of the different honeypots, as well as a set of networks, and the AI will generate the random networks, honeypots to use, all other necessary information like IP address, MACs, user/pass creds, ports, services, etc.
[ ] Build a docker-compose template.
[ ] Fill in the template everything from security hardening, healthchecks, etc
[ ] Setup script for
    [ ] vast.ai
    [ ] gothem on R610
    [ ] financial related
        [ ] fossbilling: Hosting and billing automation. Integrates with WHM, CWP, cPanel and HestiaCP. Full API and easily extensible. (my own vps hosting site)
        [ ] lago: Metering and usage-based billing. (between services like vast vs actual spending expenses)
        [ ] 