"""Side and top views of the exported meshes; requires NumPy and Matplotlib."""
from pathlib import Path
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
root=Path(__file__).resolve().parent
dtype=np.dtype([('n','<f4',(3,)),('v','<f4',(3,3)),('a','<u2')])
def view(ax,name,plane,title):
    v=np.frombuffer((root/(name+'.stl')).read_bytes(),dtype=dtype,offset=84)['v'].astype(float)
    a,b,depth={'top':(0,1,2),'side':(1,2,0),'front':(0,2,1)}[plane]
    n=np.cross(v[:,1]-v[:,0],v[:,2]-v[:,0]); keep=np.abs(n[:,depth])>1e-8
    tri=v[keep]; d=tri[:,:,depth].mean(axis=1); order=np.argsort(d if plane=='top' else -d)
    shade=plt.get_cmap('Oranges')(0.25+0.6*(d[order]-d.min())/max(np.ptp(d),1e-9))
    ax.add_collection(PolyCollection(tri[order][:,:,[a,b]],facecolors=shade,edgecolors='none',antialiased=False))
    ax.autoscale();ax.margins(.06);ax.set_aspect('equal');ax.set_title(title,fontsize=10)
    ax.set_xlabel('mm');ax.set_ylabel('mm');ax.set_facecolor('#f3f5f7')
fig,axes=plt.subplots(1,3,figsize=(13,5.2),layout='constrained',gridspec_kw={'width_ratios':[1.1,1.7,0.7]})
view(axes[0],'pouch','side','Pouch side view (hook on right = back)')
view(axes[1],'pouch','top','Pouch top view, as printed')
view(axes[2],'hook_test','top','Hook test, printed flat')
fig.suptitle('Seed holder v0.1 — exported STLs',fontsize=14)
fig.savefig(root/'preview.png',dpi=120)
