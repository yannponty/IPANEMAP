

# The reference structure, potentially with pseudoknots indicated with brackets and parenthesis
REF_STRUCT = "((((((((......((((((....)))))).(((....(((.....)))...)))........))))))))........(((((......(((((.....))))).(((....(((....((((....)))).....)))...))).......)))))"
# The candidate structures (may also contain PKs)
ALT_STRUCTS = [
             "(((((((((((((((((.(((((...(......)...))))))))))))))............))))))))........(((((........((((...))).....((...((((....((((....)))).....))))..))).......)))))",
             "((((((((......((((((....)))))).((((((((......)))))..)))........))))))))(..(..((((...(((((.((((((...))))))...............((((....)))).....)))))))))....)..)....",
             "((((((((......((((((....)))))).((((((((......)))))..)))........)))))))).......((....(((((.((((((...))))))...............((((....)))).....))))).)).............","((((((((......((((((....)))))).((((((((......)))))..)))........))))))))........(((((......((((((...)))))).(((...((((....((((....)))).....))))..))).......)))))"
    ]

# Set of DISJOINT intervals -> Colors in the reference structure
COLORS = {
    # Format Interval (i,j) -> Color
      (0,7):"lightseagreen",
(14,19):"lightseagreen",
(24,29):"lightseagreen",
(31,33):"lightseagreen",
      (38,41):"americanrose",
(46,48):"americanrose",
      (52,54):"lightseagreen",
(63,70):"lightseagreen",
     (79,83):"lightsalmon",
(106,108):"lightsalmon",
(113,115):"lightsalmon",
 (90,92):"lightsalmon",
  (93,94):"lightseagreen",
(100,101):"lightseagreen",
(102,105):"lightsalmon",
    (120,123):"lightseagreen",
(128,131):"lightseagreen", 
 (137,139):"lightsalmon",
 (143,145):"lightsalmon",
(153,157):"lightsalmon",
    }

def parseSS(s):
    res = {i:-1 for i in range(len(s))}
    p = []
    pk = []
    for i,c in enumerate(s):
        if c=="(":
            p.append(i)
        elif c==")":
            j = p.pop()
            res[i]=j
            res[j]=i
        elif c=="[":
            pk.append(i)
        elif c=="]":
            j = pk.pop()
            res[i]=j
            res[j]=i    
    return res

refbps = parseSS(REF_STRUCT)
refFormatted = list(REF_STRUCT[:])
for (i,j) in COLORS:
    col = COLORS[(i,j)]
    refFormatted[i] = "{\\color{%s}"%(col)+REF_STRUCT[i]
    refFormatted[j] = REF_STRUCT[j]+"}"
print "".join(refFormatted),'\\\\'

for s in ALT_STRUCTS:
    sFormatted = list(s)
    bps = parseSS(s)
    for (i,j) in COLORS:
        col = COLORS[(i,j)]
        for x in range(i,j+1):
            if bps[x]==refbps[x]:
                sFormatted[x] = "{\\color{%s}"%(col)+s[x]+"}"
    print "".join(sFormatted),'\\\\'
    

