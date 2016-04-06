#
# Cookbook Name:: mailhog
# Recipe:: default
#
# Copyright (c) 2015 Sergey Storchay, All Rights Reserved.
# Copyright (c) 2016 Achim Rosenhagen, All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

default['mailhog']['binary']['version']                               = '0.2.0'
default['mailhog']['binary']['url']                                   = nil # Set it to override automatical generation
default['mailhog']['binary']['mode']                                  = 0755
default['mailhog']['binary']['path']                                  = '/usr/local/bin/MailHog'
default['mailhog']['binary']['prefix_url']                            = 'https://github.com/mailhog/MailHog/releases/download/v'
default['mailhog']['binary']['checksum']['linux_386']                 = '06fc1d7bf2fced86962ab274d8f1e6c7df74a6ec3c6310aff26792bb93122d98'
default['mailhog']['binary']['checksum']['linux_amd64']               = '11aaae19388d0a6543c935188fcc4157772d852c10be2a5d96168ee23ae6845f'

default['mailhog']['config']['MH_CORS_ORIGIN']                        = nil
default['mailhog']['config']['MH_HOSTNAME']                           = 'mailhog.example'
default['mailhog']['config']['MH_API_BIND_ADDR']                      = '0.0.0.0:8025'
default['mailhog']['config']['MH_UI_BIND_ADDR']                       = '0.0.0.0:8025'
default['mailhog']['config']['MH_MAILDIR_PATH']                       = nil
default['mailhog']['config']['MH_MONGO_COLLECTION']                   = 'messages'
default['mailhog']['config']['MH_MONGO_DB']                           = 'mailhog'
default['mailhog']['config']['MH_MONGO_URI']                          = '127.0.0.1:27017'
default['mailhog']['config']['MH_SMTP_BIND_ADDR']                     = '0.0.0.0:1025'
default['mailhog']['config']['MH_STORAGE']                            = 'memory'
default['mailhog']['config']['MH_OUTGOING_SMTP']                      = nil
default['mailhog']['config']['MH_UI_WEB_PATH']                        = nil

default['mailhog']['mhsendmail']['binary']['version']                 = '0.2.0'
default['mailhog']['mhsendmail']['binary']['url']                     = nil # Set it to override automatical generation
default['mailhog']['mhsendmail']['binary']['mode']                    = 0755
default['mailhog']['mhsendmail']['binary']['path']                    = '/usr/local/bin/mhsendmail'
default['mailhog']['mhsendmail']['binary']['prefix_url']              = 'https://github.com/mailhog/mhsendmail/releases/download/v'
default['mailhog']['mhsendmail']['binary']['checksum']['linux_386']   = '7052887469713631699898d020c6f3181eb96af4e9efde050636dd1540b418f8'
default['mailhog']['mhsendmail']['binary']['checksum']['linux_amd64'] = 'be5acdc8ce3f380dcb9d02caed77c845affa9a447d0860961529b699dcd0c613'
