import os
import sys
import yaml
import shutil

PWD = os.getcwd()
VIM_BUNDLE = 'bundle'

GIT_CLONE_CMD = 'git clone '
GIT_PULL_CMD = 'git pull '

def fetch_yaml():
    yaml_file = open('plugins.yml')
    yaml_contents = yaml_file.read()
    return yaml.load(yaml_contents)['plugin-list']

def fetch_plugins(plugin_list):
    for key, value in plugin_list.iteritems():
        os.system("git submodule add {} bundle/{}".format(value, key))

def install():
    print 'Installing...'
    plugin_list = fetch_yaml()
    fetch_plugins(plugin_list)

install()
