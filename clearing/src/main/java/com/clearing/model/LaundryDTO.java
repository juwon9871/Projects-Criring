package com.clearing.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LaundryDTO {
	private int laundry_seq;
	private String laundry_name;
	private String store_email;
	private char store_user;
	private int SERIAL_NO;

}
