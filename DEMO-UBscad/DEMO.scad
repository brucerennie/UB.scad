
//THIS IS WIP !!


include<ub.scad> 
/*[Hidden]*/
useVersion=21.325;//⇒ v.gd/ubaer
assert(Version>=useVersion,str("lib version ",Version," detected, install ",useVersion," ub.scad library‼ ⇒http://v.gd/ubaer"));
nozzle=.2;
bed=false;
vp=true;
vpr=[0,0,0];
vpt=show=="products"?[100,100]:[35,30];
vpd=show=="products"?1000:230;

/*[Demo]*/
show="Select Topic!";//[modifier,generator,helper,polygons,objects,products,functions]


/*[Hidden]*/
$textPos=[-2,-3];
objPos=[12];
color2=0;

T($textPos+[0,-6])Tz(-.1)Text(h=0,text=show,size=3,cy=-1);

module P(){
Pfeil(l=6,b=[1,2.5],shift=-0.5,center=[1,1]);    
}
module Txt(text,line=0){
Col(8)T($textPos+[0,line*1.3*1.5])text(str(text),size= 1.3,valign="top");    
}
module Cross(s=5,line=0.1){
   %Tz(.1)union(){
       square([line,s],true);
       square([s,line],true);
   }
    children();
}

if(show=="modifier")Anordnen(option=3,es=[20,15],c=undef,loop=false,center=false,inverse=true){

union(){//T moves
    square(2);T(objPos/2)P();T(objPos+[3])Tz(z=0)Color(color2) square(2);
    Txt("T(x=3)");
}
union(){//R rotates
    square([1,2]);T(objPos/2+[1])Pfeil([6,2],[1,2],d=3);T(objPos)R(x=0,y=0,z=-45) Color(color2)square([1,2]);
    Txt("R(z=-45)");    
}
union(){//M skews
    square([2,2]);T(objPos/2)P();T(objPos)M(skewyx=1)Color(color2) square([2,2]);
    Txt("M(skewyx=1)");     
}

union(){//Scale scales quadrants independently
    Cross()circle();T(objPos/2)P();T(objPos)Tz(-.01)Cross()Color(color2)Scale(v=[0.6,2,1,2],size=3) circle();
    Txt("Scale(v=[0.6,2,1,2])");     
}


union(){//Rund rounds (2D)
    MKlon(mx=1,my=1)square([1,3],true);T(objPos/2)P();T(objPos)Color(color2)Rund(0.5,0.75)MKlon(mx=1,my=1)square([1,3],true);
    Txt("Rund(.5,.75)");
}



union(){//Linear multiply linear
    square(1,true);T(objPos/2)P();T(objPos)Color(color2)Linear(e=3,es=2)square(1,true);
    Txt("Linear(3,2)"); 
}

union(){//Polar multiply polar
    square(1,true);T(objPos/2)P();T(objPos)Color(color2)Polar(5,1.5)square(1,true);
    Txt("Polar(5,1.5)"); 
}

union(){//Grid multiply as matrix
    square(1,true);T(objPos/2)P();T(objPos)Color(color2)Grid(2,1.5)square(1,true);
    Txt("Grid(2,1.5)"); 
}
union(){//HexGrid multiply as matrix with alternating Yoffset 
    circle(.5);T(objPos/2)P();T(objPos)Color(color2)HexGrid([5,2],1.25,center=false)circle(.5);
    Txt("HexGrid([5,2],1.25)"); 
}
union(){// Klon clones
    Cross()circle(1);T(objPos/2)P();T(objPos)Cross()Color(color2)Klon(tx=1.5)circle(1);
    Txt("Klon(tx=1.5)"); 
}
union(){// MKlon mirror clones
    Cross()circle(1,$fn=3);T(objPos/2)P();T(objPos)Cross()Color(color2)MKlon(1)circle(1,$fn=3);
    Txt("MKlon(tx=1)"); 
}

union(){// Row ensure same distance between Objects
    Row(cut=false,d=1,e=4,dist=.5,step=1)circle(d=$d);
    Txt("Row(e=4,dist=.5,step=1)"); 
}

union(){// Rand makes rand
    circle(1,$fn=6);T(objPos/2)P();T(objPos)Color(color2)Rand(.5)circle(1,$fn=6);
    Txt("Rand(.5)"); 
}



union(){// Halb cut half away
    Cross()circle(2);T(objPos/2)P();T(objPos)Cross()Color(color2)Halb(x=true,2D=true)circle(2);
    Txt("Halb(x=true)"); 
}


union(){//Drehpunkt move fulcrum
Cross()circle(1.5);T(objPos/2)P();T(objPos){
    
    Cross()Drehpunkt(rz=-45,x=2)Color(color2)circle(1.5);
    }
    Txt("Drehpunkt(rz=-45,x=2)");
}



}

if(show=="generator")Anordnen(option=3,es=[30,15],e=6,c=undef,loop=false,center=false,inverse=true,name="Generator"){
objPos=[4,4];
  
  
union(){ // around
  T(objPos)Rundrum(10,6,r=[2.5,4,1,0],help=0)rotate(30)circle(1,$fn=6);
  Txt("Rundrum()circle()"); 
}

union(){// linear extrude
    T(objPos)T(-3)R(-90)LinEx(8,1,grad=45,fn=36,$d=5,center=true)circle($r);
    T(objPos)T(5)R(90)LinEx(5,1,end=true,fn=36,center=true)circle(2);
    T(objPos)T(13)R(-90)LinEx(5,1,scale=1.5,end=true,twist=45,twistcap=true,fn=10,center=true)Stern(r1=1,r2=1.5);
    Txt("LinEx(8,1,grad=45,$d=5)circle($r)"); 
}

union(){// rotate extrude
    T(objPos)R(90)RotEx(cut=true)T(-3)circle(5);
    Txt("RotEx(cut=true)T(-3)circle(5)"); 
}

union(){// Twisted torus
    T(objPos)Ttorus(r=5)R(90)cylinder(.1,d1=2,d2=0,$fn=6);
    T(objPos+[10,0])Ttorus(r=2,r2=+0.5,pitch=6,twist=360,angle=720,scale=0.4)R(90)cylinder(.1,d1=2,d2=0,$fn=6);
    Txt("Ttorus()R(90)cylinder()"); 
}

union(){// linear extrude2
    T(objPos)R(-90)Tz(-5)LinEx2(2,1.3,twist=15,s=1,fs=1.02)circle(3,$fn=3);
    T(objPos+[10,0])R(-90)Tz(-5)LinEx2(1,1.0,twist=-15,s=1.1,fs=0.98)circle(3,$fn=6);
    Txt("LinEx2(2,1.3,twist=15)circle(3)"); 
}


union() { //Bezier
    T(objPos)Bezier(p0=[0,+5],p1=[10,+0],p2=[-9,+3],p3=[10,-5],messpunkt=3)R(90)cylinder(.1,d1=1,d2=0);
    Txt("Bezier()R(90)cylinder()"); 
}



union(){ // Bow
  T(objPos){
    T(-5){
      Cross();
      Bogen(l=2,messpunkt=5,grad=65);//circle(1,$fn=5);
      }
  T(4){
    Cross();
    Bogen(l1=3,l2=1,messpunkt=5,grad=-61,center=+0,2D=true,d=2);
    }
  }
  Txt("Bogen()"); 
}
union(){ // S-Bow
  T(objPos){
    T(-3)SBogen(l1=4,r1=4,r2=1.5,dist=3,messpunkt=5)circle(1);
    T(2)SBogen(l1=4,r1=4,r2=1.5,dist=3,messpunkt=5,2D=1.5);
    T(6)SBogen(l1=4,r1=4,r2=1.5,dist=3,messpunkt=5,extrude=4);
  }
  
  Txt("SBogen()circle()"); 
}
union(){//  torus
    T(objPos)Torus(dia=8,d=1.5)circle(d=$d);
    T(objPos+[10,0])rotate(-110)Torus(dia=8,d=2,grad=220,end=+1,gradEnd=90,trxEnd=-2,endRot=90/5,fn=60)Stern(5,1,.5);
    Txt("Torus(dia=8,d=1.5)circle(d=$d)"); 
}
union(){ // Bevel
  T(objPos)Bevel(5,on=true)cube(5);
  Txt("Bevel(5)(cube(5)"); 
}
union(){ // RStern
  T(objPos)RStern(e=3,r1=9,r2=3,rad1=2,rad2=4,messpunkt=5)circle(.5);
  Txt("RStern()circle()"); 
}

union(){ // Rundrum
  T(objPos)Rundrum(4,7,r=1)circle(.5);
  T(objPos+[9,0])Rundrum(3,7,r=1.5,eck=5,twist=90)square(1,true);
  Txt("Rundrum()circle()"); 
}

union(){ // Kextrude
  T(objPos)Kextrude(1.5,4,rad=0.75,grad=120)circle(.5,$fn=4);
  
  Txt("Kextrude()circle()"); 
}
union(){ // Ellipse
  T(objPos)Ellipse(2,4,fn=24)sphere(.5,$fn=12);
  Txt("Ellipse()sphere()"); 
}

union(){ // Kontakwinkel
  T(objPos)T(y=-5){
    R(-90)Kontaktwinkel(60,d=10,center=0,centerBase=1,inv=false)sphere(d=$d);
    T(4.3,0)Pivot(rot=60,messpunkt=6,active=[1,1,0,0,1]);
  }
  
  Txt("Kontaktwinkel(60,d=10)"); 
}


//Rundrum(x=+40,y=30,r=10,eck=4,twist=0,grad=0,spiel=0.005,fn=fn,n=$info) polygon  •• 
//RStern(help=$helpM)polygon ••
//Kextrude(help=$helpM) polygon  •• 
//LinEx(help=$helpM) polygon  ••
//LinEx2(bh=5,h=1,slices=10,s=1.00,ds=0.01,dh=0.7,fs=1,fh=1,twist=0,n=$info,fn=fn);
//RotEx(grad=360,fn=fn,center=false)polygon ••
//Elipse(x=2,y=2,z=0,fn=36)Object••"
//Ttorus(r=20,twist=360,angle=360,fn=fn)3D-Objekt ••
//Gewinde(help=$helpM)••"
//GewindeV3(dn=5,h=10,kern=0,p=1,w=0,profil=0,gh=0.56,g=1,n=$info,fn=36)••"
//Kontaktwinkel(winkel=60,d=d,center=true,2D=0,inv=false,n=$info) Objekt  ••"
//Bezier(p0=[+0,+10,0],p1=[15,-5,0],p2=[15,+5,0],p3=[0,-10,0],w=1,max=1.0,min=+0.0,fn=50,ex=0,pabs=false,messpunkt=5,n=$info) Objekt •••••"
//Laser3D(h=4,layer=10,var=0.002,n=$info,on=-1)3D-Objekt ••"
//Bogen(help=$helpM) opt Polygon   ••
//SBogen(help=$helpM) opt Polygon   ••
//Row(help=$helpM) opt. Objekt ••
//Anordnung(help=$helpM) Objekte ••
//Bevel(help=$helpM) 3D Objekt ••

}






if(show=="helper")union()//•••••••••• helper:   ••••••••••
Anordnen(es=[20,15],option=3,c=undef,loop=false,center=false){
    
    
union(){ // 3 axis Projection
    3Projection(1,cut=false)difference(){
    Tz(2)Prisma(2,3,4,x2=1.5,y2=2,x2d=.25,y2d=.5,c1=0,s=0,center=false);
    } 
    Txt("3Projection()");
}
   
 
union(){// Schnitt cuts objects in preview
    cube(2,true);T(objPos/2)P();T(objPos)Schnitt(true)cube(2,true);
    Txt("Schnitt()"); 
} 

union(){// Color colors (hui)
    square();T(objPos/2)P();T(objPos)Color(.5)square();
    Txt("Color(.5)"); 
}

union(){// Color colors (hui)
    T(-.75){square();T(1.5)square();T(1.5,1.5)square();T(0,1.5)square();}T(objPos/2)P();T(objPos)Color(.5){square();T(1.5)square();T(1.5,1.5)square();T(0,1.5)square();}
    Txt("Color(.5)"); 
}

union(){// Anorden arranges
    Cross(){square();circle();}T(objPos/2)P();T(objPos)Cross()Anordnen(es=2.5,option=2){square();circle();}
    Txt("Anordnen(es=2.5)"); 
}
union(){// Calliper measures
    T(objPos/2)Caliper(s=3,l=8,end=+1,h=.5,messpunkt=false);
    Txt("Caliper(l=8)"); 
}
union(){// Calliper measures
    T(objPos/2)Caliper(s=3,l=4,end=0,messpunkt=false);
    Txt("Caliper(l=8,end=0)"); 
}

union(){// Pivot shows point
    T(objPos/2)Pivot([-3,+1],size=5);
    Txt("Pivot([-3,1])"); 
}

union(){// Line line between P0 P1
    T(objPos/2)Line([-7,-1,0],p1=[2,4,0],2D=true);
    Txt("Line(p0,p1)"); 
}


}

if(show=="polygons")union()//•••••••••• polygons:   ••••••••••
T(0,5)Anordnen(es=[35,20],option=3,c=undef,loop=false,center=false){
$textPos=[-8,-8];
    union(){// Triangle
        Cross();
        linear_extrude(.1)Tri(h=10,r=[1,.5],top=true,messpunkt=5);
        Txt("Tri(h=10,r=[1,.5],top=1);");
    }
    union(){// Quad
        Cross();
        Quad(12,10,grad=135,messpunkt=5);
        //T(0,-2.5)Rand(.1)square([10,5],true);
        Txt("Quad(10,5,grad=135);");
    }    
    union(){// Kreis
        Cross();
        Kreis(5,rand=1);
        Txt("Kreis(5,rand=1);");
    }    
    union(){// Tri90
        Cross();
        Tri90(grad=20,r=[1,2],messpunkt=5);
        Txt("Tri90(grad=20,r=[1,2]);");
    }    
    union(){// Lens
        Cross();
        Linse(messpunkt=5);
        Txt("Linse();");
    }    
    union(){// Star
        Cross();
        Stern(5,7,4);
        Txt("Stern();");
    } 
    union(){// Wave Star
        Cross();
        WStern(f=5,r=5,a=1,fn=5*10);
        Txt("WStern(f=5,r=5,a=1);");
    }     
  
    union(){// Super Ellipse
        Cross();
        Color(){
        Tz($idx/10)Superellipse(3.5,r=5,fn=4*10);    
        Tz($idx/10)Superellipse(1.5,r=5,fn=4*10);
        Tz($idx/10)Superellipse(0.5,r=5,fn=4*10);
            
        }
        Txt("Superellipse(n=3,r=5);");
    }    
    union(){// 7-Segment
        Cross();
        Seg7(8);
        Txt("Seg7(8);");
    }      
    
    
  /* 
    •••••• 2D ••••••


ECHO: "•• [100] Trapez(h=2.5,x1=6,x2=3.0,d=1,x2d=0,fn=36,n=$info)••••"

ECHO: "•• VorterantQ(size=20,ofs=.5)••••"
ECHO: "•• Bogendreieck(rU=5,vari=-1,fn=fn,n=$info) ••• Reuleaux(rU=5,n=$info,fn=fn)••••"
ECHO: "•• Stern(e=5,r1=10,r2=5,mod=2,delta=+0,n=$info)••••"
ECHO: "•• ZigZag(e=5,es=0,x=50,y=5,mod=2,delta=+0,base=2,center=true,n=$info,help=helpM)••••"
ECHO: "

•• Flower(help=$helpM);
•• 
•• WKreis(help=$helpM);
•• RSternFill(help=$helpM);
 •• Cycloid(help=$helpM);
•• SQ(help=$helpM);
•• Vollwelle(help=$helpM);
•• CycloidZahn(help=$helpM);
•• Nut(help=$helpM);
•• DBogen(help=$helpM);(opt polygon)
 •• Pfeil(help=$helpM);
•• Rosette(help=$helpM);
•• GT(help=$helpM);•• Egg(help=$helpM);"
*/
    
}



if(show=="objects")union()//•••••••••• objects:   ••••••••••
Anordnen(es=50,option=3,c=undef,loop=false,center=false,name="Objects"){
    objPos=[3,0];
  union(){ // hyperbolic fillet
    T(objPos)T(-2,0)R(0,90,90)HypKehle(l=8,d1=1,exp=2,fill=true)rotate(30)circle($r,$fn=6);
    Txt("HypKehle()circle()"); 
  }
  
  
  
 /* 
  •••••••••• BasisObjekte:   •••••••••••••

ECHO: "•• [300] Kugelmantel(d=20,rand=n(2),fn=fn); ••••"
ECHO: "•• [30] Kegel (d1=12,d2=6,v=1,fn=fn,n=$info,center=false,grad=0)  ••• [31]MK(d1=12,d2=6,v=19.5)//v=Steigung ••••"
ECHO: "•• [301] Kegelmantel (d=10,d2=5,v=1,rand=n(2),loch=4.5,grad=0,center=false,fn=fn,n=$info) ••••"
ECHO: "•• [32] Ring(h=5,rand=5,d=20,cd=1,center=false,fn=fn,n=$info,2D=0) cd=1,0,-1  ••••"
ECHO: "•• [33] Torus(trx=10,d=5,a=360,fn=fn,fn2=fn,r=0,n=1,dia=0,center=true,spheres=0)opt polygon ••••"
ECHO: "•• [34] Torus2(m=10,trx=10,a=1,rq=1,d=5,w=2)//m=feinheit,trx = abstand mitte,a = sin verschiebung , rq=mplitude, w wellen •••••"
ECHO: "••  WaveEx(help=$helpM)•••••"
ECHO: "•• [35] Pille(l=10,d=5,fn=fn,fn2=36,center=true,n=1,rad=0,rad2=0,loch=false) •••• "
ECHO: "•• [402] Strebe(skew=0,h=20,d=5,rad=4,rad2=3,sc=0,grad=0,spiel=0.1,fn=fn,center=false,n=$info,2D=false)••••"
ECHO: "•• WStrebe(grad=45,grad2=0,h=20,d=2,rad=3,rad2=0,sc=0,angle=360,spiel=.1,fn=fn,2D=false,center=true,help=helpM) ••••"
ECHO: "•• [36] Twins(h=1,d=0,d11=10,d12=10,d21=10,d22=10,l=20,r=0,fn=60,center=0,sca=+0,2D=false) ••••"
ECHO: "•• [37] Kehle(rad=2.5,dia=0,l=20,angle=360,fn=fn,spiel=spiel,fn2=fn,r2=0)••••"
ECHO: "••  REcke(help=$helpM)••••"
ECHO: "••  HypKehle(help=$helpM)••HypKehleD()••••"
ECHO: "•• [46] Text(text=»«,size=5,h=0,cx=0,cy=0,cz=0,center=0,font=Bahnschrift:style=bold)••••"
ECHO: "•• [47] W5(kurv=15,arms=3,detail=.3,h=50,tz=+0,start=0.7,end=13.7,topdiameter=1,topenddiameter=1,bottomenddiameter=+2)••••"
ECHO: "•• [50] Rohr(grad=90,rad=5,d=8,l1=10,l2=12,fn=fn,fn2=fn,rand=n(2),name=0)••••"
ECHO: "•• [51] Dreieck(h=10,ha=10,ha2=ha,s=1,n=1,c=0,2D=0,grad=0)  s=skaliert  c=center   ••••"
ECHO: "•• [52] Freiwinkel(w=60,h=5)   ••••"
ECHO: "•• [54] Sinuskoerper(h=10,d=33,rand=2,randamp=1,randw=4,amp=1.5,w=4,detail=3,vers=0,fill=0,2D=0,twist=0,scale=1)  amp=Amplitude, w=Wellen, vers=versatz ••••"
ECHO: "•• [55] Kassette(r1=2,r2=2,size=20,h=0,gon=3,fn=fn,fn2=36,r=0,grad=90,grad2=90,spiel=0.001,mitte=true,sizey=0,help=helpM)••••"
ECHO: "•• Surface(multiple,help=helpM)••••"
ECHO: "•• [58] Box(x=8,y=8,z=5,d2=0,c=3.5,s=1.5,eck=4,fnC=36,fnS=24)••••"
ECHO: "•• [62] Spirale(grad=400,diff=2,radius=10,rand=n(2),detail=5,exp=1,hull=true)opt Object••••"
ECHO: "•• [63] Area(a=10,aInnen=0,rInnen=0,h=0,n=$info)••••"
ECHO: "•• [65] Sichel(start=55,max=270,dia=33,radius=30,delta=-1,2D=false)••••"
ECHO: "•• [66] Prisma(x1=12,y1=12,z=6,c1=5,s=1,x2=0,y2=0,x2d=0,y2d=0,c2=0,vC=[0,0,0],cRot=0,fnC=fn,fnS=36,n=$info)••••"
ECHO: "•• Ccube(help=$helpM)••••"
ECHO: 
ECHO: "•• [67] Disphenoid(h=15,l=25,b=20,r=1,ty=0,tz=0,fn=36)••••"
ECHO: "•• Zylinder(help=$helpM)••••"
ECHO: "•• Welle(help=$helpM) opt polygon••••"
ECHO: "•• Anschluss(help=$helpM) ••••"
ECHO: "•• KreisSeg(help=$helpM) ••••"
*/
}


if(show=="products")union()//•••••••••• Produkt Objekte:   ••••••••••
Anordnen(es=50,option=3,c=undef,loop=false,center=false){

//Pivot(help=1);//p0=[0,0,0],size=10,active=[1,1,1,1]) ;
//Line(help=$helpM);//p0=[0,0,0], p1=[20,20,0], d=2,center=false) ;
//SCT(a=90); //sin cos tan info 

Knochen(help=$helpM);//l=+15,d=3,d2=5,b=0,fn=36)   ;
Gardena(help=$helpM);//l=10);
Servotraeger(help=$helpM);//SON=1);
    Servo(help=$helpM);//r=0,narbe=1) ;    
Glied(l=30,spiel=0.5,la= -0.5,fn=20,d=6,h=10,rand=2);
  union(){
    rotate(90)  DGlied0(l1=12,l2=12,la=-1,rand=.75,d=2) ;
    DGlied1(l1=12,l2=12,la=-1,d=2,rand=.75) ;
  }
  
Luer(help=$helpM);//male=1,lock=1,slip=1) ;
Bitaufnahme(help=$helpM);//l=10,star=true);
  
/* replaced with
  union(){mirror([0,1])rotate(-28)Text("Imprint",h=1.2*.15*2,radius=10,cz=1); 
  Imprint("Imprint",radius=10,abstand=29,help=$helpM);}//txt1="Imprint",radius=10,abstand=29,rotz=-2,h=1.2,rotx=0,roty=0,stauchx=0,stauchy=0,txt0="›",txt2="‹",size=5,font="DejaVusans:style=bold",name=$info)cylinder(1,r=20);
*/
  
Achshalter(help=$helpM);//laenge=30,achse=+5,schraube=3,mutter=5.5,schraubenabstand=15,hoehe=8,fn=fn) ;
Achsenklammer(abst=15,achse=6,rand=2);//abst=10,achse=3.5,einschnitt=1,h=3,rand=n(2),achsenh=0,fn=72);
  
Vorterantrotor(help=$helpM,rU=5,h=15);//h=40,twist=360,scale=1,zahn=0,rU=10,achsloch=4,ripple=0,caps=2,caps2=0,capdia=6.5,capdia2=0,screw=1.40,screw2=0,screwrot=60,n=1);
  
ReuleauxIntersect(help=$helpM);//h=2,rU=5,2D=false); 
Tugel(help=$helpM);//dia=20,loch=15,scaleKugel=2,scaleTorus=2);

Glied3(help=$helpM);//x=10);
Gelenk(help=$helpM);//l=10,w=0);
 
render()Balg(help=$helpM);//sizex=16,sizey=16,z=10.0,kerb=6.9,rand=-0.5);
Tring(help=$helpM);//spiel=+0,angle=153,r=5.0,xd=+0.0,h=1.75,top=n(2.5),base=n(4),name=0);
Servokopf(help=$helpM);//rot=0,spiel=0)cylinder(5,d=10);//Objekt
Klon(10)if($idx)Halbrund(h=15,d=8+2*spiel,x=1.5,name=$info);else Halbrund(d=8,x=1,doppel=true)cylinder(4,d=10);///Objekt mikroGetriebemotor Wellenaufnahme 
//depriciate Riemenscheibe(help=$helpM,e=22,radius=15)cylinder(8,d=30);//e=40,radius=25,nockendurchmesser1=2,nockendurchmesser2=2,hoehe=8,name=$info)cylinder(8,r=25);//opt Objekt 
Cring(help=$helpM);//id=20,grad=230,h=15,rand=3,rad=1,end=1,txt=undef,tWeite=15,tSize=5,center=true,fn=fn,fn2=36);

PCBcase(deckel=1);//cube(30,true);
Klammer(d=10,breite=3);
Pin(d=12,l=30);
CyclGetriebe(help=$helpM,modul=5,z=15,achse=10,light=3,lRand=2);
Buchtung(help=$helpM);
SpiralCut(help=$helpM);
SRing(e=5,id=10,od=20,rand=2.5);
DRing(help=$helpM);//opt polygon
DRing(help=$helpM)circle(1,$fn=5);
GewindeV4(dn=15,h=20,p=3,help=$helpM);
BB(help=$helpM); //Ballbearing
union(){
    Abzweig(r1=5,r2=15,help=$helpM);
    cylinder(30,r=5);
    R(90)cylinder(10,r=15);
}
GT2Pulley(h=10,z=40,center=false,achse=10);
}


/*






*/


if(show=="functions")Anordnen(option=3,es=[30,18],e=[3,4],c=undef,loop=false,center=false){
objPos=[2,1,0];
  union(){
    Color(color2)Rand(n(4))square(5);
    Txt("Rand(n(4))square([5]);",0);
    Txt("4 Walls (nozzle*4+.015)",-1);
  }
  union(){
    
    square([10,l(10)]);
    Txt("square([10,l(12)]);",0);
    Txt("12 layer high ",-1);
  }  
  
  union(){
    rotate(180)Rand(.5)circle(2,$fn=5);
    Color(color2)circle(Inkreis(5,2),$fn=5);
    Txt("circle(Inkreis(5,2),$fn=5);",0);
    Txt("inner circle of n-gon ",-1); 
  }
  union(){
    rotate(180)circle(2,$fn=5);//Rand(0)
    Tz(-0.1)Color(color2)circle(Umkreis(5,2),$fn=5);
    Txt("circle(Umkreis(5,2),$fn=5);",0);
    Txt("outer circle of n-gon ",-1); 
  }  
  union(){// Hypotenuse
    rotate(90)square(2);
    rotate(-90)square(3);
    T(3)rotate(270-atan(2/3))Tz(-0.1)rotate(180)Color(color2)square(Hypotenuse(2,3));;
    Txt("square(Hypotenuse(2,3));",0);
    
  }
  union(){// Kathete
    Color(color2)rotate(90)square(Kathete(4,3));
    rotate(-90)square(3);
    T(3)rotate(270-acos(3/4))Tz(-0.1)rotate(180)square(4);;
    Txt("square(Kathete(4,3));",0);
    
  }  
  union(){//scaleGrad
    grad=65;
    Color(color2)T(0,5)scale([scaleGrad(grad,5,10),1,1])square([10,1]);
    square([10,1]);
    T(10)mirror([1,0])Pivot(rot=grad,size=9,active=[0,1,0,0,0]);
    T(10)Pivot(rot=grad,size=10,active=[0,0,0,0,1]);
    
    T(15)R(-90) linear_extrude(5,scale=scaleGrad(grad,5,4))circle(4);
    
    Txt(str("scale=scaleGrad(",grad,",h=5,r=10)"),0);
    Txt("usefull in extrusions",-1);
  }    
  
  union(){// Sehne
    T([0,0,-0.2]+objPos )Color(color2)square([10,Sehne(n=5,r=3)],true);
    T(objPos) Rand(-1)circle(3,$fn=5);
    T(10){T([0,0,-0.2]+objPos )Color(color2)square([Sehne(a=60,r=3),7],true);
    T(objPos) Rand(-1)circle(3,$fn=6);}
    
    Txt("Sehne(n=5,r=3)",0);
    Txt("Sehne(r=3,a=60)",-1);
  }    
  
  union(){// radiusS
    T([0,0,+0.1]+objPos )Color(color2)circle(r=radiusS(7,3),$fn=7);
    T([0,0,+0.2]+objPos )rotate(360/7*4)Color(0.5)square([radiusS(7,3),1]);
    T(objPos)square([10,3],center=true);
    
    Txt("r=radiusS(n=7,r=3)",0);
  }    
  
  union(){// gradS
    s=4;
    rot=gradS(s=s,r=3.5);
    T(+objPos)rotate(-rot/2){
      T([0,0,+0.0] )Color(color2)Rand(-.5)Kreis(grad=360-rot,r=3.5,rot=0,center=false);
      T([3.5,0,+0.1] )rotate(rot/2){
        Color(0.6)square(s);
        Caliper(s,center=false,s=4,messpunkt=0,end=3,translate=[8,0],in=2);
      }
    }
    //T(objPos)square([10,3],center=true);
    
    Txt(str("gradS(s=",s,",r=3)"),0);
  } 
  
  union(){// gradB
    T(objPos)for(i=[1:5]) Kreis(grad=gradB(4,i),r=i,rand=.5,rot=0);
    
    Txt("gradB(b=4,r=3)",0);
    Txt("deg for arc length(b))",-1);
  }    
  
  
    union(){// runden
    T(-8 )Text(5.1256,size=3,cy=true);
     T(objPos +[5]) P();
     T(10) Color(color2)Text(runden(5.1256,2),size=3,cy=true);
    
    Txt("runden(5.1256,2)",0);
  } 
  
  
  
  /*
  

••• l(x)//Layer  ••  n(x)//Nozzledurchmesser   •••\n
••• Inkreis(eck,rU) •• Umkreis(eck,rI) •••\n
  
••• Hypotenuse(a,b) length •• Kathete(hyp,kat) length •••\n
••• Sehne(n,r,a) length n-eck/alpha winkel •••\n
  
••• gradB(b,r) grad zum Bogenstück b •••\n 
••• gradS(s,r) grad zur Sehne s •••\n     
••• radiusS(n,s,a); radius zur Sehne ••• \n
••• kreisbogen(r,grad=360); ••• \n  
  
••• RotLang(rot,l,z,e,lz) [vector] (e=elevation)•••\n
••• Bezier(t,p0=[0,0],p1=[-20,20],p2=[20,20],p3=[0,0]) points   •••\n
••• Kreis(r=10,rand=+5,grad=360,grad2=+0,fn=fn,center=true,sek=true,r2=0,rand2=0,rcenter=0,rot=0,t=[0,0]) points •••\n
••• KreisXY(r=5,grad=0) [vector]•••\n
••• 5gon(b1=20,l1=15,b2=10,l2=30) points •••\n
••• ZigZag(e=5,x=50,y=5,mod=2,delta=+0,base=2,shift=0) points •••\n
••• TangentenP(grad,rad,r) length •••\n
••• Hexstring(c=[r,g,b]) #hexcolor •••\n
••• RotPoints(grad,points) •••\n
••• negRed(num) negative consolen Werte in rot•••\n   
  
••• vollwelle() ⇒ Vollwelle(help=1) •••\n
••• runden(x,dec=2) x runden auf Dezimalstelle ••• \n
••• 
••• grad(grad=0,min=0,sec=0,h=0,prozent=0,gon=0,rad=0); Winkelmaßumrechnung ••• \n  
••• inch(inch); Inch⇒mm •••\n 

••• fs2fn(r,grad=360,fs=fs,minf=3); convert $fs ⇒ $fn •••\n
••• vektorWinkel(p1,p2,twist=0); •••\n
••• v3(v); makes v a vector3 •••\n
••• parentList() list with all modules •••\n
••• teiler(n,div=2) least divisior •••\n
••• gcode(points,f) generates gcode in output •••\n
••• b(n,bool); switches bool in num and vica versa (works on vectors) also always bool never bool •••\n
••• scaleGrad(grad=45,h=1,r=1) scale factor for extrusions•••\n
*/
}



