#!/bin/bash

cp /san/projects/surma/s3 /sbin/s3
cp /san/projects/surma/s3_* /sbin
mv /sbin/poweroff{,_original}
cat << EOF > /sbin/poweroff
#!/bin/bash

/sbin/s3
EOF
chmod 0755 /sbin/poweroff
chmod 6755 /sbin/s3
