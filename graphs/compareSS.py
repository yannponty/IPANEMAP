

def parseSS(s):
    res = []
    p = []
    n = len(s)
    for i,c in enumerate(s):
        if c =="(":
            p.append(i)
        elif c ==")":
            j = p.pop()
            res.append((j,i))
    return res,n


def compareSS(s,s_base):
    (struct,n) = parseSS(s)
    (base,n) = parseSS(s_base)
    base = set(base)
    res = ["." for i in range(n)]
    for i in range(n):
        c = s[i]
        if c == ".":
            if s_base[i] != ".":
                res[i] = "\\B{.}"
            else:
                res[i] = "\\G{.}"
    for i,j in struct:
        if (i,j) not in base:
            res[i],res[j] = "\\B{(}","\\B{)}"
        else:
            res[i],res[j] = "\\G{(}","\\G{)}"
    return "".join(res)

NATIVE_STRUCT=("NATIVE","((((((((......((((((....)))))).(((....(((.....)))...)))........))))))))........(((((......(((((.....))))).(((....(((....((((....)))).....)))...))).......)))))")
NO_PROBING_STRUCT=("No probing","(((((((((((((((((.(((((...(......)...))))))))))))))............))))))))........(((((........((((...))).....((...((((....((((....)))).....))))..))).......)))))")
CMCT_STRUCT=("CMCT","((((((((......((((((....)))))).((((((((......)))))..)))........))))))))(..(..((((...(((((.((((((...))))))...............((((....)))).....)))))))))....)..)....")
DMS_CMCT_STRUCT=("DMS+CMCT","((((((((......((((((....)))))).((((((((......)))))..)))........)))))))).......((....(((((.((((((...))))))...............((((....)))).....))))).)).............")
DMS_CMCT_NMIA_STRUCT=("DMS+CMCT+NMIA","((((((((......((((((....)))))).((((((((......)))))..)))........))))))))........(((((......((((((...)))))).(((...((((....((((....)))).....))))..))).......)))))")

OTHERS = [NO_PROBING_STRUCT,CMCT_STRUCT,DMS_CMCT_STRUCT,DMS_CMCT_NMIA_STRUCT]


if __name__=="__main__":
    lbase,base = NATIVE_STRUCT
    print "%s & {\\tt\\Base{%s}}\\\\"%(lbase,base)
    for l,s in OTHERS:
        print "%s & {\\tt%s}\\\\"%(l,compareSS(s,base))
