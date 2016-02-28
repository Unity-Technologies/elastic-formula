{% from "elasticsearch/conf/map.jinja" import elasticsearch_settings with context %}

include:
  - elasticsearch

elastic-conf:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticsearch/conf/elasticsearch.jinja
    - template: jinja

data-path:
  file.directory:
    - name: {{ elasticsearch_settings.data_path }}
    - makedirs: True


log-path:
  file.directory:
    - name: {{ elasticsearch_settings.log_path }}
    - makedirs: True

elasticsearch-service:
  service.running:
    - name: elasticsearch
    - enable: True
    - watch:
      - file: elastic-conf
    - require:
      - pkg: elasticsearch