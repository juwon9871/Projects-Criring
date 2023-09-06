package com.clearing.model;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class admin_replyDTO {
	
	// 관리자 응답글 

	    // 응답 순번 
	    private int reply_seq;

	    // 질의 순번 
	    @NonNull private int req_seq;

	    // 응답 내용 
	    private String reply_content;

	    // 응답 사진 
	    private String reply_photo;

	    // 응답 일자 
	    private String reply_dt;

	    // 응답자 아이디 
	    private String admin_id;

	    public int getReplySeq() {
	        return reply_seq;
	    }

	    public void setReplySeq(int reply_seq) {
	        this.reply_seq = reply_seq;
	    }

	    public int getReqSeq() {
	        return req_seq;
	    }

	    public void setReqSeq(int req_seq) {
	        this.req_seq = req_seq;
	    }

	    public String getReplyContent() {
	        return reply_content;
	    }

	    public void setReplyContent(String reply_content) {
	        this.reply_content = reply_content;
	    }

	    public String getReplyPhoto() {
	        return reply_photo;
	    }

	    public void setReplyPhoto(String reply_photo) {
	        this.reply_photo = reply_photo;
	    }

	    public String getReplyDt() {
	        return reply_dt;
	    }

	    public void setReplyDt(String reply_dt) {
	        this.reply_dt = reply_dt;
	    }

	    public String getAdminId() {
	        return admin_id;
	    }

	    public void setAdminId(String admin_id) {
	        this.admin_id = admin_id;
	    }

	    // tbl_reply 모델 복사
	    public void CopyData(admin_replyDTO param)
	    {
	        this.reply_seq = param.getReplySeq();
	        this.req_seq = param.getReqSeq();
	        this.reply_content = param.getReplyContent();
	        this.reply_photo = param.getReplyPhoto();
	        this.reply_dt = param.getReplyDt();
	        this.admin_id = param.getAdminId();
	    }

		public admin_replyDTO() {
		}
	
}
