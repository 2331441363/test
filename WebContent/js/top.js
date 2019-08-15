
			function search(){
				var content = $('[name=goodsName]').val();
				if(content != ""){
					$("#searchA").attr("href","IndexServlet?goodsName="+content);
				}
			}
			function number(){
	    		$.ajax({
					type:'get',
					url:'GoodsServlet',
					data:"handle=cartNumber",
					dataType:'html',
					success:function(data){
	   					$("#divFloat3").html(data);
					}
				});
	      	}

			var count=1;
			var array;
			$(function(){
				number();
				var course;
				//ajax请求一级菜单
				$.ajax({
					type:'post',
					url:'IndexServlet',
					dataType:'json',	
					success:function(data){
						for(var j = 0;j < data[0].length;j++){
							course+="<tr><td><a href='IndexServlet?courseTypeId="+data[0][j].courseTypeId+"&catalog="+data[0][j].courseTypeName+"&title="+data[0][j].courseTypeName+"' name='"+data[0][j].courseTypeId+"' class='co'>"+data[0][j].courseTypeName+"</a></td></tr>";
						}
						$("#two").html(course);
						$('.co').mouseover(function(){
							var courses;
							for ( var i = 0; i < data[1].length; i++) {
								if($(this).attr("name")==data[1][i].courseTypeId){
									var text = $(this).html()+"&nbsp;>&nbsp;"+data[1][i].courseTypesName;
									courses+="<tr><td style='width: 120px;border-right: 1px solid #F0F0F0;'><a href='IndexServlet?courseTypesId="+data[1][i].courseTypesId+"&catalog="+text+"&title="+data[1][i].courseTypesName+"' style='font-size: 14px;color:black;'>"+data[1][i].courseTypesName+"</a></td><td>";
									for(var j = 0;j < data[2].length;j++){
										if(data[1][i].courseTypesId == data[2][j].courseTypesId){
											var text2 = $(this).html()+"&nbsp;>&nbsp;"+data[1][i].courseTypesName + "&nbsp;>&nbsp;" + data[2][j].goodsTypeName;
											courses+="<a  href='IndexServlet?goodsTypeId="+data[2][j].goodsTypeId+"&catalog="+text2+"&title="+data[2][j].goodsTypeName+"'>"+data[2][j].goodsTypeName+"</a>";
										}
									}
									courses+="</td></tr>";
								}
							}
							$("#three").html(courses);
						
						});
					}
				});
			
			
			});
		
		$(function(){
			$("#two").hide();
			$("#three").hide();
			$("#type").mouseover(function(){
				$(this).attr("src","indexImage/-4.gif");
				$("#two").show();
			});
			
			$("#two").mouseover(function(){
				$(this).show();
				$("#one").css("backgroundColor","white");
				$("#one").css("box-shadow","0px 0px 5px #E0E0E0");
				$("#three").show();
			});

			$("#three").mouseover(function(){
				$(this).show();
				$("#two").show();
			});
			$("#three").mouseout(function(){
				$(this).hide();
				$("#two").hide();
				$("#type").attr("src","indexImage/-3.gif");
			});
			$("#app").mouseover(function(){
				$("#divFloat").css("display","block");
			});
			$("#app").mouseout(function(){
				$("#divFloat").css("display","none");
			});

			$(".td222").mouseover(function(){
				$(this).css("background","#F0F0F0");
			});
			$(".td222").mouseout(function(){
				$(this).css("background","#FFFFFF");
			});
			$("#imgIDD").mouseover(function(){
				$("#divFloat2").css("display","block");
			});
			$("#divFloat2").mouseover(function(){
				$(this).css("display","block");
			});
			$("#divFloat2").mouseout(function(){
				$(this).css("display","none");
			});
			if($("#userLogin").html() == "登录/注册"){
				$("#userLogin").attr("href","indexLogin.jsp");
				
			}else{
				$("#userLogin").attr("href","EditData.jsp");
			}
		});
		
			$(function(){
				var course = '<td style="padding-bottom:20px;" id="oneTd">';
				//ajax请求一级菜单
				$.ajax({
					type:'post',
					url:'IndexServlet',
					dataType:'json',	
					success:function(data){
						for(var j = 0;j < data[0].length;j++){
							course+="<a  href='IndexServlet?courseTypeId="+data[0][j].courseTypeId+"&catalog="+data[0][j].courseTypeName+"&title="+data[0][j].courseTypeName+"' name='"+data[0][j].courseTypeId+"'style='color:#1E90FF' class='co' name='"+data[0][j].courseTypeId+"'>"+data[0][j].courseTypeName+"</a>";
							//course+="<tr><td><a href='IndexServlet?courseTypeId="+data[0][j].courseTypeId+"' name='"+data[0][j].courseTypeId+"' class='co'>"+data[0][j].courseTypeName+"</a></td></tr>";
						}
						course+="</td>";
						$("#oneTd").html(course);
						$('.co').mouseover(function(){
							
							var courses = "<td id ='twoTd'><a>"+$(this).html()+"</a>";
							for ( var i = 0; i < data[1].length; i++) {
								if($(this).attr("name")==data[1][i].courseTypeId){
									var text = $(this).html()+"&nbsp;>&nbsp;"+data[1][i].courseTypesName;
									courses+="<a class='cc' id='"+$(this).html()+"' name='"+data[1][i].courseTypesId+"' href='IndexServlet?courseTypesId="+data[1][i].courseTypesId+"&catalog="+text+"&title="+data[1][i].courseTypesName+"'>"+data[1][i].courseTypesName+"</a>";
								}
								
							}
							courses+="</td>";
							$("#twoTd").html(courses);
							$(".cc").mouseover(function(){
								var gd = "<td id = 'threeTd'><a>"+$(this).html()+"</a>";
								for(var j = 0;j < data[2].length;j++){
									if($(this).attr("name") == data[2][j].courseTypesId){
										var text2 = $(this).attr("id") +"&nbsp;>&nbsp;"+$(this).html() + "&nbsp;>&nbsp;" + data[2][j].goodsTypeName;
										gd+="<a href='IndexServlet?goodsTypeId="+data[2][j].goodsTypeId+"&catalog="+text2+"&title="+data[2][j].goodsTypeName+"'>"+data[2][j].goodsTypeName+"</a>";
												//goods+="<a  href='IndexServlet?goodsTypeId="+data[2][j].goodsTypeId+"'>"+data[2][j].goodsTypeName+"</a>";
									}
								}
								gd+="</td>";
								$("#threeTd").html(gd);
							});
						});
						
								
						
					}
				});
						
			});
			