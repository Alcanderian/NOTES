sudo sshfs \
-o allow_other,direct_io,kernel_cache,follow_symlinks,IdentityFile=$id_rsa_file \
$username@$host:$remote_path $mountpoint
