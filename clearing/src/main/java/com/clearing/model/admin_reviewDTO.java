package com.clearing.model;

import java.sql.Date;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class admin_reviewDTO {

    public admin_reviewDTO() {
	}

	// 리뷰 순번 
    private int review_seq;

    // 업체 이메일 
    @NonNull private String store_email;

    // 리뷰 내용 
    private String review_content;

    @NonNull private String user_email;
    // 리뷰 작성일자 
    private String review_dt;

    // 리뷰 작성자 

    // 리뷰 공감수 
    private Double review_shares;

    // 리뷰 평점 
    private Double review_rating;

    // 리뷰 사진 
    private String review_photo;
    
   
}
