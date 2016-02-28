{% from "kibana/conf/map.jinja" import kibana_settings with context %}

base:
  pkgrepo.managed:
    - humanname: Kibana PPA
    - name: deb http://packages.elastic.co/kibana/4.4/debian stable main
    - dist: stable
    - file: /etc/apt/sources.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: kibana-pkg

kibana-pkg:
  pkg.installed:
    - names:
      - kibana
      - openjdk-7-jdk
  {% if 'version' in kibana_settings %}
    - version: {{ kibana_settings.version }}
  {% endif %}
