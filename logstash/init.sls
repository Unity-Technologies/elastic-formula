{% from "logstash/conf/map.jinja" import logstash_settings with context %}

base:
  pkgrepo.managed:
    - humanname: Logstash PPA
    - name: deb http://packages.elastic.co/logstash/2.2/debian stable main
    - dist: stable
    - file: /etc/apt/sources.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: logstash-pkg

logstash-pkg:
  pkg.installed:
    - names:
      - logstash
      - openjdk-7-jdk
  {% if 'version' in logstash_settings %}
    - version: {{ logstash_settings.version }}
  {% endif %}
