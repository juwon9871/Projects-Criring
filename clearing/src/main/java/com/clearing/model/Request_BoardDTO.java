package com.clearing.model;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

// 질의 게시판 
@RequiredArgsConstructor
public class Request_BoardDTO {

    // 질의 순번 
    @NonNull private int req_seq;

    // 질의 제목 
    private String req_title;

    // 질의 내용 
    private String req_content;

    // 질의 파일 
    private String req_file;

    // 질의 작성일자 
    private String req_dt;

    // 질의 작성자 
    private String req_email;

    // 질의자 구분 
    private String req_type;

    public int getReqSeq() {
        return req_seq;
    }

    public void setReqSeq(int req_seq) {
        this.req_seq = req_seq;
    }

    public String getReqTitle() {
        return req_title;
    }

    public void setReqTitle(String req_title) {
        this.req_title = req_title;
    }

    public String getReqContent() {
        return req_content;
    }

    public void setReqContent(String req_content) {
        this.req_content = req_content;
    }

    public String getReqFile() {
        return req_file;
    }

    public void setReqFile(String req_file) {
        this.req_file = req_file;
    }

    public String getReqDt() {
        return req_dt;
    }

    public void setReqDt(String req_dt) {
        this.req_dt = req_dt;
    }

    public String getReqEmail() {
        return req_email;
    }

    public void setReqEmail(String req_email) {
        this.req_email = req_email;
    }

    public String getReqType() {
        return req_type;
    }

    public void setReqType(String req_type) {
        this.req_type = req_type;
    }

    // tbl_request 모델 복사
    public void CopyData(Request_BoardDTO param)
    {
        this.req_seq = param.getReqSeq();
        this.req_title = param.getReqTitle();
        this.req_content = param.getReqContent();
        this.req_file = param.getReqFile();
        this.req_dt = param.getReqDt();
        this.req_email = param.getReqEmail();
        this.req_type = param.getReqType();
    }

	public Request_BoardDTO() {
	}
}