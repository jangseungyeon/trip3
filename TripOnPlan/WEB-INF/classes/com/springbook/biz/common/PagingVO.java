package com.springbook.biz.common;

public class PagingVO {
	
	//총 목록수, 한페이지에 보여질 목록 수, 현재페이지 버튼
	private int totalPageCnt, onePageCnt, nowPageBtn;
	
	//총 버튼 수, 건너뛸 페이지 수
	private int totalBtnCnt, offset;
	
	//한 번에 보여질 버튼 수, 시작버튼, 종료버튼
	private int oneBtnCnt, startBtn, endBtn;
	

	public PagingVO(int totalPageCnt, int onePageCnt, int nowPageBtn, int oneBtnCnt) { // 214, 10, 1
		this.totalPageCnt = totalPageCnt;
		this.onePageCnt = onePageCnt;
		this.nowPageBtn = nowPageBtn;
		this.oneBtnCnt = oneBtnCnt;
		setTotalBtnCnt();
		setOffset();
		setStartEnd();
	}

	//총 버튼 수 구하기
	public void setTotalBtnCnt() {
		if(totalPageCnt % onePageCnt ==0) {
			this.totalBtnCnt = totalPageCnt / onePageCnt;
		}else {
			this.totalBtnCnt = totalPageCnt / onePageCnt +1;
		}
	}
	
	//건너띌 개수 구하기
	public void setOffset() {
		this.offset = (nowPageBtn -1 ) * onePageCnt;
	}

	//시작버튼, 종료버튼 번호 구하기
	public void setStartEnd() {
		if(nowPageBtn % oneBtnCnt == 0) {
			this.startBtn = (nowPageBtn / oneBtnCnt -1) * oneBtnCnt +1;
		}else {
			this.startBtn = ( nowPageBtn / oneBtnCnt * oneBtnCnt +1);
		}
		this.endBtn = startBtn + oneBtnCnt-1;
		//종료버튼이 총 버튼 수와 같거나 작아야한다.
		if(endBtn > totalBtnCnt) endBtn = totalBtnCnt;
	}
	
	public int getOnePageCnt() {
		return onePageCnt;
	}

	public int getTotalBtnCnt() {
		return totalBtnCnt;
	}

	public int getNowPageBtn() {
		return nowPageBtn;
	}

	public int getOffset() {
		return offset;
	}

	
	
	public int getOneBtnCnt() {
		return oneBtnCnt;
	}

	public int getTotalPageCnt() {
		return totalPageCnt;
	}

	public int getStartBtn() {
		return startBtn;
	}

	public int getEndBtn() {
		return endBtn;
	}
	
}
