
function ab(mvCode) {
				//alert(mvCode);
				$.ajax({
					type: 'get',
					dataType: 'json',	//자동처리 믿지말자. json타입이어먀만 반환변수명.vo의 변수명 접근이 가능하다.
					url: '/movie/requestMovieInfos/' + mvCode,
					success: function (result) {
						// result.detail 	= MovieDetailVO		detail이란 이름은 controller에서 부여했다.
						// result.cineMeta 	= List<CineInfoVO>	cineMeta라는 이름은 controller에서 부여했다.
						
						//1. 영화 상세정보 보여주기
						console.log('countLike call back  : '+result.detail.name);
							$('#ws_movieDetail_poster').attr('src','//images.maxmovie.com/thumbc'+result.detail.posterImage);
							$('#ws_movieDetail_name').html('제목 : '+result.detail.name);
							$('#ws_movieDetail_nameEn').html('('+result.detail.nameEn+')');
							$('#ws_movieDetail_genre').html('장르 : '+result.detail.genre);
							$('#ws_movieDetail_grade').html('등급 : '+result.detail.grade);
						
						//2-1. 극장(CineInfoVO)을 지역 대분류로 나누는 절차를 시작한다.
						//		가장 먼저. 각각의 대분류가 몇 개씩 있는지 숫자를 세어주자.
						var cMeta = result.cineMeta;
						
						var counterA =0;
						var counterB =0;
						var counterC =0;
						var counterD =0;
						var counterE =0;
						var counterF =0;
						
						//for문을 돌리는 목적은 새로운 제목을 눌렀을 때, 이전의 숫자값을 초기화 해주고, 0을 집어넣지 않으면 NaN 오류가 난다(최초 입력시)
						var grpaDetailCnt = new Array();
						for(j=101;j<=125;j++) {
							grpaDetailCnt[j] = 0; 										
							$('#GRPA'+j+' > a > span').text('['+grpaDetailCnt[j]+']');	
						}; 
						
						var grpbDetailCnt = new Array();
						for(j=201;j<=340;j++) {	//여기 숫자값을 조심해주자 두군데   & 시작수~끝수는 긁어오는 li의 최소수 ~최대수. 연속되지 않더라도 상관없다.
							grpbDetailCnt[j] = 0; 						// grp'b' 1군데			
							$('#GRPB'+j+' > a > span').text('['+grpbDetailCnt[j]+']'); // #GRP 'B', text(grp'b') 두 군데	
						};
						
						var grpcDetailCnt = new Array();
						for(j=360;j<=908;j++) {
							grpcDetailCnt[j] = 0; 										
							$('#GRPC'+j+' > a > span').text('['+grpcDetailCnt[j]+']');	
						};
						
						var grpdDetailCnt = new Array();
						for(j=310;j<=511;j++) {
							grpdDetailCnt[j] = 0; 										
							$('#GRPD'+j+' > a > span').text('['+grpdDetailCnt[j]+']');	
						};
						
						var grpeDetailCnt = new Array();
						for(j=330;j<=560;j++) {
							grpeDetailCnt[j] = 0; 										
							$('#GRPE'+j+' > a > span').text('['+grpeDetailCnt[j]+']');	
						};
						
						var grpfDetailCnt = new Array();
						for(j=350;j<=720;j++) {
							grpfDetailCnt[j] = 0; 										
							$('#GRPF'+j+' > a > span').text('['+grpfDetailCnt[j]+']');	
						};
						
						
						$('#ws_local_detail > div > span').css('display', 'none');					
						
						for(i=0;i<cMeta.length;i++) {
							
							switch(cMeta[i].agc) {
							
							case 'GRPA' :	counterA = counterA +1;
											
											//매번 지역코드만큼의 변수를 만들기에는 너무 벅차다. 배열을 이용해보자
											for(j=101;j<=125;j++) {
												if(cMeta[i].aic ==j){
												grpaDetailCnt[j] = grpaDetailCnt[j]+1;
												$('#GRPA'+j).css('display','inline-block');	
												$('#GRPA'+j+' > a > span').css('display','inline-block');
												$('#GRPA'+j+' > a > span').text('['+grpaDetailCnt[j]+']');
												}
											};
											
											
											
											break;
							case 'GRPB' :	counterB = counterB +1;
											
											for(j=201;j<=340;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpbDetailCnt[j] = grpbDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPB'+j).css('display','inline-block');	
												$('#GRPB'+j+' > a > span').css('display','inline-block');
												$('#GRPB'+j+' > a > span').text('['+grpbDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;
							case 'GRPC' :	counterC = counterC +1;
											
											for(j=360;j<=908;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpcDetailCnt[j] = grpcDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPC'+j).css('display','inline-block');	
												$('#GRPC'+j+' > a > span').css('display','inline-block');
												$('#GRPC'+j+' > a > span').text('['+grpcDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPD' :	counterD = counterD +1;
							
											for(j=310;j<=511;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpdDetailCnt[j] = grpdDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPD'+j).css('display','inline-block');	
												$('#GRPD'+j+' > a > span').css('display','inline-block');
												$('#GRPD'+j+' > a > span').text('['+grpdDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPE' :	counterE = counterE +1;
							
											for(j=330;j<=560;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpeDetailCnt[j] = grpeDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPE'+j).css('display','inline-block');	
												$('#GRPE'+j+' > a > span').css('display','inline-block');
												$('#GRPE'+j+' > a > span').text('['+grpeDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							case 'GRPF' :	counterF = counterF +1;
							
											for(j=350;j<=720;j++) {				//j = '201'; j<= '340' 두 군데 유의
												if(cMeta[i].aic ==j){
												grpfDetailCnt[j] = grpfDetailCnt[j]+1; //grp 'b'..[] = grp 'b' 두 군데 유의
												$('#GRPF'+j).css('display','inline-block');	
												$('#GRPF'+j+' > a > span').css('display','inline-block');
												$('#GRPF'+j+' > a > span').text('['+grpfDetailCnt[j]+']'); //GRP'B' 랑  .text(grp'b') 부분 유의
												}
											};
											break;				
							}//swtich문 끝
							
							
						}//for문 끝
												
						$('#GRPA > span').text('('+counterA+')');
						$('#GRPB > span').text('('+counterB+')');
						$('#GRPC > span').text('('+counterC+')');
						$('#GRPD > span').text('('+counterD+')');
						$('#GRPE > span').text('('+counterE+')');
						$('#GRPF > span').text('('+counterF+')');
						
					
						
						}
					,
					error: function (xhr, status, er) {
						if (error) {
							alert('에러??');
							error(er);
						}
					}
				});//e_Ajax	
			};//e_ab
			
			function getLocalList(localCode) {
				localCode.stopimmediatepropagation;
				console.log(localCode);
				switch (localCode) {
				case 'GRPA'  : 	
								$('#ws_local_detail > div').css('display', 'none');//안먹는데?
								$('#GRPA-detail').css('display', 'inline-block');
								
								break;
				case 'GRPB'  :	
								$('#ws_local_detail > div').css('display', 'none');
								
								$('#GRPB-detail').css('display', 'inline-block');
								break;
				case 'GRPC'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPC-detail').css('display', 'inline-block');
								break;
				case 'GRPD'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPD-detail').css('display', 'inline-block');
								break;
				case 'GRPE'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPE-detail').css('display', 'inline-block');
								break;
				case 'GRPF'  : 	
								$('#ws_local_detail > div').css('display', 'none');
								$('#GRPF-detail').css('display', 'inline-block');
								break;
				}
			}
			


 