function listModules(idstr){
	//alert(idstr);
	var name1="subtree"+idstr;
	var objectobj=document.all(name1);
	
	if(objectobj.style.display=="none"){
		objectobj.style.display="";
	}
	else{
		objectobj.style.display="none";
	}
}
