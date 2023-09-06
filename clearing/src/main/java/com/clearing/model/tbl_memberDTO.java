package com.clearing.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
//일반회원 
public class tbl_memberDTO {

 @NonNull private String mb_email;

 private String mb_pw;
 private String mb_name;
 private String mb_addr;
 private Date mb_joindate;
 private String admin_yn;
 private int mb_penalty;

 
}
