
#!/bin/bash
echo test script

echo ${username=`whoami`}
echo `whoami`

# package="python3-minimal"
package="exfat-util"

status=`dpkg -s $package > 2>&1` # | grep Status`

# dpkg -s $package1 >/dev/null 2>&1 || echo "$package1 not installed"
# dpkg -s $package2 | grep Status

echo $status
