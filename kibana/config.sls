{% from "kibana/conf/map.jinja" import kibana_settings with context %}

include:
  - kibana

kibana-conf:
  file.managed:
    - name: /opt/kibana/config/kibana.yml
    - source: salt://kibana/conf/kibana.jinja
    - template: jinja

kibana-service:
  service.running:
    - name: kibana
    - enable: True
    - watch:
      - file: kibana-conf
    - require:
      - pkg: kibana