common_pkgs:
  pkg.installed:
    - pkgs:
      - build-essential
      - checkinstall
      - libreadline-gplv2-dev
      - libncursesw5-dev
      - libssl-dev
      - libsqlite3-dev
      - tk-dev
      - libgdbm-dev
      - libc6-dev
      - libbz2-dev
      - libffi-dev

python37_download:
  archive.extracted:
    - name: /opt
    - source: https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz
    - source_hash: f09d83c773b9cc72421abba2c317e4e6e05d919f9bcf34468e192b6a6c8e328d

python37_altinstall:
  cmd.run:
    - name: |
        cd /opt/Python-3.7.2
        ./configure
        make altinstall
    - require:
      - pkg: common_pkgs
      - archive: python37_download
    - unless: which python3.7
