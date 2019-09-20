//Macro "Intensity Measurements into micro-algae"
//Code written by Bertrand Cinquin : bertrand.cinquin@espci.fr using ImageJ V1.52p
//free of use
run("Set Measurements...", "area mean area_fraction redirect=None decimal=3");
//Draw the contour of the algae you wish to investigate
run("Measure");
area1= getResult("Area",0);
Radius = sqrt(area1/(3.1416));
print("Area is", area1, "Radius is", Radius);

	roiManager("Add"); //Add the outter ring of the algae
	for(i=1;i<10;i++){ //Define 10 rings in a way that each area defined between each ring are equal
  	  	roiManager("Select",0);
   		print(i,(10-i)/10,sqrt((10-i)/10)*Radius);
   		Diff=Radius*(1-sqrt((10-i)/10));
   	 	run("Enlarge...", "enlarge=-"+Diff);
   	 	roiManager("Add");
    }
	for(i=1;i<10;i++){ //Define the areas
		l = i-1;
		Selec =newArray(l,i);
    	roiManager("Select",Selec);
		roiManager("XOR");
    	roiManager("Add");  
	}	
	for(i=10;i<19;i++){  //Measure the different areas
    	roiManager("Select",i);    
   	 	run("Measure");
	}
	roiManager("Select",9);   // The last ring is also the last area and therefore measured last 
	run("Measure"); 