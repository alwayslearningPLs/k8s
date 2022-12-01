#!/bin/bash
# More info: https://nfs.sourceforge.net/nfs-howto/ar01s03.html
# Possible options when defining ACL:
# ro: The directory is shared read only, default
# rw: read write access.
# no_root_squash: By default, any file request made by user root on the client
#   machine is treated as if it is made by user nobody on the server. Don't specify
#   this option unless you have a good reason for it.
# no_subtree_check: If only part of a volume is exported, a routine called subtree
#   checking verifies that a file that is requested from the client is in
#   the appropriate part of the volume. If the entire volume is exported,
#   disabling this check will speed up transfers.
# sync: By default, all the most recent version of the exportfs command will use
#   async behaviour, telling a client machine that a file write is complete when NFS
#   has finished handing the write over to the filesystem.
apt install --yes nfs-kernel-server

mkdir -p /mnt/nfs_share && \
  chown -R nobody:nogroup /mnt/nfs_share && \
  chmod 777 /mnt/nfs_share

echo "/mnt/nfs_share *(rw,fsid=0,insecure,no_root_squash,no_subtree_check)" >> /etc/exports

exportfs -a

systemctl restart nfs-kernel-server