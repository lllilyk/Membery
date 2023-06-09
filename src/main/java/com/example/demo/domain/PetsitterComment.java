package com.example.demo.domain;

import java.time.*;

import lombok.*;

@Data
public class PetsitterComment {
	private Integer id;
	private Integer detailId;
	private String memberId;
	private LocalDateTime inserted;
	private Integer defaultPetId;
	private String photo;
	private String body;
	private Integer star;
	private boolean editable;
}
