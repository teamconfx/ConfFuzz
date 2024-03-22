## LdapGroupsMapping crashes with NullPointerException while going up the group hierarchy 

When `hadoop.security.group.mapping.ldap.search.group.hierarchy.levels` is a positive integer, `org.apache.hadoop.security.LdapGroupsMapping#goUpGroupHierarchy` attempts to access the next group result without checking if the groupResults is empty.

To reproduce:
1. set `hadoop.security.group.mapping.ldap.search.group.hierarchy.levels` to 1
2. run `mvn surefire:test -Dtest=org.apache.hadoop.security.TestLdapGroupsMapping#testGetGroupsWithConnectionClosed`


We link this issue to the PR that provides a fix by checking the groupResults is not Null before it is accessed, similar to what's done in `org.apache.hadoop.security.LdapGroupsMapping#lookupGroup`