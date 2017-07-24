{% from "logstash/conf/map.jinja" import logstash_settings with context %}

python-software-properties:
  pkg.installed

oracle-ppa:
  pkgrepo.managed:
    - humanname: OpenJDK PPA repository
    - ppa: openjdk-r/ppa
    - file: /etc/apt/sources.list.d/openjdk.list
    - keyid: 86F44E2A
    - keyserver: keyserver.ubuntu.com
    - require:
      - pkg: python-software-properties
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