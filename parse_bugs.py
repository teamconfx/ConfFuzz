import re
file = "parse.md"
with open(file) as f:
    bugs = {}
    for line in f:
        line = line.strip()
        if line=="":
            continue
        if line[0] == "#":
            bug_type = line[1:]
            continue
        line = line.split('|')
        proj = line[1].strip()
        if '.' not in line[2]:
            minConfig = line[3]
        else:
            minConfig = line[2]
        minConfig = re.sub(r'[^\.a-zA-Z0-9=,]', '', minConfig)
        print(bug_type, proj, minConfig)


