var AjaxUtil = function(p_url, p_params, p_method, p_aSync){
	if(!p_url||p_url.trim()==""){
		alert("AjaxUtil 호출시 url은 필수 입니다.");
		return;
	}
	this.params = p_params;
	var getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = p_method?p_method:"get";
	var url = p_url;
	//var aSync = true;//중요한 부분: 비동기가 true 동기가  false
	var aSync = p_aSync?p_aSync:true;
	this.xhr.callback=null;
	this.xhr.onreadystatechange=function(){
   		if (this.readyState==4){// readyState는 0~4 까지 밖에 없음, 4가 되야 서버에서 받을수 있음
   			if(this.status==200){//200번이어야 서버에서 받은 거 구나.
	   			var result = decodeURIComponent(this.responseText);//여기서 this는 xhr을 의미함
	   			if(this.callback){ 
	   				this.callback(result);
	   			}else{
	   				alert(result);
	   			}
   			}else{
   				var result = decodeURIComponent(this.responseText);
   				alert(result);
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.callback = func;
	}
   	this.xhr.open(method, url+this.params, aSync);
   	this.send = function(){
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();// 이게 실행되야 바로 서버로 넘어 감
   	}
}