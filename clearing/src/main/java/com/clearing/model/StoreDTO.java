package com.clearing.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class StoreDTO {
	@NonNull private String STORE_EMAIL;
	@NonNull private String STORE_PW;
	private String STORE_NAME;
	private String STORE_ADDR;
	private String STORE_TEL;
	private int LAUNDRY_CNT;
	private int DRYER_CNT;
	private double LAT;
	private double LNG;
}
