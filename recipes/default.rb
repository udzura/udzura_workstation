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

file "#{node['sprout']['home']}/.tmux.conf" do
  mode "0644"
  owner node['current_user']
  action :create, :update
end

## Pow

brew "pow"
