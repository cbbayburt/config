# python-pip:
#     pkg.installed

git-for-vim:
    pkg.installed:
      - name: git-core

vim:
    pkg.installed

vundle:
    git.latest:
        - name: https://github.com/VundleVim/Vundle.vim.git
        - target: /root/.vim/bundle/Vundle.vim
        - require:
            - pkg: git-for-vim

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

# flake8:
#     pip.installed:
#         - require:
#             - pkg: python-pip

install_plugins:
    cmd.run:
        - name: "vim +PluginClean! +PluginInstall +qall"
        - user: root
        - require:
            - git: vundle
            - file: vimrc

vim-data:
    pkg.installed
