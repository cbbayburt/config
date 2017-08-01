python-pip:
    pkg.installed

git:
    pkg.installed

vim:
    pkg.installed

vundle:
    git.latest:
        - name: https://github.com/VundleVim/Vundle.vim.git
        - target: /root/.vim/bundle/Vundle.vim
        - require:
            - pkg: git

vimrc:
    file.managed:
        - name: /root/.vimrc
        - user: root
        - group: root
        - mode: 644
        - source: salt://vim/files/vimrc
        - backup: minion
        - require:
            - pkg: vim

flake8:
    pip.installed:
        - require:
            - pkg: python-pip

install_plugins:
    cmd.run:
        - name: "vim +PluginClean! +PluginInstall +qall"
        - user: root
        - require:
            - git: vundle
            - file: vimrc
