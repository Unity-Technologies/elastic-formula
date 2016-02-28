{% from "logstash/conf/map.jinja" import logstash_settings with context %}

include:
  - logstash

{% if 'conf' in logstash_settings %}
{% for name, value in logstash_settings.conf.iteritems() %}
logstash-conf-{{name}}:
  file.managed:
    - name: /etc/logstash/conf.d/{{ name }}.conf
    - source: salt://logstash/conf/logstash.jinja
    - template: jinja
    - context: {{ value }}
{% endfor %}
{% endif %}

logstash-service:
  service.running:
    - name: logstash
    - enable: True
    - require:
      - pkg: logstash