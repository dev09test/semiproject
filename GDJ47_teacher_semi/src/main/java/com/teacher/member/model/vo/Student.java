package com.teacher.member.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Student {
	private String name;
	private int age;
	private String addr;
	private String gender;
}
