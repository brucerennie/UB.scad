include<ub.scad>//->http://v.gd/ubaer or https://github.com/UBaer21/UB.scad
/*[Hidden]*/
  useVersion=22.020;
  designVersion=1.0;
  $info=true;
  
/*[ Points ]*/

pointsOcta=octa(10);


// show Points
Points(pointsOcta,hull=false,center=false);

// make Polyhedron
PolyH(pointsOcta);


// move Points

pointsTrans=mPoints(pointsOcta,r=45,t=30,s=2);

PolyH(pointsTrans);


// 2D

points2D =quad();
points2Dtrans=mPoints(points2D,r=45,t=15);

T(50)polygon(points2D);
T(50)polygon(points2Dtrans);


// list of points (make sure to flatten with "each"

pointsList= [for (i =[0:15]) each kreis( r= 10 , z= i, fn= 6 ,rand=0)];
T(-20)PolyH(pointsList);

// single point ends 

sPointsList = [
               [0,0,-15],  // bottom end
               for (i=[-10:10] ) each quad(x=10+sin(i*18)*2,z=i,fn=12), // quad points from z = -10 ⇒ 10
               [0,0, 5]  // top end
];
T(-20,-20)PolyH(sPointsList,pointEnd=true,loop=12+4);  // loop = 4 corner arc with 4 points or 4× 3 fraqments + 4 sides between

// translating points 
dist=20;
rot=90;
pointsListTrans= [for (i =[0:5:rot]) each mPoints(
                                                 kreis( r= 10 , rand= 0 , z= 0, fn= 6 )
                                                ,r=[i],t=[0,dist])];

T(-50){
  PolyH(pointsListTrans, loop = 7);
  Points(pointsListTrans,hull=false,start=18*7,loop=7,center=false);
}

//  modified
union(){
  fn=5;

pointsListMOD= [for (i =[0:5:360]) each mPoints(
                                                 mPoints(kreis( r= 10 +sin(i)*5, rand= 0 ,grad= 90,rot=270, z= 0, fn= fn ),r=i)
                                                ,r=[i,0,0],t=[0,20])];

T(-85) {
  PolyH(pointsListMOD, loop = fn+1,end=false);
  Points(pointsListMOD,hull=false,loop=fn+1,start=30*(fn+1),mark=[0,len(pointsListMOD)-1]);
}

}
