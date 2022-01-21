package com.meta.test.vo;

import lombok.Data;

//기존 Spring 프로젝트에서 사용했던
//그 Vo의 개념 맞습니다. 현재 제 sts에
//lombok적용이 안되어 있어서 getter, setter를
//명시를 해준 것.

@Data
public class TestVo {
	private int idx;
	private String title;
	private String writer;
	private int view_cnt;
	private String notice_yn;
	private String secret_yn;
	private String delete_yn;
	private String insert_time;
	private String update_time;
	private String delete_time;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getNotice_yn() {
		return notice_yn;
	}
	public void setNotice_yn(String notice_yn) {
		this.notice_yn = notice_yn;
	}
	public String getSecret_yn() {
		return secret_yn;
	}
	public void setSecret_yn(String secret_yn) {
		this.secret_yn = secret_yn;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getInsert_time() {
		return insert_time;
	}
	public void setInsert_time(String insert_time) {
		this.insert_time = insert_time;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getDelete_time() {
		return delete_time;
	}
	public void setDelete_time(String delete_time) {
		this.delete_time = delete_time;
	}
	@Override
	public String toString() {
		return "TestVo [idx=" + idx + ", title=" + title + ", writer=" + writer + ", view_cnt=" + view_cnt
				+ ", notice_yn=" + notice_yn + ", secret_yn=" + secret_yn + ", delete_yn=" + delete_yn
				+ ", insert_time=" + insert_time + ", update_time=" + update_time + ", delete_time=" + delete_time
				+ "]";
	}
	
	

}
