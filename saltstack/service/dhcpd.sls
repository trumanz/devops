##### DHCP  service

{% macro dhcpd(conf) %}

{% set os_version =   grains['osfinger'] %}

{% if os_version == 'Ubuntu-14.04' %}

isc-dhcp-server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server
  service.running:
     - watch:
        - file: /etc/dhcp/dhcpd.conf

/etc/dhcp/dhcpd.conf:
    file.managed:
       - source:  {{ conf }}

{% else %}
dhcpd_error:
    report: 
        - error
        - name: "This state file might encounter error on other distribution"
{% endif %}

{% endmacro %}
