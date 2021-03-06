# This script was automatically generated from the dsa-089
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(14926);
 script_version("$Revision: 1.14 $");
 script_xref(name: "DSA", value: "089");
 script_bugtraq_id(2264);
 script_bugtraq_id(2932);
 script_bugtraq_id(2933);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-089 security update');
 script_set_attribute(attribute: 'description', value:
'The icecast-server (a streaming music server) package as distributed
in Debian GNU/Linux 2.2 has several security problems:
These have been fixed in version 1.3.10-1, and we strongly recommend
that you upgrade your icecast-server package immediately.

The i386 package mentioned in the DSA-089-1 advisory was incorrectly
compiled and will not run on Debian GNU/Linux potato machines. This
has been corrected in version 1.3.10-1.1.

');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2001/dsa-089');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2001/dsa-089
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA089] DSA-089-2 icecast-server");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_cve_id("CVE-2001-0197", "CVE-2001-0784", "CVE-2001-1083", "CVE-2001-1230");
 script_summary(english: "DSA-089-2 icecast-server");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'icecast-server', release: '2.2', reference: '1.3.10-1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
