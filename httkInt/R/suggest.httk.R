suggest.httk <-
function(dataset,rawModel,additionalInfo){
	#dataset:= list of 2 objects 
	#datasetURI:= character string, code name of dataset
	#dataEntry:= data.frame with 2 columns, each column is a data.frame in itself
	#1st:name of compound,2nd:data.frame with values (colnames are feature names)
	#rawModel:= R model for the PBTK model produced by httk.fun   
	#additionalInfo:= list with all parameters as given in the httk.fun function + the once calculated by default 
	#
	



	dat1.m<- rawModel
	dat1.m<- jsonlite::base64_dec(dat1.m)#base64Decode(dat1.m,'raw')
	httk.in<- unserialize(dat1.m)
	httk.in<- httk.in$PBTK
	
	#sug.trials<- sug.trials$Trials
	sug.names<- additionalInfo$predictedFeatures
	#sug.names<- pred.names
	
	for(i in 1:dim(httk.in)[1]){
		w1<- data.frame(t(httk.in[i,]))
		colnames(w1)<- sug.names
		
		if(i==1){p7.1<- list(unbox(w1))
		}else{
			p7.1[[i]]<- unbox(w1)
		}
	}
	p7.2<- list(predictions=p7.1)


	return(p7.2)
}
