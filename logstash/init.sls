{% from "logstash/conf/map.jinja" import logstash_settings with context %}

openjdk-7-jdk:
  pkg.installed

logstash-pkg:
  pkg.installed:
    - sources:
      - logstash: {{ logstash_settings.url }}logstash-{{ logstash_settings.version }}.deb
