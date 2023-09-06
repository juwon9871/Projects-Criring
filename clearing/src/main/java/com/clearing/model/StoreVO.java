package com.clearing.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
@AllArgsConstructor
@Getter
@Setter
@RequiredArgsConstructor
@NoArgsConstructor
public class StoreVO {
	@NonNull private String STORE_EMAIL;
	private String STORE_PW;
	private String STORE_NAME;
	private String STORE_ADDR;
	private String STORE_TEL;
	private int LAUNDRY_CNT;
	private int DRYER_CNT;
	private double LAT;
	private double LNG;
	private int cnt;
	
	// 일단 위도 경도만 받음
	public StoreVO(double LAT, double LNG) {
		this.LAT = LAT;
		this.LNG = LNG;
	}
}
