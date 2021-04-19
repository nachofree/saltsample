apache2:
  pkg.installed

{% for vhost in pillar['vhosts'] %}
add_{{ vhost }}:
  file.append:
    - name: /etc/apache2/sites-enabled/{{ vhost }}
    - text: | 
       <VirtualHost *:80>
        DocumentRoot /var/www/html/{{ vhost }}
        ServerName {{ vhost }}.example.com
       </VirtualHost>
{% endfor %}

{% for vhost in pillar['vhosts'] %}
add_doc_root_for_{{ vhost }}:
  file.managed:
    - name: /var/www/html/{{ vhost }}/index.html
    - source: salt://webtemplate
    - template: jinja
    - makedirs: True
    - context:
      vhost: {{ vhost }}
{% endfor %}
