{% from "elasticsearch/conf/map.jinja" import elasticsearch_settings with context %}

base:
  pkgrepo.managed:
    - humanname: Elasticsearch PPA
    - name: deb http://packages.elastic.co/elasticsearch/2.x/debian stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch-2.x.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: elasticsearch-pkg

elasticsearch-pkg:
  pkg.installed:
    - names:
      - elasticsearch
      - openjdk-7-jdk
  {% if 'version' in elasticsearch_settings %}
    - version: {{ elasticsearch_settings.version }}
  {% endif %}
