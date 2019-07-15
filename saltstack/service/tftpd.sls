##### TFTP service


{% macro tftpd(conf) %}

tftpd-hpa:
  pkg.installed:
    - pkgs:
      - tftpd-hpa
  service.running:
    - watch:
      - file: /etc/default/tftpd-hpa


/etc/default/tftpd-hpa:
    file.managed:
       - source:  {{ conf }}

{% endmacro %}
