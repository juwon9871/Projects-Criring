package com.clearing.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString

//업체 리뷰 
public class tbl_reviewListDTO {

 private Double review_seq;
@NonNull private String store_email;
 private String review_content;
 private String review_dt;
 private String user_email;
 private int review_shares;
 private int review_rating;
 private String review_photo;

 
}
