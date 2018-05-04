httk.fun <-
function(dataset,predictionFeature,parameters){
    #dataset:= list of 2 objects - 
    #datasetURI:= character sring, code name of dataset
    #dataEntry:= data.frame with 2 columns, 
    #1st:name of compound,2nd:data.frame with values (colnames are feature names)
    #predictionFeature:= character string specifying which is the prediction feature in dataEntry, 
    #parameters:= list with parameter values-- here awaits a list with four elemnts: 
    #chem.name (either the chemical name, CAS number, or the parameters must be specified.),
    #species (either "Rat", "Rabbit", "Dog", "Mouse", or default "Human"),
    #days (length of the simulation, default is 10),
    #dose (amount of a single dose, mg/kg BW - overwrites daily.dose, default is NULL),
    #Note that the model parameters have units of hours while the model output is in days.
    #Default NULL value for doses.per.day solves for a single dose.
    #The compartments used in this model are the gutlumen, gut, liver, kidneys, veins, arteries, lungs, and the rest of the body.
    #The extra compartments include the amounts or concentrations metabolized by the liver and excreted by the kidneys through the tubules.
    #AUC is the area under the curve of the plasma concentration. 
    #Values apply to average population- gendernum is the variable reffering to gender with default NULL value
    #meaning both males and females are included, in their proportions in the NHANES data
    
    #dat<- dataset$dataEntry[,2]# data table
    #param1<- parameters$chem.name
    #param2<- parameters$species
    
    h.params = parameterize_pbtk(chem.name = parameters$chem.name, species = parameters$species)
    if(length(parameters$dose)<=0){parameters$dose<- NULL}
    h.out = solve_pbtk(parameters=h.params,
                       days=parameters$days,dose=parameters$dose,#doses.per.day=parameters$doses.per.day,daily.dose=parameters$daily.dose,
                       plots=F,supress.messages=T)
    
    
    pbtk.ser<- serialize(list(PBTK=h.out),connection=NULL)
    pred.name<- colnames(h.out)
    all.params<- c(parameters,h.params)
    
    #unserialize(base64Decode(base64(pbtk.ser),'raw'))# RCurl
    #unserialize(base64_dec(base64_enc(pbtk.ser)))# jsonlite
    
    
    #plot
    h.out1<- as.data.frame(h.out)
    h.out1 <- melt(h.out1,id.vars = 'time',variable.name = 'PBTKoutputs')
    
    # plot on same grid, each series colored differently -- 
    # good if the series have same scale
    #ggplot(h.out1, aes(time,value)) + geom_line(aes(colour = PBTKoutputs),size=0.5)
    # or plot on different plots
    #ggplot(h.out1, aes(time,value)) + geom_line() + facet_grid(PBTKoutputs ~ .)
    #par(mfrow=c(4,4))
    #for(i in 2:ncol(h.out)){
    #plot(h.out[,1],h.out[,2])}
    
    png('plot1')
    p <-ggplot(h.out1, aes(time, value))
    p1<- p + geom_bar(stat = "identity", aes(fill = PBTKoutputs)) + ggtitle(paste(parameters$chem.name,'PBTK values',sep=' ')) + theme_bw()
    print(p1)
    dev.off()
    
    png1<- file('plot1','rb')#open for reading in binary mode
    N<- 1e6
    pngfilecontents <- readBin(png1, what="raw", n=N)
    close(png1)
    c.fig<- fromJSON(toJSON(pngfilecontents))#base64(pngfilecontents)
    ### NOTE: fromJSON(toJSON( is a round-about since base64 doesn't work with JSON
    ### and to JSON is doing base64 internally
    #
    
    
    m1.ser.list<- list(rawModel=pbtk.ser,pmmlModel=NULL,independentFeatures=NULL,
                       predictedFeatures=pred.name,#NULL,
                       additionalInfo=list(parameters=all.params,predictedFeatures=pred.name,graphs=unbox(c.fig)))
    
    
    return(m1.ser.list)
    
}
