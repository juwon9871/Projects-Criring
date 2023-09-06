package com.clearing.model;

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
public class laundryVO {
	// 세탁기 순번
	private int laundry_seq;
	// 세탁기 명
	@NonNull private String laundry_name;
	// 업체 이메일
	private String store_email;
	// 사용 여부
	private String store_use;

	



	
}
