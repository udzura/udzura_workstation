#
# Cookbook Name:: udzura_workstation
# Recipe:: default
#
# Copyright 2013, Uchio KONDO
#
# All rights reserved - see README
#

# TODO: split 'em out in the future

## Dotfilez

cookbook_file "#{node['sprout']['home']}/.tmux.conf" do
  mode "0644"
  owner node['current_user']
  action :create
end

## Pow

brew "pow"

## Other brew toolz

brew "imlib2"
brew "exiftool"
