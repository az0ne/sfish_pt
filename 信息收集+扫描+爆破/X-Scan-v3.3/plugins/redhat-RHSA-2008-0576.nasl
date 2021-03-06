
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(33579);
 script_version ("$Revision: 1.4 $");
 script_name(english: "RHSA-2008-0576: rdesktop");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2008-0576");
 script_set_attribute(attribute: "description", value: '
  Updated rdesktop packages that fix a security issues are now available for
  Red Hat Enterprise Linux 3.

  This update has been rated as having moderate security impact by the Red
  Hat Security Response Team.

  rdesktop is an open source client for Microsoft Windows NT Terminal Server
  and Microsoft Windows 2000 and 2003 Terminal Services, capable of natively
  using the Remote Desktop Protocol (RDP) to present the user\'s NT desktop.
  No additional server extensions are required.

  An integer underflow vulnerability was discovered in the rdesktop. If an
  attacker could convince a victim to connect to a malicious RDP server, the
  attacker could cause the victim\'s rdesktop to crash or, possibly, execute
  an arbitrary code. (CVE-2008-1801)

  Users of rdesktop should upgrade to these updated packages, which contain a
  backported patch to resolve this issue.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2008-0576.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2008-1801");
script_summary(english: "Check for the version of the rdesktop packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"rdesktop-1.2.0-3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
