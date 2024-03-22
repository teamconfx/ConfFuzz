## [HADOOP-18821] LdapGroupsMapping crashes with NullPointerException while going up the group hierarchy 

### Description of PR

When `hadoop.security.group.mapping.ldap.search.group.hierarchy.levels` is a positive integer, `org.apache.hadoop.security.LdapGroupsMapping#goUpGroupHierarchy` attempts to access the next group result without checking if the groupResults is empty.

To reproduce:
1. set `hadoop.security.group.mapping.ldap.search.group.hierarchy.levels` to 1
2. run `mvn surefire:test -Dtest=org.apache.hadoop.security.TestLdapGroupsMapping#testGetGroupsWithConnectionClosed`


This PR provides a fix by checking the groupResults is not Null before it is accessed, similar to what's done in `org.apache.hadoop.security.LdapGroupsMapping#lookupGroup`

### How was this patch tested?

Unit test

### For code changes:

- [x] Does the title or this PR starts with the corresponding JIRA issue id (e.g. 'HADOOP-17799. Your PR title ...')?
- [ ] Object storage: have the integration tests been executed and the endpoint declared according to the connector-specific documentation?
- [ ] If adding new dependencies to the code, are these dependencies licensed in a way that is compatible for inclusion under ASF 2.0?
- [ ] If applicable, have you updated the LICENSE, LICENSE-binary, NOTICE-binary files?

