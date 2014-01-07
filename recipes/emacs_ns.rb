#
# Cookbook Name:: udzura_workstation
# Recipe:: emacs_ns
#
# Copyright 2014 - , Uchio KONDO
#
# All rights reserved - see README
#

# refs http://qiita.com/udzura/items/0a18f4b711cd8b883401

%w(git wget xz autoconf automake).each do |pkg|
  brew pkg
end

bash 'install emacs with ns patch' do
  user "root"
  cwd "/tmp"
  command <<-EOB
    wget http://ftp.gnu.org/pub/gnu/emacs/emacs-24.3.tar.xz;
    tar xvf emacs-24.3.tar.xz;
    cd emacs-24.3
    wget http://svn.sourceforge.jp/svnroot/macemacsjp/inline_patch/trunk/emacs-inline.patch
    patch -p0 < ../emacs-inline.patch
    ./configure --with-ns --without-x && make -j4 && make install
    cp -r nextstep/Emacs.app /Applications
    cd ../
    rm -rf emacs-24.3*
  EOB

  creates "/Applications/Emacs.app"
end

bash 'checkout emacs conf' do
  user node['current_user']
  cwd node['sprout']['home']
  command <<-EOB
    git clone https://github.com/udzura/dumped.emacs.d.git .emacs.d
  EOB

  creates "#{node['sprout']['home']}/.emacs.d"
end
