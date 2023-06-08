<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>캠핑장 둘러보기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/around/basic.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>

<%@ include file="../include/header.jsp" %>

<article class="around">

  <div class="header">
    <h1>캠핑장 둘러보기</h1>
    <div class="sel">
      <select class="sel1">
        <option value="" hidden selected>지역</option>
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="강원">강원</option>
        <option value="충청">충청</option>
        <option value="전라">전라</option>
        <option value="경상">경상</option>
        <option value="제주">제주</option>
      </select>
      <select class="sel2">
        <option value="" hidden selected>테마</option>
        <option value="일반야영장">일반야영장</option>
        <option value="글램핑">글램핑</option>
        <option value="카라반">카라반</option>
        <option value="자동차야영장">자동차야영장</option>
      </select>
    </div>
  </div>


  <div class="container">
    
    <c:forEach var="camp" items="${campList}">
      <div id="${camp.cno}" class="col-md-4">
        <div class="thumbnail">
          <a href="${pageContext.request.contextPath}/detail/${camp.cno}" class="detail">
            <img src="${camp.firstImageUrl}" alt="camp${camp.cno}" style="height:217px;"
              onerror="this.src='${pageContext.request.contextPath}/img/campsiteOnerror.jpg'">
          </a>
          <div class="caption">
            <h2>${camp.facltNm}</h2>
            <p>${camp.lineIntro}</p>
            <hr>
    
    
      <div class="button_base b03_skewed_slide_in">
          <div>예약하기</div>
          <div></div>
          <div class="rsv">예약하기</div>
      </div>
    
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
  
</article>

<%@ include file="../include/footer.jsp" %>

<script>
  const $sel1 = document.querySelector('.sel1');
  const $sel2 = document.querySelector('.sel2');
  window.onload =()=>{  

    

    if("${location}" !== ''){
      const arr1 = $sel1.children;
      console.log(arr1);
      console.log(arr1[1].textContent);
      [...arr1].forEach(element => {
        if(element.textContent === "${location}") {
          element.selected = true;
          return;
        }
      });
      
    }
    if("${theme}" !== ''){
      const arr2 = $sel2.children;
      console.log(arr2);
      console.log(arr2[1].textContent);
      [...arr2].forEach(element => {
        if(element.textContent === "${theme}") {
          element.selected = true;
          return;
        }
      });
      
    }

  }
  $sel1.onchange = () => {
	console.log('셀렉트가 변경됨');
    window.location.href = '${pageContext.request.contextPath}/around?location='+$sel1.value+'&theme=${theme}';    
  }
  $sel2.onchange = () => {
	console.log('셀렉트가 변경됨');
    window.location.href = '${pageContext.request.contextPath}/around?location=${location}&theme='+$sel2.value;    
  }


   let str = '';
		let page = 1;
		let isFinish = false;
		let isLoading = false;

  function getList(page, reset) {
			str = '';
			console.log('page: ' + page);
			console.log('reset: ' + reset);

			if(isLoading) return;

			isLoading = true;
			fetch('${pageContext.request.contextPath}/around/' + page+'?location='+$sel1.value + '&theme='+$sel2.value)
				.then(res => res.json())
				.then(list => {
					console.log(list);
					console.log(list.length);
					if (list.length === 0) isFinish = true;

					if (reset) {
						while ($contentDiv.firstChild) {
							$contentDiv.firstChild.remove();
						}
						page = 1;
					}

					for (vo of list) {
						str +=` 
            <div id="`+vo.cno+`" class="col-md-4">
                <div class="thumbnail">
                  <a href="${pageContext.request.contextPath}/detail/`+vo.cno+`" class="detail">
                  <img class="" src="`+vo.firstImageUrl+`" alt="camp${vo.cno}" style="height:217px;"
                    onerror="this.src='${pageContext.request.contextPath}/img/campsiteOnerror.jpg'">
                  </a>
                    <div class="caption">
                      <h2>`+vo.facltNm+`</h2>
                        <p>`+vo.lineIntro+`</p>
                            <hr>
                            <div class="button_base b03_skewed_slide_in">
                      <div>예약하기</div>
                      <div></div>
                      <div>예약하기</div>
                </div>


              </div>
            </div>
          </div>

            `
					;
					}

				
						document.querySelector('.container').insertAdjacentHTML('beforeend', str);
         

					isLoading = false;
				}); //end fetch

		} //end getList()

  const handleScroll = _.throttle(() => {
			console.log('throttle activate!');
			const scrollPosition = window.pageYOffset;
			const height = document.body.offsetHeight;
			const windowHeight = window.innerHeight;

			if(!isFinish) {
				if(scrollPosition%windowHeight<=height) {
				console.log('next Page call!');
        console.log('height'+height);
        console.log('scrollposition'+scrollPosition);
        console.log('windowHeight'+windowHeight);
        console.log('scrollPosition%windowHeight'+scrollPosition%windowHeight);
        console.log('${pageContext.request.contextPath}/around/' + page+'?location='+$sel1.value + '&theme='+$sel2.value);
				getList(++page, false);
			}
			}

		}, 1500);
    window.addEventListener('scroll', handleScroll);
    const $caption = document.querySelector('.thumbnail')
    $caption.onclick = (e) =>{
        
      console.log("rsv 클릭됨");
      if(!e.target.matches('.rsv')) return;
        window.location.href = $caption.querySelector('a').getAttribute('href');
        console.log($caption.querySelector('a').getAttribute('href'));



    }
  
</script>