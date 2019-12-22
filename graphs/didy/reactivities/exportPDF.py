import os,sys

for f in os.listdir("."):
    if f.lower().endswith(".svg"):
        outf = f.replace(".svg",".pdf").replace(".SVG",".pdf")
        os.system("inkscape -z --export-area-drawing --export-margin=5 --export-pdf=%s %s"%(outf,f))
