git-core:
    pkg.installed

git_config:
    file.managed:
        - name: /root/.gitconfig
        - source: salt://git/files/gitconfig
        - user: root
        - group: root
        - mode: 644
        - template: jinja
        - require:
            - pkg: git-core

