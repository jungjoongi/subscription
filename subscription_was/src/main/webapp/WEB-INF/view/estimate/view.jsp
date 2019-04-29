<tiles:insertDefinition name="FrontLayout">
	<tiles:putAttribute name="scriptPage">
		<script src="/spring-web-project/estimate/view.js?ver=1"></script>



	</tiles:putAttribute>

	<tiles:putAttribute name="cssPage">

	</tiles:putAttribute>

	<tiles:putAttribute name="contentAttr">

		<c:set var="payList" value="${listPay}" />
		<c:set var="memId" value="${memId}" />
		<c:set var="memo" value="${memMemo}" />

		<body>
			<div id="container" class="main">
				<section class="visual">
					<div class="visual-cont">
						<h1 id="count" style="display:none"></h1>
						<h2 style="margin-bottom:5px;text-align: center;">메모</h2>
						<div class="memoBox">
							<textarea id="memoText1" onKeyDown="javascript:estimateView.keyup(this, ${memId})">${memo.memMemo1}</textarea>
							<a class="memoBtn_${memId}" href="javascript:void(0)">입력</a>
						</div>
						<div class="memoBox">
							<textarea id="memoText2" onKeyDown="javascript:estimateView.keyup(this, ${memId})">${memo.memMemo2}</textarea>
							<a class="memoBtn_${memId}" href="javascript:void(0)">입력</a>
						</div>
						<div class="memoBox">
							<textarea id="memoText3" onKeyDown="javascript:estimateView.keyup(this, ${memId})">${memo.memMemo3}</textarea>
							<a class="memoBtn_${memId}" href="javascript:void(0)">입력</a>
						</div>
						<div class="memoBox">
							<textarea id="memoText4" onKeyDown="javascript:estimateView.keyup(this, ${memId})">${memo.memMemo4}</textarea>
							<a class="memoBtn_${memId}" href="javascript:void(0)">입력</a>
						</div>
						<h2 style="margin-bottom:20px;text-align: center;">예산테이블</h2>
						<div style="position:relative;">
							<table class="main-table" style="width:100%;margin-bottom:50px;text-align:center;">
								<thead style="width:100%;margin:auto;text-align:center;">
									<tr>
										<th style="min-width:100px;">날짜</th>
										<th style="min-width:80px;">구분</th>
										<th style="min-width:120px;">세부항목</th>
										<th style="min-width:80px;">예산</th>
										<th style="min-width:70px;">지출여부</th>
										<th style="min-width:60px;">할부여부</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody style="width:100%;margin:auto;text-align:center;">
									<c:forEach var="list" items="${list}">
										<c:if test="${list.memId eq memId}">
										<tr id="${list.no}" <c:if test='${list.isYn eq \'지출완료\'}'>class="isYn"</c:if>style="height:25px;border-bottom: 1px solid #eee;" onclick='estimateView.selectPop(${list.no})'>
										<td>${list.dates}</td>
										<td>${list.types}</td>
										<td>${list.list}</td>
										<td>${list.budget}</td>
										<td>${list.isYn}</td>
										<td>${list.payTypes}</td>
										<td>${list.remark}</td>
										</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<div id="modal" style="position:absolute;top:40%;left:50%;transform:translate(-50%,-50%);background-color:wheat;border: 2px dotted currentColor;padding:10px;display:none;clear:both;">

								<table class="frm">
									<colgroup>
										<col width="195">
										<col width="*">
									</colgroup>
									<tbody>
										<tr>
											<th>날짜</th>
											<td>
												<input id="update_date" type="date" style="width:125px;">
											</td>
										</tr>
										<tr>
											<th>구분</th>
											<td>
												<select id="update_types">
													<option value="갓피플">갓피플</option>
													<option value="집">집</option>
													<option value="결혼식">결혼식</option>
													<option value="신혼여행">신혼여행</option>
													<option value="인테리어">인테리어</option>
													<option value="가전">가전</option>
													<option value="부모님">부모님</option>
													<option value="FFFF">기타</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>세부항목</th>
											<td><input id="update_list" type="text"></td>
										</tr>
										<tr>
											<th>예산</th>
											<td><input id="update_budget" type="text" onclick="estimateView.comma(this);" onKeyup="estimateView.comma(this);"
												 style="width:90px"></td>
										</tr>
										<tr>
											<th>지출여부</th>
											<td>
												<select id="update_isYn">
													<option value="지출완료">지출완료</option>
													<option value="미지출">미지출</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>할부여부</th>
											<td>
												<select id="update_payTypes">
													<option value="일시불">일시불</option>
													<option value="할부">할부</option>
													<option value="미정">미정</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td>
												<input id="update_remark" type="text">
												<input id="update_no" type="hidden">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="pop-btn-group">
									<a href="javascript:void(0)" id="update-btn" style="color: black;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">수정하기</a>
									<a href="javascript:estimateView.deleteBtn()" id="delete-Yn" style="color:red;font-weight:bold;font-size:16px;">삭제하기</a>
									<a href="javascript:estimateView.close()" style="float:right;color:black;font-weight:bold;margin-right:5px;font-size: 16px;">닫기</a>
								</div>
								<div class="delete-form" style="display:none;position: absolute;background: white;z-index: 2;height: calc(100% - 100px);top: 0;left: 0;padding: 50px;width: calc(100% - 100px);">
									<h1 style="font-size: 24px;text-align: center;font-weight: bold;">정말로 삭제하시겠습니까?</h1>
									<a href="javascript:void(0)" id="delete-btn" style="color: red;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">삭제하기</a>
									<a href="javascript:estimateView.close()" style="color: black;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">닫기</a>
								</div>
							</div>
						</div>
						<div style="text-align:center">
							<span>총 예산 : ${payList.reTotal}원 | 지출금액 : ${payList.reCompleted} 원 | 남은 지출금액 : ${payList.reRequired}원</span>
						</div>
					</div>
				</section>
				<div id="content">
					<section>
						<div class="inputForm" style="margin:auto;text-align: center;">
							<span>항목 </span><input id="list" type="text" placeholder="ex)세탁기" style="width:110px;">
							<span>구분</span>
							<select id="type">
								<option value="갓피플">갓피플</option>
								<option value="집">집</option>
								<option value="결혼식">결혼식</option>
								<option value="신혼여행">신혼여행</option>
								<option value="인테리어">인테리어</option>
								<option value="가전">가전</option>
								<option value="부모님">부모님</option>
								<option value="FFFF">기타</option>
							</select>
							<span>날짜 </span><input id="date" type="date" style="width:120px;">
							<span>예산 </span><input id="budget" type="text" style="width:100px;" onkeyup="estimateView.comma(this);" onchange="estimateView.comma(this);">
							<br>
							<br>
							<span>지출여부 </span>
							<select id="isYn">
								<option value="미지출">미지출</option>
								<option value="지출완료">지출완료</option>
							</select>
							<span>할부여부 </span>
							<select id="payTypes">
								<option value="일시불">일시불</option>
								<option value="할부">할부</option>
								<option value="미정">미정</option>
							</select>
							<span>비고</span><input id="remark" type="text" style="width:200px;">
							<a href="javascript:estimateView.submit();" style="color: black;border: 1px dotted #444444;padding: 2px;">입력</a>
							<br>
							<br>
							<br>
						</div>
					</section>

				</div>
			</div>

			<div id="modal" style="position:absolute;top:40%;left:50%;transform:translate(-50%,-50%);background-color:wheat;border: 2px dotted currentColor;padding:10px;display:none;clear:both;">

				<table class="frm">
					<colgroup>
						<col width="195">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>날짜</th>
							<td>
								<input id="update_date" type="date" style="width:125px;">
							</td>
						</tr>
						<tr>
							<th>구분</th>
							<td>
								<select id="update_types">
									<option value="갓피플">갓피플</option>
									<option value="집">집</option>
									<option value="결혼식">결혼식</option>
									<option value="신혼여행">신혼여행</option>
									<option value="인테리어">인테리어</option>
									<option value="가전">가전</option>
									<option value="부모님">부모님</option>
									<option value="FFFF">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>세부항목</th>
							<td><input id="update_list" type="text"></td>
						</tr>
						<tr>
							<th>예산</th>
							<td><input id="update_budget" type="text" onclick="estimateView.comma(this);" onKeyup="estimateView.comma(this);"
								 style="width:90px"></td>
						</tr>
						<tr>
							<th>지출여부</th>
							<td>
								<select id="update_isYn">
									<option value="지출완료">지출완료</option>
									<option value="미지출">미지출</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>할부여부</th>
							<td>
								<select id="update_payTypes">
									<option value="일시불">일시불</option>
									<option value="할부">할부</option>
									<option value="미정">미정</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td>
								<input id="update_remark" type="text">
								<input id="update_no" type="hidden">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="pop-btn-group">
					<a href="javascript:void(0)" id="update-btn" style="color: black;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">수정하기</a>
					<a href="javascript:estimateView.deleteBtn()" id="delete-Yn" style="color:red;font-weight:bold;font-size:16px;">삭제하기</a>
					<a href="javascript:estimateView.close()" style="float:right;color:black;font-weight:bold;margin-right:5px;font-size: 16px;">닫기</a>
				</div>
				<div class="delete-form" style="display:none;position: absolute;background: white;z-index: 2;height: calc(100% - 100px);top: 0;left: 0;padding: 50px;width: calc(100% - 100px);">
					<h1 style="font-size: 24px;text-align: center;font-weight: bold;">정말로 삭제하시겠습니까?</h1>
					<a href="javascript:void(0)" id="delete-btn" style="color: red;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">삭제하기</a>
					<a href="javascript:estimateView.close()" style="color: black;font-weight: bold;font-size: 20px;display: block;text-align: center;margin: 20px 0 20px 0;background: #b1b1b1;">닫기</a>
				</div>
			</div>
			<div id="saveMsg"><span>자동저장 완료</span></div>
		</body>

	</tiles:putAttribute>

</tiles:insertDefinition>