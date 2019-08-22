package com.spring.paging;

public class Criteria {
	private int id;
	private int bfr_bno;
	private int bs_bno;
	private int mi_code;
	private int cc_code;
    private int page; // 현재 페이지 번호
    private int perPageNum; // 한페이지당 보여줄 게시물의 개수
    private int mml_num;

    public int getMml_num() {
		return mml_num;
	}
	public void setMml_num(int mml_num) {
		this.mml_num = mml_num;
	}

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
    public void setId(int id) {
    	this.id = id;
    }
    public int getId() {
    	return id;
    }
    public void setPage(int page) {

        if (page <= 0) { // 페이지가 0보다 작은경우 디폴트 1페이지로 지정
            this.page = 1;
            return;
        }

        this.page = page;
    }

    public int getPage() {
        return page;
    }

    public void setPerPageNum(int perPageNum) {

        if (perPageNum <= 0 || perPageNum > 100) {
            this.perPageNum = 10;
            return;
        }

        this.perPageNum = perPageNum;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

    public int getBfr_bno() {
		return bfr_bno;
	}

	public void setBfr_bno(int bfr_bno) {
		this.bfr_bno = bfr_bno;
	}

	public int getPageStart() {
        return (this.page - 1) * perPageNum; // 현재 페이지의 시작번호 = (현재페이지 - 1) * 페이지 당 출력할 게시물의 개수
    }

    @Override
    public String toString() {
        return "Criteria{" +
                "page=" + page +
                ", perPageNum=" + perPageNum +
                '}';
    }

	public int getBs_bno() {
		return bs_bno;
	}

	public void setBs_bno(int bs_bno) {
		this.bs_bno = bs_bno;
	}

	public int getMi_code() {
		return mi_code;
	}

	public void setMi_code(int mi_code) {
		this.mi_code = mi_code;
	}

	public int getCc_code() {
		return cc_code;
	}

	public void setCc_code(int cc_code) {
		this.cc_code = cc_code;
	}
	
	
}
