{% from "logstash/conf/map.jinja" import logstash_settings with context %}

openjdk-repo:
  pkgrepo.managed:
    - humanname: Logstash PPA
    - name: deb {{ logstash_settings.ppa_url }} {{ grains.oscodename }} main
    - file: /etc/apt/sources.list.d/openjdk.list
    - keyid: 86F44E2A
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: openjdk-8-jdk

openjdk-8-jdk:
  pkg.installed

logstash-pkg:
  pkg.installed:
    - sources:
      - logstash: {{ logstash_settings.url }}logstash-{{ logstash_settings.version }}.deb

/usr/bin/logstash:
  file.symlink:
    - target: /usr/share/logstash/bin/logstash