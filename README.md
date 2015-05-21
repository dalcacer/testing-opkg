Simple setup to test opkg and its fitness for a specific project.

Each operation is performed various times under changing network conditions.

# Usage

* `vagrant up`
* in gui
 * `opkg update`
 * `opkg install tc`
 * `wget https://raw.githubusercontent.com/dalcacer/testing-opkg/master/test-bandwidth.sh`
 * `wget https://raw.githubusercontent.com/dalcacer/testing-opkg/master/test-packageloss.sh`
