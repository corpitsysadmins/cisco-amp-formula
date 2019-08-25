{% from "./cisco_amp.map" import cisco_amp_map with context %}

{% if cisco_amp_map.use is defined %}

{% if cisco_amp_map.use | to_bool %}

cisco_amp_connector_installation:
  pkg.installed:
    - name: {{ cisco_amp_map.package_name }}
{% if cisco_amp_map.package_file is defined %}
    - sources:
      - {{ cisco_amp_map.package_name }}: {{ cisco_amp_map.package_file }}
{% endif %}

cisco_amp_service_running:  
  service.running:
    - name: {{ cisco_amp_map.service_name }}
    - enable: True
    - require:
      - cisco_amp_connector_installation
    - watch:
      - cisco_amp_connector_installation

{% else %}

cisco_amp_service_stopped:  
  service.dead:
    - name: {{ cisco_amp_map.service_name }}
    - enable: False

cisco_amp_connector_removal:
  pkg.removed:
    - name: {{ cisco_amp_map.package_name }}
    - require:
      - cisco_amp_service_stopped

{% endif %}

{% endif %}