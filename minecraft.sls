minecraftuser:
  user.present:
    - shell: /bin/bash
    - home: /home/minecraftuser
    - groups:
      - sudo

wget:
  pkg.installed

openjdk-8-jdk:
  pkg.installed

/opt/minecraft:
  file.directory:
    - user: root
    - group: root
    - mode: 755

get_file:
  file.managed:
    - name: /opt/minecraft/mc.jar
    - source: https://s3.amazonaws.com/Minecraft.Download/versions/1.11.2/minecraft_server.1.11.2.jar
    - mode: 0777
    - skip_verify: true

create_eula:
  file.managed:
    - name: /opt/minecraft/eula.txt
    - contents: 
      - eula=true
