import matplotlib
import matplotlib.pyplot as plt
import matplotlib as mp
import matplotlib.cm as cm
import matplotlib.patches as mpatches
from matplotlib.pyplot import colorbar
#lista contains base pairs with their occurence x:b1,yb:2,z:number of time this base pair was detected

def ListBasePairsFromStruct(Struct):  # return dic={structure:[liste de pairs de base ],....}
    lista = []
    stack = []
    for i in range(len(Struct)):  # sequence length
        if Struct[i] == '(':  # Opening base pair
            stack.append(i)
        elif Struct[i] == ')':  # Closing base pair
            k = stack.pop()
            lista.append((k, i))
    return lista

def Compare_structures(s1,s2):
        lista=[]
	lista2=[]
        BP1=ListBasePairsFromStruct(s1)
	BP2=ListBasePairsFromStruct(s2)
	commonElements=list(set(BP1)&set(BP2))
	for elem in BP1:
		if elem not in commonElements:
			lista.append((elem[0],elem[1],0.69))
		else:
			lista.append((elem[0],elem[1],0.05))
	for elem in BP2:
		if elem not in commonElements:
			lista2.append((elem[0],elem[1],0.45))
		else:
			lista2.append((elem[0],elem[1],0.05))
	#print "lis1",lista,"list2",lista2
	return lista,lista2

def plotsecodnarystructures(rnaString, lista, lista2, n, reactivities):
    fig = plt.figure()
    fg, ax = plt.subplots(1, 1)
    
    # for color map:
    min_val = 0
    max_val = 1
    #
    my_cmap =cm.get_cmap('Set2')#('PiYG')#cm.get_cmap('Greys')
    norm = matplotlib.colors.Normalize(min_val, max_val)  #
    x = [elem[0] for elem in lista]
    y = [elem[1] for elem in lista]
    z = [elem[2] / float(n) for elem in lista]

    x2 = [elem[0] for elem in lista2]
    y2 = [elem[1] for elem in lista2]
    z2 = [elem[2] / float(n) for elem in lista2]
    #print "native",x,"gggg",x2
    rna = list(rnaString)
    #print "Test",(x,y,z,x2,y2,z2),rna
    cc = ["black" for i in range(len(rna))]
    for elem in range(len(rna)):
        if float(reactivities[elem]) < 0.2:
            cc[elem] = "gray"#"black"  # "#00509d"#blue
        if float(reactivities[elem]) >= 0.2 and float(reactivities[elem]) < 0.4:
            cc[elem] = "gray"  # "#00c200"#green
        if float(reactivities[elem]) >= 0.4 and float(reactivities[elem]) < 0.7:
            cc[elem] ="gray"#"mediumvioletred"  # "#f28f00"#yellow
        if float(reactivities[elem]) >= 0.7:
            cc[elem] ="gray"# "plum"  # "#f20000"#red

    p0 = mpatches.Rectangle((0, 0), 1, 1, fc="black")
    p1 = mpatches.Rectangle((0, 0), 1, 1, fc="gray")
    p2 = mpatches.Rectangle((0, 0), 1, 1, fc="mediumvioletred")
    p3 = mpatches.Rectangle((0, 0), 1, 1, fc="plum")
    # To add legend 
    #ax.legend([p0, p1, p2, p3], ["Reactivity <0.2", "0.2< <0.4", "0.4<  <0.7", ">0.7"])
    
    pac1 = [mpatches.Arc([x[i] + 0.5 + (y[i] - x[i] - 1) / float(2), 0], y[i] - x[i] - 1, (y[i] - x[i] - 1) / float(2),
                        angle=0, theta1=0, theta2=180, color=my_cmap(norm(z[i])), linewidth=.6) for i in
           range(len(x))]  # linestyle='dotted', linestyle='dashed
    
    pac2 = [mpatches.Arc([x2[i] + 0.5 + (y2[i] - x2[i] - 1) / float(2), 0], y2[i] - x2[i] - 1, (y2[i] - x2[i] - 1) / float(2),
                        angle=0, theta1=180, theta2=360, color=my_cmap(norm(z2[i])), linewidth=.6) for i in
           range(len(x2))]  
    #########This one does not work
    '''
    for arc1, arc2 in zip(pac1, pac2):
        ax.add_patch(arc1)
        ax.add_patch(arc2)
    '''
    for  arc2 in pac2:
        ax.add_patch(arc2)
    for arc1 in pac1:
        ax.add_patch(arc1)
    cmmapable = cm.ScalarMappable(norm, my_cmap)
    cmmapable.set_array(range(min_val, max_val))
    # to draw color bar
    #colorbar(cmmapable, fraction=0.046, pad=0.04, ticks=[0, 0.5, 1])
 
    fontProp = mp.font_manager.FontProperties(family="monospace", style="normal", weight="bold", size="4")
    ax.axis([-20, max(x) + 40, -max(y) / 3.5, max(y) / 3.5])
    for i in range(len(rna)):

        nuc = rna[i]
        # size of nuc circles=0.2
        ax.add_patch(
            mpatches.Circle((i + 0.5, 0), 0.2, color=cc[i], edgecolor="black"))  # circle at center (x,y), radius 0.5
        ax.annotate(nuc, (i + 0.5, 0), color='white', weight='bold', fontsize=0.5, ha='center', va='center')
        #To write below circles: 
        #ax.annotate(i + 1, (i + 0.5, -1), color='black', weight='bold', fontsize=6, ha='center', va='center')
    ax.set_aspect("equal")
    ax.get_yaxis().set_visible(False)
    ax.get_xaxis().set_visible(False)
    #fg.canvas.draw()
    # to add title
    #ax.set_title('Combined optimal centroids ')

    #plt.show()
    plt.savefig("Arcs.eps", format='eps', dpi=1000)
    #fig.savefig('Arcs_structures.svg')
if __name__=='__main__':
	rna="GGUUGGGUUGGGAAGUAUCAUGGCUAAUCACCAUGAUGCAAUCGGGUUGAACACUUAAUUGGGUUAAAACGGUGGGGGACGAUCCCGUAACAUCCGUCCUAACGGCGACAGACUGCACGGCCCUGCCUCUUAGGUGUGUUCAAUGAACAGUCGUUCCGAAAGGAAGCAUCCGGUAUCCCAAGACAAUC"
	native="(((((..(((((..(((((((((.......)))))))))..((((.(((.((((......(((((...((((..(((......))).......))))((....)).............))))).(((.....))))))).)))..........((((....))))....))))...)))))..)))))"
	s865="(((((..((((((.(((((((((.......))))))))).((((((((((((((......((((....((((...((.......)).......))))......(.(........)..).)))).(((.....)))))))))))..........((((....))))...)))))).))))))..)))))"
	Nai="(((((..((((((.(((((((((.......))))))))).((((((((((((((....(((((.......(((((((.......((((..((((.(((((...)).))).)).)).))))))))))).)))))..))))))))).........((((....))))....))))).))))))..)))))"
	Reactivity_1M73ILUMg=[-4,-4,5.601734,-2.586001,3.584683,2.243828,5.174679,0.201056,1.022389,0.95911,0.567532,0.004592,0.064794,1.485932,-0.084233,0.493946,0.424069,0.174529,0.396517,0.596246,0.317509,-0.062675,0.108898,0.531964,0.00227,0.132537,0.114561,0.199827,0.029505,1.299353,0.021203,0.790485,0.031873,0.010059,-0.016755,0.011386,0.003921,1.538503,0.266612,1.672623,0.111529,0.734287,0.378767,0.142445,0.640108,0.126263,0.025562,0.056945,0.305203,0.217924,0.016423,0.36294,0.011295,0.510859,0.003913,-0.3069,0.157164,0.072953,0.152624,0.405007,-0.02284,-0.067991,0.040642,0.006997,0.351946,0.146162,1.365301,0.013211,0.029309,0.632258,0.252172,0.100618,0.331956,0.78618,0.291435,0.069416,0.524612,0.911447,0.045747,1.855417,0.008128,1.745184,0.723007,0.20564,0.110308,0.021038,0.322471,-0.009071,0.087076,-0.17434,1.916569,3.668705,0.642325,1.083812,0.664923,2.666472,0.04948,0.753907,0.425819,0.188509,0.25788,1.267616,1.020632,0.012683,0.67223,0.23216,0.857602,1.143984,0.529363,1.506012,-0.160338,0.00785,0.088049,0.190688,0.09577,1.632675,0.33866,1.858651,0.393357,-0.07014,0.219598,0.407081,0.049487,0.090401,0.814592,0.003499,0.311062,3.516925,11.021384,2.011042,3.402116,0.406704,0.329257,0.064922,0.248982,0.004766,0.004509,0.10938,0.030576,0.011446,0.935358,0.247406,0.678179,1.076845,2.809286,0.203846,0.051817,0.350272,0.107397,0.332718,0.358514,1.530081,0.875405,0.313271,0.641526,0.381021,0.169967,0.116159,0.039775,0.037513,0.304675,0.867208,1.441346,0.102541,0.019944,0.996759,-0.030976,-0.017795,0.053273,0.16683,0.11361,0.154042,-0.522147,0.037279,-0.217796,-0.090107,0.464154,0.102059,0.79556,-0.249216,-1.322329,-0.30264,-0.094775,-2.261774,-0.212819,-1.066334,-1.69762,-4]
	plotsecodnarystructures(rna, Compare_structures(native,s865)[0],Compare_structures(native,s865)[1], 1, Reactivity_1M73ILUMg)

