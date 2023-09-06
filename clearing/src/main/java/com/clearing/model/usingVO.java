package com.clearing.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
public class usingVO {
	// 세탁기 예약 정보

	// 사용 정보
	private int USING_SEQ;

	// 세탁기 순번
	private int laundry_seq;

	// 사용자 이메일
	@NonNull private String user_email;

	// 사용 시작 시간
	private String start_time;

	// 사용 종료 시간
	private String end_time;

	// 사용 날짜
	private String using_dt;

	// 결제 금액
	private int pay_amount;

	// 결제 여부
	private String pay_yn;
	
	private String store_name;
	
	public usingVO(String using_dt, String start_time) {
		this.using_dt = using_dt;
		this.start_time = start_time;
	}

	public usingVO(int laundry_seq, String user_email, String start_time, String end_time, String using_dt, int pay_amount, String pay_yn, String store_name) {
		this.store_name = store_name;
		this.laundry_seq = laundry_seq;
		this.user_email = user_email;
		this.start_time = start_time;
		this.end_time = end_time;
		this.using_dt = using_dt;
		this.pay_amount = pay_amount;
		this.pay_yn = pay_yn;
	}
}
